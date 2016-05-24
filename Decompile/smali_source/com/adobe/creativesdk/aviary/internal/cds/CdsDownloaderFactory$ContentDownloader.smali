.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ContentDownloader"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 441
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;-><init>()V

    return-void
.end method

.method private createExternalDownloadDirectory()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 606
    const-string v3, "External storage is not available"

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader;->getExternalStorageAvailable()Z

    move-result v4

    invoke-static {v3, v4}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 609
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_22

    .line 610
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    .line 619
    .local v0, "dst":Ljava/lang/String;
    :goto_11
    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 620
    .local v2, "root":Ljava/io/File;
    if-eqz v2, :cond_25

    .line 624
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 625
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 644
    :goto_21
    return-object v3

    .line 612
    .end local v0    # "dst":Ljava/lang/String;
    .end local v2    # "root":Ljava/io/File;
    :cond_22
    const-string v0, "temp"

    .restart local v0    # "dst":Ljava/lang/String;
    goto :goto_11

    .line 630
    .restart local v2    # "root":Ljava/io/File;
    :cond_25
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_26
    const/16 v3, 0xa

    if-ge v1, v3, :cond_5e

    .line 634
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 635
    if-eqz v2, :cond_5b

    .line 636
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_4a

    .line 637
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 639
    :cond_4a
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_5b

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 640
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    goto :goto_21

    .line 630
    :cond_5b
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 644
    :cond_5e
    const/4 v3, 0x0

    goto :goto_21
.end method

.method private getExternalStorageAvailable()Z
    .registers 3

    .prologue
    .line 651
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 652
    .local v0, "state":Ljava/lang/String;
    const-string v1, "checking"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    :cond_14
    const/4 v1, 0x1

    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method


