.class final Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;
.super Ljava/lang/Object;
.source "CdsDefaultContentLoader.java"


# static fields
.field private static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-string v0, "CdsDefaultContentLoader"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    .line 174
    return-void
.end method

.method private extractContent(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .registers 17
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "zipFileName"    # Ljava/lang/String;
    .param p3, "packIdentifier"    # Ljava/lang/String;
    .param p4, "packId"    # J
    .param p6, "packType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;,
            Landroid/content/res/Resources$NotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 454
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "extractContent: %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p3, v8, v9

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 456
    const-string v6, "file:///android_asset/"

    invoke-virtual {p2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1d

    .line 457
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "not a local file. skipping"

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 486
    :goto_1c
    return-void

    .line 461
    :cond_1d
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 462
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const-string v6, "file:///android_asset/"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v1

    .line 463
    .local v1, "assetPrefixLength":I
    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 464
    .local v2, "filePath":Ljava/lang/String;
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "filePath: %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v2, v8, v9

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 466
    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 468
    .local v5, "stream":Ljava/io/InputStream;
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Extracting "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 470
    new-instance v3, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackItemsContentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 471
    .local v3, "packageDirectory":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 472
    const-string v6, "failed to create output dir"

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v7

    invoke-static {v6, v7}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 474
    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7}, Ljava/io/File;->setReadable(ZZ)Z

    .line 477
    :try_start_91
    invoke-static {v5, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->unzip(Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_94
    .catchall {:try_start_91 .. :try_end_94} :catchall_bf

    .line 479
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 482
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, p4, p5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->updateContentPath(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;)I

    move-result v4

    .line 483
    .local v4, "result":I
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updateContentPath result: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 485
    if-lez v4, :cond_c4

    const/4 v6, 0x1

    :goto_ba
    invoke-static {v6}, Ljunit/framework/Assert;->assertTrue(Z)V

    goto/16 :goto_1c

    .line 479
    .end local v4    # "result":I
    :catchall_bf
    move-exception v6

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v6

    .line 485
    .restart local v4    # "result":I
    :cond_c4
    const/4 v6, 0x0

    goto :goto_ba
.end method

.method private extractIcon(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 24
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "iconFileName"    # Ljava/lang/String;
    .param p3, "packIdentifier"    # Ljava/lang/String;
    .param p4, "packId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;,
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 410
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "extractIcon: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p3, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 412
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    .line 413
    .local v8, "assetManager":Landroid/content/res/AssetManager;
    const-string v2, "Not a local file"

    const-string v3, "file:///android_asset/"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 415
    const-string v2, "file:///android_asset/"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    .line 416
    .local v9, "assetPrefixLength":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 417
    .local v10, "filePath":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .line 419
    .local v11, "fileUri":Landroid/net/Uri;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "filePath: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v10, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 421
    invoke-virtual {v8, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v17

    .line 423
    .local v17, "stream":Ljava/io/InputStream;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackIconPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 424
    .local v15, "iconPath":Ljava/lang/String;
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 425
    .local v13, "iconDir":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->mkdirs()Z

    .line 426
    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v2

    invoke-static {v2}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 428
    new-instance v14, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v11}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v14, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 429
    .local v14, "iconFile":Ljava/io/File;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "iconFilePath: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 431
    new-instance v12, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    invoke-direct {v12, v14, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 433
    .local v12, "foStream":Ljava/io/FileOutputStream;
    :try_start_c1
    move-object/from16 v0, v17

    invoke-static {v0, v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_c6
    .catchall {:try_start_c1 .. :try_end_c6} :catchall_e2

    .line 435
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 436
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 439
    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-wide/from16 v4, p4

    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->updateIconPath(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;I)I

    move-result v16

    .line 440
    .local v16, "result":I
    if-lez v16, :cond_ea

    const/4 v2, 0x1

    :goto_de
    invoke-static {v2}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 441
    return-void

    .line 435
    .end local v16    # "result":I
    :catchall_e2
    move-exception v2

    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 436
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v2

    .line 440
    .restart local v16    # "result":I
    :cond_ea
    const/4 v2, 0x0

    goto :goto_de
.end method

.method private insertNewPackContentAndItems(Landroid/database/sqlite/SQLiteDatabase;[Landroid/content/ContentValues;)J
    .registers 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "values"    # [Landroid/content/ContentValues;

    .prologue
    .line 363
    if-eqz p2, :cond_53

    const/4 v6, 0x1

    :goto_3
    invoke-static {v6}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 364
    array-length v6, p2

    const/4 v7, 0x2

    if-le v6, v7, :cond_55

    const/4 v6, 0x1

    :goto_b
    invoke-static {v6}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 367
    const-wide/16 v2, -0x1

    .line 370
    .local v2, "packId":J
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "insert pack, content and items: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, p2

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 378
    const/4 v6, 0x0

    aget-object v1, p2, v6

    .line 379
    .local v1, "value":Landroid/content/ContentValues;
    const-string v6, "packs_table"

    invoke-static {v6, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v2

    .line 380
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-gez v6, :cond_57

    .line 381
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "packId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 382
    const-wide/16 v2, -0x1

    .line 405
    .end local v2    # "packId":J
    :cond_52
    :goto_52
    return-wide v2

    .line 363
    .end local v1    # "value":Landroid/content/ContentValues;
    :cond_53
    const/4 v6, 0x0

    goto :goto_3

    .line 364
    :cond_55
    const/4 v6, 0x0

    goto :goto_b

    .line 386
    .restart local v1    # "value":Landroid/content/ContentValues;
    .restart local v2    # "packId":J
    :cond_57
    const/4 v6, 0x1

    aget-object v1, p2, v6

    .line 387
    const-string v6, "content_packId"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 388
    const-string v6, "content_table"

    invoke-static {v6, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v4

    .line 389
    .local v4, "rowId":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gez v6, :cond_8a

    .line 390
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "rowId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 391
    const-wide/16 v2, -0x1

    goto :goto_52

    .line 395
    :cond_8a
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_8b
    array-length v6, p2

    if-ge v0, v6, :cond_52

    .line 396
    aget-object v1, p2, v0

    .line 397
    const-string v6, "item_packId"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 398
    const-string v6, "items_table"

    invoke-static {v6, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v4

    .line 399
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gez v6, :cond_c0

    .line 400
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "itemId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 401
    const-wide/16 v2, -0x1

    goto :goto_52

    .line 395
    :cond_c0
    add-int/lit8 v0, v0, 0x1

    goto :goto_8b
.end method

.method private loadPackContent(Landroid/database/sqlite/SQLiteDatabase;Lorg/json/JSONObject;Z)V
    .registers 31
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "jsonObject"    # Lorg/json/JSONObject;
    .param p3, "includeContent"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 245
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "loadPackContent"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 247
    new-instance v22, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;

    invoke-direct/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;-><init>()V

    .line 248
    .local v22, "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->parse(Lorg/json/JSONObject;)I

    move-result v4

    if-eqz v4, :cond_20

    .line 249
    new-instance v4, Ljunit/framework/AssertionFailedError;

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getStatus()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljunit/framework/AssertionFailedError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 252
    :cond_20
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    .line 253
    .local v7, "identifier":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPackType()Ljava/lang/String;

    move-result-object v10

    .line 255
    .local v10, "packType":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "loadPackContent: %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v25, 0x0

    aput-object v10, v6, v25

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 257
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 260
    .local v11, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentValues;>;"
    new-instance v21, Landroid/content/ContentValues;

    invoke-direct/range {v21 .. v21}, Landroid/content/ContentValues;-><init>()V

    .line 261
    .local v21, "packValues":Landroid/content/ContentValues;
    const-string v4, "pack_identifier"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    const-string v4, "pack_type"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    const-string v4, "pack_versionKey"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getVersionKey()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    const-string v4, "pack_visible"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 265
    const-string v4, "pack_displayOrder"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 266
    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 270
    .local v13, "contentValues":Landroid/content/ContentValues;
    const-string v4, "content_displayName"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    const-string v4, "content_displayDescription"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDisplayDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->normalizeUrlForDatabase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 274
    .local v12, "contentUrl":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->normalizeUrlForDatabase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 275
    .local v17, "iconUrl":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->normalizeUrlForDatabase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 276
    .local v15, "featureImageUrl":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->normalizeUrlForDatabase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 277
    .local v23, "previewUrl":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->normalizeUrlForDatabase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 279
    .local v14, "detailImageUrl":Ljava/lang/String;
    const-string v4, "content_contentURL"

    invoke-virtual {v13, v4, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string v5, "content_isFreeWithLogin"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->isFreeWithLogin()Z

    move-result v4

    if-eqz v4, :cond_1af

    const/4 v4, 0x1

    :goto_c3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 281
    const-string v4, "content_contentVersion"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v4, "content_iconUrl"

    move-object/from16 v0, v17

    invoke-virtual {v13, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    const-string v4, "content_iconVersion"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    const-string v5, "content_isFree"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->isFree()Z

    move-result v4

    if-eqz v4, :cond_1b2

    const/4 v4, 0x1

    :goto_ec
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 285
    const-string v4, "content_shopBackgroundColor"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getShopBackgroundColor()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    const-string v4, "content_author"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getAuthor()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string v4, "content_authorHyperlink"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getAuthorHyperlink()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    const-string v4, "content_socialMediaString"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getSocialMediaString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string v4, "content_numItems"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getItems()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 290
    const-string v4, "content_featureImageURL"

    invoke-virtual {v13, v4, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const-string v4, "content_featureImageVersion"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v4, "content_previewURL"

    move-object/from16 v0, v23

    invoke-virtual {v13, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    const-string v4, "content_previewVersion"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    const-string v4, "content_detailImageURL"

    invoke-virtual {v13, v4, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    const-string v4, "content_detailImageVersion"

    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    if-eqz p3, :cond_160

    .line 298
    const-string v4, "content_purchased"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 301
    :cond_160
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 304
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getItems()Ljava/util/List;

    move-result-object v19

    .line 305
    .local v19, "items":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;>;"
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_169
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v4

    move/from16 v0, v16

    if-ge v0, v4, :cond_1b5

    .line 306
    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;

    .line 307
    .local v18, "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 308
    .local v20, "itemsValues":Landroid/content/ContentValues;
    const-string v4, "item_identifier"

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    const-string v4, "item_displayName"

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getOptions()[B

    move-result-object v4

    if-eqz v4, :cond_1a7

    .line 311
    const-string v4, "item_options"

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getOptions()[B

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 313
    :cond_1a7
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    add-int/lit8 v16, v16, 0x1

    goto :goto_169

    .line 280
    .end local v16    # "i":I
    .end local v18    # "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    .end local v19    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;>;"
    .end local v20    # "itemsValues":Landroid/content/ContentValues;
    :cond_1af
    const/4 v4, 0x0

    goto/16 :goto_c3

    .line 284
    :cond_1b2
    const/4 v4, 0x0

    goto/16 :goto_ec

    .line 317
    .restart local v16    # "i":I
    .restart local v19    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;>;"
    :cond_1b5
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Landroid/content/ContentValues;

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v24

    check-cast v24, [Landroid/content/ContentValues;

    .line 319
    .local v24, "values":[Landroid/content/ContentValues;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->insertNewPackContentAndItems(Landroid/database/sqlite/SQLiteDatabase;[Landroid/content/ContentValues;)J

    move-result-wide v8

    .line 321
    .local v8, "packId":J
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "added pack: %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v25, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    aput-object v26, v6, v25

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 323
    const-wide/16 v4, -0x1

    cmp-long v4, v8, v4

    if-lez v4, :cond_200

    const/4 v4, 0x1

    :goto_1e4
    invoke-static {v4}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 326
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconURL()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct/range {v4 .. v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->extractIcon(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;J)V

    .line 327
    if-eqz p3, :cond_1ff

    .line 328
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentURL()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct/range {v4 .. v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->extractContent(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 330
    :cond_1ff
    return-void

    .line 323
    :cond_200
    const/4 v4, 0x0

    goto :goto_1e4
.end method

.method private static normalizeUrlForDatabase(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 334
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 335
    const-string p0, ""

    .line 344
    .end local p0    # "url":Ljava/lang/String;
    .local v0, "uri":Landroid/net/Uri;
    :goto_8
    return-object p0

    .line 337
    .end local v0    # "uri":Landroid/net/Uri;
    .restart local p0    # "url":Ljava/lang/String;
    :cond_9
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "normalizeUrlForDatabase: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 338
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 339
    .restart local v0    # "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_96

    .line 340
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "return: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "http://assets.aviary.com"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6e

    move-object v1, p0

    :goto_47
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 341
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://assets.aviary.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_82

    .end local p0    # "url":Ljava/lang/String;
    :goto_65
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_8

    .line 340
    .restart local p0    # "url":Ljava/lang/String;
    :cond_6e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_47

    .line 341
    :cond_82
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_65

    .line 343
    :cond_96
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "return: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto/16 :goto_8
.end method

.method private updateManifestVersion(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "manifestVersion"    # Ljava/lang/String;
    .param p3, "assetsURL"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 235
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 236
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "version_versionKey"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    const-string v3, "version_assetsBaseURL"

    invoke-virtual {v2, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    const-string v3, "version_table"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 239
    .local v0, "id":J
    const-wide/16 v4, -0x1

    cmp-long v3, v0, v4

    if-lez v3, :cond_21

    const/4 v3, 0x1

    :goto_1d
    invoke-static {v3}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 240
    return-void

    .line 239
    :cond_21
    const/4 v3, 0x0

    goto :goto_1d
.end method


# virtual methods
.method public loadDefaultContent(Landroid/database/sqlite/SQLiteDatabase;)Z
    .registers 15
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    const/4 v12, 0x1

    const/4 v3, 0x0

    const/4 v11, 0x0

    .line 182
    const-string v1, "version_table"

    new-array v2, v12, [Ljava/lang/String;

    const-string v0, "version_id"

    aput-object v0, v2, v11

    const-string v8, "1"

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 185
    .local v9, "cursor":Landroid/database/Cursor;
    if-eqz v9, :cond_2d

    .line 187
    :try_start_18
    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_2a

    .line 188
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "database is not empty"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V
    :try_end_25
    .catchall {:try_start_18 .. :try_end_25} :catchall_3c

    .line 192
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    move v0, v11

    .line 230
    :goto_29
    return v0

    .line 192
    :cond_2a
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 196
    :cond_2d
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 197
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Failed to load default content because db is readOnly."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    move v0, v11

    .line 198
    goto :goto_29

    .line 192
    :catchall_3c
    move-exception v0

    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .line 201
    :cond_41
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 202
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Beginning load default content transaction"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 205
    :try_start_4b
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{\"packType\":\"effect\",\"displayName\":\"Original\",\"displayDescription\":\"Get started with this free pack of essential effects for beautiful, everyday photography.\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.be9be7e9-745f-4234-a84b-b0e043618328.300.jpg\",\"iconVersion\":\"10e000b71ff1fc07b275f460783850f7\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"previewURL\":\"/cdsv2/assets/com.aviary.effectpack.04/zips.androidPreviewPhoneXXHiRes.4e8edf7f-538b-4afa-bb63-3f5327b51436.zip\",\"previewVersion\":\"29318948dc1b06497c6887fbd1dc0f7f\",\"contentURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.effectJSON.235ff3a1-fdd8-4d16-b625-517945f61c82.zip\",\"contentVersion\":\"b74040f3396d01906ff02a346dfd4f21\",\"isFree\":true,\"pcnPriceTier\":0,\"identifier\":\"com.aviary.effectpack.04\",\"featureImageURL\":\"/cdsv2/testcontent/com.aviary.effectpack.04/images.androidFeatureImage.81f193b2-d02c-4dba-8811-31a77b359fbb.980.jpg\",\"featureImageVersion\":\"0\",\"detailImageURL\":\"/cdsv2/testcontent/com.aviary.effectpack.04/images.androidDetailImage.dff72372-7f7e-4bc1-aa98-88ac17fb5457.1080.jpg\",\"detailImageVersion\":\"0\",\"items\":[{\"identifier\":\"default5\",\"displayName\":\"Clyde\"},{\"identifier\":\"default10\",\"displayName\":\"Avenue\"},{\"identifier\":\"default2\",\"displayName\":\"Haas\"},{\"identifier\":\"default9\",\"displayName\":\"Arizona\"},{\"identifier\":\"default11\",\"displayName\":\"Lucky\"},{\"identifier\":\"default1\",\"displayName\":\"Dean\"},{\"identifier\":\"default8\",\"displayName\":\"Keylime\"},{\"identifier\":\"default3\",\"displayName\":\"Boardwalk\"},{\"identifier\":\"default7\",\"displayName\":\"Sentosa\"},{\"identifier\":\"default13\",\"displayName\":\"Sage\"},{\"identifier\":\"default6\",\"displayName\":\"Metropolis\"},{\"identifier\":\"default12\",\"displayName\":\"Cruz\"}],\"versionKey\":\"53a0643f5920039d84000167\",\"v\":1404419997941,\"code\":0,\"status\":\"Ok\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->loadPackContent(Landroid/database/sqlite/SQLiteDatabase;Lorg/json/JSONObject;Z)V

    .line 206
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{\"packType\":\"sticker\",\"displayName\":\"Original\",\"displayDescription\":\"Decorate all of your photos with this fun and totally free pack of hats, eyewear, neckwear, speech bubbles, shapes and more!\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.593086a0-76eb-44a5-9285-2459e4660bd8.300.png\",\"iconVersion\":\"94e5bb72e131575b612a49c68c95bbd3\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"shopBackgroundColor\":\"#1c2027\",\"featureImageURL\":\"/cdsv2/assets/com.aviary.sticker.53d185cc6b76fe302f001cde/images.androidFeatureImage.faedc45c-e914-4bd4-95f7-5ebeccb781be.980.jpg\",\"featureImageVersion\":\"e8c8e313e8c7f73563d412749f961a80\",\"detailImageURL\":\"file:///android_asset/aviary/cdsv2/assets/images.androidDetailImage.9cdb2f88-b089-458a-9f23-76400c261b0b.1080.jpg\",\"detailImageVersion\":\"81a734b8cdc31dcb8dcd5663cd382645\",\"previewURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.androidPreviewHiRes.733886ea-16cc-4292-8af7-6b3c78caa187.zip\",\"previewVersion\":\"b21916443b1bdcb699e6f99bab5bea6c\",\"contentURL\":\"/cdsv2/assets/com.aviary.sticker.53d185cc6b76fe302f001cde/zips.contentAndroidHiRes.0137fe97-9900-480e-bacc-51ed4128ca46.zip\",\"contentVersion\":\"2139119ea57de6f295d5ae2274ba8c14\",\"isFree\":true,\"pcnPriceTier\":2,\"identifier\":\"com.aviary.sticker.53d185cc6b76fe302f001cde\",\"items\":[{\"identifier\":\"original-bolt\",\"displayName\":\"Original Bolt\"},{\"identifier\":\"original-money\",\"displayName\":\"Original Money\"},{\"identifier\":\"original-mustache\",\"displayName\":\"Original Mustache\"},{\"identifier\":\"original-arrow\",\"displayName\":\"Original Arrow\"},{\"identifier\":\"original-arrowcross\",\"displayName\":\"Original Arrowcross\"},{\"identifier\":\"original-beauty\",\"displayName\":\"Original Beauty\"},{\"identifier\":\"original-circle\",\"displayName\":\"Original Circle\"},{\"identifier\":\"original-circlestripe\",\"displayName\":\"Original Circlestripe\"},{\"identifier\":\"original-embellishment\",\"displayName\":\"Original Embellishment\"},{\"identifier\":\"original-eyelashL\",\"displayName\":\"Original EyelashL\"},{\"identifier\":\"original-eyelashR\",\"displayName\":\"Original EyelashR\"},{\"identifier\":\"original-glasses\",\"displayName\":\"Original Glasses\"},{\"identifier\":\"original-hand1\",\"displayName\":\"Original Hand1\"},{\"identifier\":\"original-hand2\",\"displayName\":\"Original Hand2\"},{\"identifier\":\"original-hexagon\",\"displayName\":\"Original Hexagon\"},{\"identifier\":\"original-kitchen\",\"displayName\":\"Original Kitchen\"},{\"identifier\":\"original-lips\",\"displayName\":\"Original Lips\"},{\"identifier\":\"original-love\",\"displayName\":\"Original Love\"},{\"identifier\":\"original-skull\",\"displayName\":\"Original Skull\"},{\"identifier\":\"original-sombrero\",\"displayName\":\"Original Sombrero\"},{\"identifier\":\"original-square\",\"displayName\":\"Original Square\"},{\"identifier\":\"original-stars\",\"displayName\":\"Original Stars\"},{\"identifier\":\"original-truth\",\"displayName\":\"Original Truth\"},{\"identifier\":\"original-wreath\",\"displayName\":\"Original Wreath\"}],\"versionKey\":\"53dfa8b965374ff32600025e\",\"v\":1411160277221,\"assetsBaseURL\":\"http://assets.aviary.com\",\"code\":0,\"status\":\"Ok\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->loadPackContent(Landroid/database/sqlite/SQLiteDatabase;Lorg/json/JSONObject;Z)V

    .line 207
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{\"packType\":\"frame\",\"displayName\":\"Original\",\"displayDescription\":\"A collection of beautiful, versatile frames to get you started with Aviary.\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.7b749c3b-f657-4c39-8919-9f065caef753.300.png\",\"iconVersion\":\"4c1240a2312b16c113b5704fd277a4d7\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"shopBackgroundColor\":\"#1c2027\",\"featureImageURL\":\"/cdsv2/assets/com.aviary.frame.53ced8b78abeb3083b001e4a/images.androidFeatureImage.31ad3bc8-af49-4a00-9445-1463854ad589.980.jpg\",\"featureImageVersion\":\"edfa3dcb2a52de25edc38e3349920cc3\",\"detailImageURL\":\"file:///android_asset/aviary/cdsv2/assets/images.androidDetailImage.9cf957a7-be64-4dbb-818b-63ba2854dec9.1080.jpg\",\"detailImageVersion\":\"0a1f306453a963546067379785c9828b\",\"previewURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.androidPreviewHiRes.783ecc43-f4fa-4818-9a87-97b1c84f68ee.zip\",\"previewVersion\":\"546b8a102022342dc2d2dc000a90a5a0\",\"contentURL\":\"/cdsv2/assets/com.aviary.frame.53ced8b78abeb3083b001e4a/zips.contentAndroidHiRes.51b9118e-1527-4a42-bea9-856adff83db3.zip\",\"contentVersion\":\"3820dfc8be90338a24fbf5abdb3c07a9\",\"isFree\":true,\"pcnPriceTier\":2,\"identifier\":\"com.aviary.frame.53ced8b78abeb3083b001e4a\",\"items\":[{\"identifier\":\"original-Aura\",\"displayName\":\"Aura\",\"options\":{\"width\":0.5}},{\"identifier\":\"original-Borde\",\"displayName\":\"Borde\",\"options\":{\"width\":0.5}},{\"identifier\":\"original-Lumen\",\"displayName\":\"Lumen\",\"options\":{\"width\":0.3}},{\"identifier\":\"original-Noir\",\"displayName\":\"Noir\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Stella\",\"displayName\":\"Stella\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Notte\",\"displayName\":\"Notte\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Vela\",\"displayName\":\"Vela\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Capa\",\"displayName\":\"Capa\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Sole\",\"displayName\":\"Sole\",\"options\":{\"width\":0.4}},{\"identifier\":\"original-Luna\",\"displayName\":\"Luna\",\"options\":{\"width\":0.4}},{\"identifier\":\"original-Fino\",\"displayName\":\"Fino\",\"options\":{\"width\":0.5}},{\"identifier\":\"original-Rima\",\"displayName\":\"Rima\",\"options\":{\"width\":0.5}}],\"versionKey\":\"53cedd7e8abeb3083b001fc1\",\"v\":1411160596064,\"assetsBaseURL\":\"http://assets.aviary.com\",\"code\":0,\"status\":\"Ok\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->loadPackContent(Landroid/database/sqlite/SQLiteDatabase;Lorg/json/JSONObject;Z)V

    .line 208
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{\"packType\":\"overlay\",\"displayName\":\"Original\",\"displayDescription\":\"Explore Overlays with a free starter pack of classic, sharable shapes. Pro Tip: Pinch your photo in or out to perfectly place the overlay!\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.e9d184f0-e91d-46e1-afc2-56096684a954.300.png\",\"iconVersion\":\"4f5885e76982129580ba42c72937c6a4\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"shopBackgroundColor\":\"#1c2027\",\"featureImageURL\":\"/cdsv2/assets/com.aviary.overlay.54384c3ffd87927c3c000001/images.androidFeatureImage.d4f40ea1-14ce-43f4-b091-c0968b743e31.980.jpg\",\"featureImageVersion\":\"16022ce5993f9020b9587017784206ee\",\"detailImageURL\":\"file:///android_asset/aviary/cdsv2/assets/images.androidDetailImage.5e96bfcc-62ec-4a4c-bf3b-20f3cf295bd2.1080.jpg\",\"detailImageVersion\":\"a28b079ac99cc6ddc0d47574ef41e133\",\"previewURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.androidPreviewHiRes.9153b745-c9fc-4228-8038-aa82ad3dfa74.zip\",\"previewVersion\":\"b9263f146ac845e43248d67b5e271b68\",\"contentURL\":\"/cdsv2/assets/com.aviary.overlay.54384c3ffd87927c3c000001/zips.contentAndroidHiRes.636f77f1-da87-48da-a294-377e0fc1d5d7.zip\",\"contentVersion\":\"254e626c3d990e27e341cd25867e12ee\",\"isFree\":true,\"isFreeWithLogin\":false,\"pcnPriceTier\":2,\"identifier\":\"com.aviary.overlay.54384c3ffd87927c3c000001\",\"items\":[{\"identifier\":\"Circle 1\",\"displayName\":\"Circle 1\"},{\"identifier\":\"Circle 2\",\"displayName\":\"Circle 2\"},{\"identifier\":\"Cross 1\",\"displayName\":\"Cross 1\"},{\"identifier\":\"Cross 2\",\"displayName\":\"Cross 2\"},{\"identifier\":\"Hex 1\",\"displayName\":\"Hex 1\"},{\"identifier\":\"Hex 2\",\"displayName\":\"Hex 2\"},{\"identifier\":\"Vertical 1\",\"displayName\":\"Vertical 1\"},{\"identifier\":\"Vertical 2\",\"displayName\":\"Vertical 2\"},{\"identifier\":\"Scape 1\",\"displayName\":\"Scape 1\"},{\"identifier\":\"Scape 2\",\"displayName\":\"Scape 2\"},{\"identifier\":\"Square 1\",\"displayName\":\"Square 1\"},{\"identifier\":\"Square 2\",\"displayName\":\"Square 2\"}],\"versionKey\":\"54f4e8b7eba8dc6a3e062888\",\"v\":1427205395409,\"assetsBaseURL\":\"http://assets.aviary.com\",\"code\":0,\"status\":\"Ok\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->loadPackContent(Landroid/database/sqlite/SQLiteDatabase;Lorg/json/JSONObject;Z)V

    .line 209
    const-string v0, "0"

    const-string v1, "http://assets.aviary.com"

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->updateManifestVersion(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_81} :catch_94
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_81} :catch_b4
    .catchall {:try_start_4b .. :try_end_81} :catchall_cc

    .line 225
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "finally"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 226
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 229
    :goto_8b
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Load default content success"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    move v0, v12

    .line 230
    goto :goto_29

    .line 211
    :catch_94
    move-exception v10

    .line 215
    .local v10, "e":Ljava/io/IOException;
    :try_start_95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isStandalone(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a9

    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->mContext:Landroid/content/Context;

    const-string v1, "Cannot install the default effects. Please make sure you\'ve included the assets folder from the CreativeSDKImage project!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 218
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_a9
    .catchall {:try_start_95 .. :try_end_a9} :catchall_cc

    .line 225
    :cond_a9
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "finally"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 226
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_8b

    .line 220
    .end local v10    # "e":Ljava/io/IOException;
    :catch_b4
    move-exception v10

    .line 221
    .local v10, "e":Ljava/lang/Throwable;
    :try_start_b5
    invoke-virtual {v10}, Ljava/lang/Throwable;->printStackTrace()V

    .line 222
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Error in JSON parsing."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V
    :try_end_bf
    .catchall {:try_start_b5 .. :try_end_bf} :catchall_cc

    .line 225
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "finally"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 226
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move v0, v11

    goto/16 :goto_29

    .line 225
    .end local v10    # "e":Ljava/lang/Throwable;
    :catchall_cc
    move-exception v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "finally"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 226
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method

.method public updateContentPath(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;)I
    .registers 11
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "packId"    # J
    .param p4, "path"    # Ljava/lang/String;

    .prologue
    .line 489
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 490
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "content_contentPath"

    invoke-virtual {v0, v1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 491
    const-string v1, "content_installDate"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    const-string v1, "content_table"

    const-string v2, "content_packId=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 493
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 492
    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public updateIconPath(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;I)I
    .registers 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "packId"    # J
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "iconNeedDownload"    # I

    .prologue
    .line 444
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 445
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "content_iconPath"

    invoke-virtual {v0, v1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    const-string v1, "content_iconNeedDownload"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 447
    const-string v1, "content_table"

    const-string v2, "content_packId=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 448
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 447
    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method
