.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DetailImageDownloader"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 325
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;-><init>()V

    return-void
.end method


# virtual methods
.method public download(Landroid/content/Context;JZ)Ljava/lang/String;
    .registers 31
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "notify"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 348
    const-string v2, "null context"

    move-object/from16 v0, p1

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 350
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getManifestVersion(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    move-result-object v20

    .line 351
    .local v20, "manifest":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    const-string v2, "null manifest"

    move-object/from16 v0, v20

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 353
    invoke-virtual/range {v20 .. v20}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v8

    .line 354
    .local v8, "baseUrl":Ljava/lang/String;
    const-string v2, "null baseUrl"

    invoke-static {v2, v8}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 356
    const/16 v22, 0x0

    .line 357
    .local v22, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    const/4 v10, 0x0

    .line 359
    .local v10, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/content"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 360
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "pack_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "pack_identifier"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "content_id"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "content_packId"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    .line 362
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;->getRemoteUrlColumnName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x5

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;->getLocalPathColumnName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 359
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 366
    .local v11, "cursor":Landroid/database/Cursor;
    if-eqz v11, :cond_82

    .line 368
    :try_start_71
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 369
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v22

    .line 370
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    :try_end_7e
    .catchall {:try_start_71 .. :try_end_7e} :catchall_c9

    move-result-object v10

    .line 373
    :cond_7f
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 377
    :cond_82
    const-string v2, "null pack"

    move-object/from16 v0, v22

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 378
    const-string v2, "null content"

    invoke-static {v2, v10}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 380
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;->getRemotePath(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)Ljava/lang/String;

    move-result-object v24

    .line 381
    .local v24, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;->getLocalPath(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)Ljava/lang/String;

    move-result-object v19

    .line 384
    .local v19, "localPath":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_ce

    .line 385
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 386
    .local v17, "file":Ljava/io/File;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "localPath exists: %b"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 388
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_ce

    .line 389
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 437
    .end local v17    # "file":Ljava/io/File;
    :goto_c8
    return-object v2

    .line 373
    .end local v19    # "localPath":Ljava/lang/String;
    .end local v24    # "url":Ljava/lang/String;
    :catchall_c9
    move-exception v2

    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    .line 393
    .restart local v19    # "localPath":Ljava/lang/String;
    .restart local v24    # "url":Ljava/lang/String;
    :cond_ce
    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_105

    .line 394
    const-string v2, "http://"

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_105

    const-string v2, "https://"

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_105

    const-string v2, "file://"

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_105

    .line 395
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 403
    :cond_105
    invoke-virtual/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v18

    .line 404
    .local v18, "identifier":Ljava/lang/String;
    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getId()J

    move-result-wide v12

    .line 406
    .local v12, "contentId":J
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;->getCacheDirName()Ljava/lang/String;

    move-result-object v9

    .line 407
    .local v9, "cacheDirName":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->getCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v14

    .line 408
    .local v14, "destDir":Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "destination directory is null: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v14}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 410
    new-instance v15, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v14, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 412
    .local v15, "destFile":Ljava/io/File;
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->hunt(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v16

    .line 414
    .local v16, "downloadStream":Ljava/io/InputStream;
    new-instance v21, Ljava/io/FileOutputStream;

    move-object/from16 v0, v21

    invoke-direct {v0, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 415
    .local v21, "outputStream":Ljava/io/OutputStream;
    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 417
    invoke-static/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 418
    invoke-static/range {v21 .. v21}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 420
    new-instance v25, Landroid/content/ContentValues;

    invoke-direct/range {v25 .. v25}, Landroid/content/ContentValues;-><init>()V

    .line 421
    .local v25, "values":Landroid/content/ContentValues;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$DetailImageDownloader;->getLocalPathColumnName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/content/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/update"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 429
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 428
    move-object/from16 v0, v25

    invoke-virtual {v2, v3, v0, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v23

    .line 431
    .local v23, "result":I
    const-string v3, "failed to update the provider"

    if-lez v23, :cond_1bf

    const/4 v2, 0x1

    :goto_1b1
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 433
    if-eqz p4, :cond_1b9

    .line 434
    invoke-static/range {p1 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackContentUpdate(Landroid/content/Context;J)V

    .line 437
    :cond_1b9
    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_c8

    .line 431
    :cond_1bf
    const/4 v2, 0x0

    goto :goto_1b1
.end method

.method protected getCacheDirName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 343
    const-string v0, "aviary-cds-detail-image-cache"

    return-object v0
.end method

.method protected getLocalPath(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)Ljava/lang/String;
    .registers 3
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .prologue
    .line 339
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDetailImageLocalPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getLocalPathColumnName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 331
    const-string v0, "content_detailImageLocalPath"

    return-object v0
.end method

.method protected getRemotePath(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)Ljava/lang/String;
    .registers 3
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .prologue
    .line 335
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDetailImageURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getRemoteUrlColumnName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 327
    const-string v0, "content_detailImageURL"

    return-object v0
.end method