# virtual methods
.method public download(Landroid/content/Context;JZ)Ljava/lang/String;
    .registers 39
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "notify"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 447
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "download{packId:%d, notify: %b}"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static/range {p4 .. p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 448
    const-string v4, "Invalid Context"

    move-object/from16 v0, p1

    invoke-static {v4, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 450
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getManifestVersion(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    move-result-object v26

    .line 451
    .local v26, "manifest":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    const-string v4, "Failed to retrieve manifest"

    move-object/from16 v0, v26

    invoke-static {v4, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 453
    invoke-virtual/range {v26 .. v26}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v10

    .line 454
    .local v10, "baseUrl":Ljava/lang/String;
    const-string v4, "Failed to retrieve baseUrl"

    invoke-static {v4, v10}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 456
    const/16 v27, 0x0

    .line 457
    .local v27, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    const/4 v12, 0x0

    .line 459
    .local v12, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pack/id/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, p2

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/content"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 460
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x7

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "pack_id"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-string v8, "pack_identifier"

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-string v8, "pack_type"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-string v8, "content_id"

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-string v8, "content_packId"

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-string v8, "content_contentURL"

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-string v8, "content_displayName"

    aput-object v8, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 459
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 465
    .local v13, "cursor":Landroid/database/Cursor;
    if-eqz v13, :cond_9b

    .line 467
    :try_start_8a
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_98

    .line 468
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v27

    .line 469
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    :try_end_97
    .catchall {:try_start_8a .. :try_end_97} :catchall_2b9

    move-result-object v12

    .line 472
    :cond_98
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 476
    :cond_9b
    const-string v4, "Invalid pack informations"

    move-object/from16 v0, v27

    invoke-static {v4, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 477
    const-string v4, "Invalid pack\'s content informations"

    invoke-static {v4, v12}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 478
    const-string v4, "Invalid Context"

    invoke-static {v4, v12}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 480
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getContentURL()Ljava/lang/String;

    move-result-object v32

    .line 481
    .local v32, "url":Ljava/lang/String;
    invoke-static/range {v32 .. v32}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_dd

    .line 482
    const-string v4, "http://"

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_dd

    const-string v4, "https://"

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_dd

    .line 483
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    .line 490
    :cond_dd
    invoke-virtual/range {v27 .. v27}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v25

    .line 493
    .local v25, "identifier":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "packDownloadStatus/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, p2

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 494
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "download_refId"

    aput-object v8, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 493
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 500
    .local v22, "downloadStatusCursor":Landroid/database/Cursor;
    const-string v4, "download"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/app/DownloadManager;

    .line 502
    .local v20, "downloadManager":Landroid/app/DownloadManager;
    const/16 v17, 0x0

    .line 504
    .local v17, "downloadCursor":Landroid/database/Cursor;
    if-eqz v22, :cond_1d9

    :try_start_11d
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1d9

    .line 505
    const-string v4, "download_refId"

    .line 506
    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    .line 507
    .local v18, "downloadId":J
    new-instance v16, Landroid/app/DownloadManager$Query;

    invoke-direct/range {v16 .. v16}, Landroid/app/DownloadManager$Query;-><init>()V

    .line 508
    .local v16, "dlQuery":Landroid/app/DownloadManager$Query;
    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    aput-wide v18, v4, v5

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    .line 509
    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v17

    .line 511
    if-eqz v17, :cond_17a

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_17a

    .line 512
    const-string v4, "status"

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 513
    .local v11, "columnIndex":I
    move-object/from16 v0, v17

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 514
    .local v30, "status":I
    const-string v4, "uri"

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 515
    const/4 v4, -0x1

    if-le v11, v4, :cond_2be

    move-object/from16 v0, v17

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v31

    .line 517
    .local v31, "uri":Ljava/lang/String;
    :goto_170
    sparse-switch v30, :sswitch_data_340

    .line 541
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "not handled"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 547
    .end local v11    # "columnIndex":I
    .end local v30    # "status":I
    .end local v31    # "uri":Ljava/lang/String;
    :cond_17a
    :goto_17a
    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    aput-wide v18, v4, v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/app/DownloadManager;->remove([J)I

    .line 548
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pack/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, p2

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/delete_download_entry"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 550
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 549
    invoke-virtual {v4, v5, v6, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v29

    .line 552
    .local v29, "result":I
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v29

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " entries deleted in download_packs_table for packId "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, p2

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 553
    if-nez v29, :cond_1d9

    .line 554
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "failed to remove download entry"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_1d9
    .catchall {:try_start_11d .. :try_end_1d9} :catchall_2f8

    .line 558
    .end local v16    # "dlQuery":Landroid/app/DownloadManager$Query;
    .end local v18    # "downloadId":J
    .end local v29    # "result":I
    :cond_1d9
    invoke-static/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 559
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 562
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_31b

    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v15

    .line 563
    .local v15, "displayName":Ljava/lang/String;
    :goto_1e9
    invoke-static/range {v32 .. v32}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v24

    .line 564
    .local v24, "downloadUri":Landroid/net/Uri;
    new-instance v28, Landroid/app/DownloadManager$Request;

    move-object/from16 v0, v28

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 567
    .local v28, "request":Landroid/app/DownloadManager$Request;
    invoke-virtual/range {v24 .. v24}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_31f

    .line 568
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v27 .. v27}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".temp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 573
    .local v14, "destFilename":Ljava/lang/String;
    :goto_221
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader;->createExternalDownloadDirectory()Ljava/lang/String;

    move-result-object v21

    .line 577
    .local v21, "downloadPath":Ljava/lang/String;
    const-string v4, "Failed to create directory to download contents"

    move-object/from16 v0, v21

    invoke-static {v4, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 578
    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 579
    move-object/from16 v0, v28

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v14}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 581
    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v18

    .line 586
    .restart local v18    # "downloadId":J
    new-instance v23, Landroid/content/ContentValues;

    invoke-direct/range {v23 .. v23}, Landroid/content/ContentValues;-><init>()V

    .line 587
    .local v23, "downloadTableValues":Landroid/content/ContentValues;
    const-string v4, "download_packId"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 588
    const-string v4, "download_refId"

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 591
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "insertPacksDownloadTable"

    .line 592
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    move-object/from16 v0, v23

    invoke-virtual {v4, v5, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v31

    .line 593
    .local v31, "uri":Landroid/net/Uri;
    const-string v4, "Failed to insert data into the database"

    move-object/from16 v0, v31

    invoke-static {v4, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 595
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "download/id/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v18

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/updateStatus/1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 596
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 595
    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v29

    .line 598
    .restart local v29    # "result":I
    if-lez v29, :cond_2b4

    if-eqz p4, :cond_2b4

    .line 599
    invoke-virtual/range {v27 .. v27}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    move-object/from16 v0, p1

    move-wide/from16 v1, p2

    invoke-static {v0, v1, v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyDownloadStatusChange(Landroid/content/Context;JLjava/lang/String;I)V

    .line 601
    :cond_2b4
    invoke-virtual/range {v31 .. v31}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v31

    .end local v14    # "destFilename":Ljava/lang/String;
    .end local v15    # "displayName":Ljava/lang/String;
    .end local v21    # "downloadPath":Ljava/lang/String;
    .end local v23    # "downloadTableValues":Landroid/content/ContentValues;
    .end local v24    # "downloadUri":Landroid/net/Uri;
    .end local v28    # "request":Landroid/app/DownloadManager$Request;
    .end local v29    # "result":I
    .end local v31    # "uri":Landroid/net/Uri;
    :goto_2b8
    return-object v31

    .line 472
    .end local v17    # "downloadCursor":Landroid/database/Cursor;
    .end local v18    # "downloadId":J
    .end local v20    # "downloadManager":Landroid/app/DownloadManager;
    .end local v22    # "downloadStatusCursor":Landroid/database/Cursor;
    .end local v25    # "identifier":Ljava/lang/String;
    .end local v32    # "url":Ljava/lang/String;
    :catchall_2b9
    move-exception v4

    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v4

    .line 515
    .restart local v11    # "columnIndex":I
    .restart local v16    # "dlQuery":Landroid/app/DownloadManager$Query;
    .restart local v17    # "downloadCursor":Landroid/database/Cursor;
    .restart local v18    # "downloadId":J
    .restart local v20    # "downloadManager":Landroid/app/DownloadManager;
    .restart local v22    # "downloadStatusCursor":Landroid/database/Cursor;
    .restart local v25    # "identifier":Ljava/lang/String;
    .restart local v30    # "status":I
    .restart local v32    # "url":Ljava/lang/String;
    :cond_2be
    const/16 v31, 0x0

    goto/16 :goto_170

    .line 519
    .local v31, "uri":Ljava/lang/String;
    :sswitch_2c2
    :try_start_2c2
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The download for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " has already started with downloadId "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v18

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V
    :try_end_2e8
    .catchall {:try_start_2c2 .. :try_end_2e8} :catchall_2f8

    .line 558
    invoke-static/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 559
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_2b8

    .line 525
    :sswitch_2ef
    :try_start_2ef
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "Download failed, trying again"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V
    :try_end_2f6
    .catchall {:try_start_2ef .. :try_end_2f6} :catchall_2f8

    goto/16 :goto_17a

    .line 558
    .end local v11    # "columnIndex":I
    .end local v16    # "dlQuery":Landroid/app/DownloadManager$Query;
    .end local v18    # "downloadId":J
    .end local v30    # "status":I
    .end local v31    # "uri":Ljava/lang/String;
    :catchall_2f8
    move-exception v4

    invoke-static/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 559
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v4

    .line 529
    .restart local v11    # "columnIndex":I
    .restart local v16    # "dlQuery":Landroid/app/DownloadManager$Query;
    .restart local v18    # "downloadId":J
    .restart local v30    # "status":I
    .restart local v31    # "uri":Ljava/lang/String;
    :sswitch_300
    :try_start_300
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "Download is pending"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto/16 :goto_17a

    .line 533
    :sswitch_309
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "Download is paused"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto/16 :goto_17a

    .line 537
    :sswitch_312
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "Download was successful, but restarting"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V
    :try_end_319
    .catchall {:try_start_300 .. :try_end_319} :catchall_2f8

    goto/16 :goto_17a

    .line 562
    .end local v11    # "columnIndex":I
    .end local v16    # "dlQuery":Landroid/app/DownloadManager$Query;
    .end local v18    # "downloadId":J
    .end local v30    # "status":I
    .end local v31    # "uri":Ljava/lang/String;
    :cond_31b
    const-string v15, "Downloading"

    goto/16 :goto_1e9

    .line 570
    .restart local v15    # "displayName":Ljava/lang/String;
    .restart local v24    # "downloadUri":Landroid/net/Uri;
    .restart local v28    # "request":Landroid/app/DownloadManager$Request;
    :cond_31f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v24 .. v24}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .restart local v14    # "destFilename":Ljava/lang/String;
    goto/16 :goto_221

    .line 517
    :sswitch_data_340
    .sparse-switch
        0x1 -> :sswitch_300
        0x2 -> :sswitch_2c2
        0x4 -> :sswitch_309
        0x8 -> :sswitch_312
        0x10 -> :sswitch_2ef
    .end sparse-switch
.end method
