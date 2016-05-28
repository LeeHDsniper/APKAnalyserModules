.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;
.super Landroid/content/BroadcastReceiver;
.source "CdsReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;
    }
.end annotation


# static fields
.field static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 65
    const-string v0, "AdobeImageCdsReceiver"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 543
    return-void
.end method

.method private getDeleteDownloadAlarmPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # J

    .prologue
    .line 447
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 448
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "aviary.android.cds.intent.action.ACTION_REMOVE_DOWNLOAD_CONTENT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 449
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 451
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".AdobeImageCdsReceiver/removeDownloadedPack/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 450
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 449
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 453
    const-string v1, "entryId"

    invoke-virtual {v0, v1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 454
    const/4 v1, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p1, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method private getPackIdFromDownload(Landroid/database/Cursor;)J
    .registers 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 463
    if-eqz p1, :cond_16

    .line 464
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 465
    const-string v1, "download_packId"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 466
    .local v0, "index":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_16

    .line 467
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 471
    .end local v0    # "index":I
    :goto_15
    return-wide v2

    :cond_16
    const-wide/16 v2, -0x1

    goto :goto_15
.end method

.method private getPreferences(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 209
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v0

    return-object v0
.end method

.method private handleActionDownloadComplete(Landroid/content/Context;J)V
    .registers 28
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "downloadId"    # J
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 267
    const-string v2, "download"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/app/DownloadManager;

    .line 270
    .local v10, "downloadManager":Landroid/app/DownloadManager;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "downloadPackId/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 271
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "download_packId"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 270
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v16

    .line 277
    .local v16, "packIdCursor":Landroid/database/Cursor;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->getPackIdFromDownload(Landroid/database/Cursor;)J

    move-result-wide v14

    .line 278
    .local v14, "packId":J
    invoke-static/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 280
    const-wide/16 v2, -0x1

    cmp-long v2, v14, v2

    if-nez v2, :cond_4a

    .line 380
    :goto_49
    return-void

    .line 284
    :cond_4a
    new-instance v18, Landroid/app/DownloadManager$Query;

    invoke-direct/range {v18 .. v18}, Landroid/app/DownloadManager$Query;-><init>()V

    .line 285
    .local v18, "query":Landroid/app/DownloadManager$Query;
    const/4 v2, 0x1

    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide p2, v2, v3

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    .line 287
    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v8

    .line 292
    .local v8, "downloadCursor":Landroid/database/Cursor;
    if-eqz v8, :cond_246

    :try_start_62
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_246

    .line 293
    const-string v2, "status"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 295
    .local v20, "statusIndex":I
    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "pack_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "pack_type"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "pack_identifier"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "content_id"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "content_packId"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "content_iconPath"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "content_displayName"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "content_displayDescription"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "content_purchased"

    aput-object v4, v2, v3

    move-object/from16 v0, p1

    invoke-static {v0, v14, v15, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackContentById(Landroid/content/Context;J[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v13

    .line 308
    .local v13, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-eqz v13, :cond_ae

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v2

    if-nez v2, :cond_dc

    .line 309
    :cond_ae
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    const-string v3, "Pack information not found...fatal database error"

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v2
    :try_end_b8
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException; {:try_start_62 .. :try_end_b8} :catch_b8
    .catchall {:try_start_62 .. :try_end_b8} :catchall_1af

    .line 371
    .end local v13    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v20    # "statusIndex":I
    :catch_b8
    move-exception v12

    .line 372
    .local v12, "e":Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;
    :try_start_b9
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "Package needs redownload"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 373
    const/4 v2, 0x1

    new-array v2, v2, [J

    const/4 v3, 0x0

    aput-wide p2, v2, v3

    invoke-virtual {v10, v2}, Landroid/app/DownloadManager;->remove([J)I

    .line 374
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;->getMessage()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14, v15, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->setNotificationForRedownloadPackage(Landroid/content/Context;JLjava/lang/String;)V
    :try_end_d4
    .catchall {:try_start_b9 .. :try_end_d4} :catchall_1af

    .line 377
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 378
    invoke-direct/range {p0 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->setDeleteDownloadAlarm(Landroid/content/Context;J)V

    goto/16 :goto_49

    .line 312
    .end local v12    # "e":Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;
    .restart local v13    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .restart local v20    # "statusIndex":I
    :cond_dc
    :try_start_dc
    move/from16 v0, v20

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 313
    .local v11, "downloadStatus":I
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "downloadStatus: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 315
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "download/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/updateStatus/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 316
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 315
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v19

    .line 321
    .local v19, "result":I
    if-lez v19, :cond_13c

    .line 322
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v14, v15, v2, v11}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyDownloadStatusChange(Landroid/content/Context;JLjava/lang/String;I)V

    .line 325
    :cond_13c
    sparse-switch v11, :sswitch_data_288

    .line 362
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "not handled: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V
    :try_end_157
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException; {:try_start_dc .. :try_end_157} :catch_b8
    .catchall {:try_start_dc .. :try_end_157} :catchall_1af

    .line 377
    :goto_157
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 378
    invoke-direct/range {p0 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->setDeleteDownloadAlarm(Landroid/content/Context;J)V

    goto/16 :goto_49

    .line 328
    :sswitch_15f
    :try_start_15f
    const-string v2, "local_uri"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 330
    .local v22, "uriString":Ljava/lang/String;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "uriString: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 332
    if-eqz v22, :cond_1e0

    .line 333
    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    .line 334
    .local v21, "uri":Landroid/net/Uri;
    invoke-virtual/range {v21 .. v21}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v17

    .line 336
    .local v17, "path":Ljava/lang/String;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "path: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v17, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 338
    if-eqz v17, :cond_1b7

    .line 339
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 340
    .local v9, "downloadFile":Ljava/io/File;
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v13, v2, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleDownloadSuccessful(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;Ljava/io/File;)V
    :try_end_1ae
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException; {:try_start_15f .. :try_end_1ae} :catch_b8
    .catchall {:try_start_15f .. :try_end_1ae} :catchall_1af

    goto :goto_157

    .line 377
    .end local v9    # "downloadFile":Ljava/io/File;
    .end local v11    # "downloadStatus":I
    .end local v13    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v17    # "path":Ljava/lang/String;
    .end local v19    # "result":I
    .end local v20    # "statusIndex":I
    .end local v21    # "uri":Landroid/net/Uri;
    .end local v22    # "uriString":Ljava/lang/String;
    :catchall_1af
    move-exception v2

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 378
    invoke-direct/range {p0 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->setDeleteDownloadAlarm(Landroid/content/Context;J)V

    throw v2

    .line 342
    .restart local v11    # "downloadStatus":I
    .restart local v13    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .restart local v17    # "path":Ljava/lang/String;
    .restart local v19    # "result":I
    .restart local v20    # "statusIndex":I
    .restart local v21    # "uri":Landroid/net/Uri;
    .restart local v22    # "uriString":Ljava/lang/String;
    :cond_1b7
    :try_start_1b7
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download failed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 343
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Path is null"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v2

    .line 347
    .end local v17    # "path":Ljava/lang/String;
    .end local v21    # "uri":Landroid/net/Uri;
    :cond_1e0
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download failed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 348
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Uri string is null"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v2

    .line 354
    .end local v22    # "uriString":Ljava/lang/String;
    :sswitch_209
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download failed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 356
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x10

    const-string v5, "reason"

    .line 359
    invoke-interface {v8, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v8, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 357
    invoke-static {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getReasonText(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v2

    .line 367
    .end local v11    # "downloadStatus":I
    .end local v13    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v19    # "result":I
    .end local v20    # "statusIndex":I
    :cond_246
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download cursor for downloadId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not valid."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 368
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "throw the exception"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 369
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Try to download again item id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v2
    :try_end_288
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException; {:try_start_1b7 .. :try_end_288} :catch_b8
    .catchall {:try_start_1b7 .. :try_end_288} :catchall_1af

    .line 325
    :sswitch_data_288
    .sparse-switch
        0x8 -> :sswitch_15f
        0x10 -> :sswitch_209
    .end sparse-switch
.end method

.method private handleActionDownloadPacksContent(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 213
    const-string v5, "entryId"

    const-wide/16 v6, -0x1

    invoke-virtual {p2, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 214
    .local v2, "packId":J
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->CONTENT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v0

    .line 217
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    :try_start_e
    invoke-virtual {v0, p1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    .line 218
    .local v4, "resultUri":Ljava/lang/String;
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "result: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_2a} :catch_2b

    .line 222
    .end local v4    # "resultUri":Ljava/lang/String;
    :goto_2a
    return-void

    .line 219
    :catch_2b
    move-exception v1

    .line 220
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p1, v2, v3, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->setNotificationForRedownloadPackage(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_2a
.end method

.method private handleConnectivityChange(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 164
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 165
    .local v0, "action":Ljava/lang/String;
    const-string v7, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8c

    .line 166
    const-string v7, "networkInfo"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/NetworkInfo;

    .line 167
    .local v3, "netInfo":Landroid/net/NetworkInfo;
    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v8

    if-ne v7, v8, :cond_8d

    move v1, v5

    .line 168
    .local v1, "connected":Z
    :goto_1f
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "connected: %b"

    new-array v9, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v9, v6

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 169
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    if-eq v7, v5, :cond_43

    .line 170
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    const/4 v8, 0x6

    if-eq v7, v8, :cond_43

    .line 171
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    const/16 v8, 0x9

    if-ne v7, v8, :cond_8f

    :cond_43
    move v2, v5

    .line 172
    .local v2, "isWifi":Z
    :goto_44
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "isWifi: %b"

    new-array v9, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v9, v6

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 173
    if-eqz v1, :cond_91

    if-eqz v2, :cond_91

    sget-object v7, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v8

    if-ne v7, v8, :cond_91

    move v1, v5

    .line 175
    :goto_60
    if-eqz v1, :cond_93

    .line 176
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "CONNECTED"

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 178
    const-string v6, "wifi-connected"

    invoke-static {p1, v6}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCdsInitIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 179
    .local v4, "newIntent":Landroid/content/Intent;
    const-string v6, "extra-lazy-execution"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 180
    const-string v6, "extra-execute-wifi-only"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 181
    const-string v6, "extra-execute-plugged-only"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 182
    const-string v6, "extra-download-extra-assets"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 183
    const-string v5, "extra-max-items"

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 184
    invoke-virtual {p1, v4}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 189
    .end local v1    # "connected":Z
    .end local v2    # "isWifi":Z
    .end local v3    # "netInfo":Landroid/net/NetworkInfo;
    .end local v4    # "newIntent":Landroid/content/Intent;
    :cond_8c
    :goto_8c
    return-void

    .restart local v3    # "netInfo":Landroid/net/NetworkInfo;
    :cond_8d
    move v1, v6

    .line 167
    goto :goto_1f

    .restart local v1    # "connected":Z
    :cond_8f
    move v2, v6

    .line 171
    goto :goto_44

    .restart local v2    # "isWifi":Z
    :cond_91
    move v1, v6

    .line 173
    goto :goto_60

    .line 186
    :cond_93
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "not connected"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v5, v7, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_8c
.end method

.method private handleDeleteDownloadEntry(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 225
    if-eqz p2, :cond_26

    .line 226
    const-string v1, "entryId"

    const-wide/16 v4, -0x1

    invoke-virtual {p2, v1, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 228
    .local v2, "id":J
    const-string v1, "download"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    .line 229
    .local v0, "downloadManager":Landroid/app/DownloadManager;
    if-eqz v0, :cond_26

    .line 230
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-ge v1, v4, :cond_1d

    .line 231
    invoke-direct {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->tryDeleteDownloadedFile(Landroid/app/DownloadManager;J)V

    .line 233
    :cond_1d
    const/4 v1, 0x1

    new-array v1, v1, [J

    const/4 v4, 0x0

    aput-wide v2, v1, v4

    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->remove([J)I

    .line 236
    .end local v0    # "downloadManager":Landroid/app/DownloadManager;
    .end local v2    # "id":J
    :cond_26
    return-void
.end method

.method private handleDownloadSuccessful(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;Ljava/io/File;)V
    .registers 24
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "pack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .param p3, "content"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    .param p4, "downloadFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v16

    .line 391
    .local v16, "packId":J
    invoke-virtual/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getPackId()J

    move-result-wide v6

    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v9, p4

    invoke-direct/range {v4 .. v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->validatePackContentZip(Landroid/content/Context;JLjava/lang/String;Ljava/io/File;)Z

    move-result v18

    .line 392
    .local v18, "validated":Z
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "content is valid: %b"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 394
    if-eqz v18, :cond_f1

    .line 396
    :try_start_29
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->unpackZipFile(Ljava/io/File;Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_36} :catch_ba
    .catchall {:try_start_29 .. :try_end_36} :catchall_d8

    move-result-object v10

    .line 409
    .local v10, "contentDirectory":Ljava/io/File;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "deleting downloadFile.."

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 410
    invoke-static/range {p4 .. p4}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 413
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 414
    .local v11, "contentValues":Landroid/content/ContentValues;
    const-string v4, "content_contentPath"

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pack/id/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 418
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/content/id/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getId()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/updatePurchasedStatus/1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 417
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 416
    invoke-virtual {v4, v5, v11, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v15

    .line 420
    .local v15, "updated":I
    if-lez v15, :cond_e9

    .line 421
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackTypeContentUpdated(Landroid/content/Context;Ljava/lang/String;)V

    .line 422
    move-object/from16 v0, p1

    move-wide/from16 v1, v16

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackContentUpdate(Landroid/content/Context;J)V

    .line 423
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    move-object/from16 v0, p1

    move-wide/from16 v1, v16

    invoke-static {v0, v1, v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackInstalled(Landroid/content/Context;JLjava/lang/String;I)V

    .line 433
    :goto_a8
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    move-result-object v4

    invoke-virtual/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getIconPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->notifyPackInstalled(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    return-void

    .line 397
    .end local v10    # "contentDirectory":Ljava/io/File;
    .end local v11    # "contentValues":Landroid/content/ContentValues;
    .end local v15    # "updated":I
    :catch_ba
    move-exception v12

    .line 398
    .local v12, "e":Ljava/lang/Throwable;
    :try_start_bb
    invoke-virtual {v12}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_be
    .catchall {:try_start_bb .. :try_end_be} :catchall_d8

    .line 401
    :try_start_be
    new-instance v14, Ljava/io/File;

    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackItemsContentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v14, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 402
    .local v14, "file":Ljava/io/File;
    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z
    :try_end_ce
    .catch Ljava/lang/Exception; {:try_start_be .. :try_end_ce} :catch_e4
    .catchall {:try_start_be .. :try_end_ce} :catchall_d8

    .line 406
    .end local v14    # "file":Ljava/io/File;
    :goto_ce
    :try_start_ce
    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    const-string v5, "Error in unpacking zip file."

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v4
    :try_end_d8
    .catchall {:try_start_ce .. :try_end_d8} :catchall_d8

    .line 409
    .end local v12    # "e":Ljava/lang/Throwable;
    :catchall_d8
    move-exception v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "deleting downloadFile.."

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 410
    invoke-static/range {p4 .. p4}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z

    throw v4

    .line 403
    .restart local v12    # "e":Ljava/lang/Throwable;
    :catch_e4
    move-exception v13

    .line 404
    .local v13, "ex":Ljava/lang/Exception;
    :try_start_e5
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_e8
    .catchall {:try_start_e5 .. :try_end_e8} :catchall_d8

    goto :goto_ce

    .line 431
    .end local v12    # "e":Ljava/lang/Throwable;
    .end local v13    # "ex":Ljava/lang/Exception;
    .restart local v10    # "contentDirectory":Ljava/io/File;
    .restart local v11    # "contentValues":Landroid/content/ContentValues;
    .restart local v15    # "updated":I
    :cond_e9
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "failed to update the db"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_a8

    .line 435
    .end local v10    # "contentDirectory":Ljava/io/File;
    .end local v11    # "contentValues":Landroid/content/ContentValues;
    .end local v15    # "updated":I
    :cond_f1
    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;

    const-string v5, "Package contents are not valid"

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V

    throw v4
.end method

.method private handleNotificationDismiss(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 195
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->cancelPackInstalledNotification(Landroid/content/Context;)V

    .line 196
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleNotificationDismissed(Landroid/content/Context;)V

    .line 197
    return-void
.end method

.method private handleNotificationDismissed(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->getPreferences(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v0

    .line 204
    .local v0, "prefs":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    const-string v1, "aviary.notifications.packs_installed_count"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->remove(Ljava/lang/String;)V

    .line 205
    const-string v1, "aviary.notifications.packs_installed_list"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->remove(Ljava/lang/String;)V

    .line 206
    return-void
.end method

.method private handlePackageReplaced(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 117
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 118
    const-string v1, "package-replaced"

    invoke-static {p1, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCdsInitIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 119
    .local v0, "newIntent":Landroid/content/Intent;
    const-string v1, "extra-lazy-execution"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 120
    const-string v1, "extra-execute-wifi-only"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 121
    const-string v1, "extra-execute-plugged-only"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 122
    const-string v1, "extra-download-extra-assets"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 123
    const-string v1, "extra-max-items"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 124
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 128
    .end local v0    # "newIntent":Landroid/content/Intent;
    :goto_2b
    return-void

    .line 126
    :cond_2c
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "not connected"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2b
.end method

.method private handlePowerConnected(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    .line 135
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_43

    .line 136
    const-string v3, "power-connected"

    invoke-static {p1, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCdsInitIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 137
    .local v1, "newIntent":Landroid/content/Intent;
    const-string v3, "extra-lazy-execution"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 138
    const-string v3, "extra-execute-wifi-only"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 139
    const-string v3, "extra-execute-plugged-only"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 140
    const-string v3, "extra-download-extra-assets"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 141
    const-string v3, "extra-max-items"

    const/4 v4, 0x3

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 142
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 144
    const-string v3, "plugged"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 147
    .local v0, "chargeStatus":I
    if-ne v0, v5, :cond_42

    .line 148
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->getReceiptManager(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    move-result-object v2

    .line 149
    .local v2, "receiptManager":Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    if-eqz v2, :cond_42

    .line 150
    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->open()V

    .line 151
    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->upload()V

    .line 152
    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->close()V

    .line 158
    .end local v0    # "chargeStatus":I
    .end local v1    # "newIntent":Landroid/content/Intent;
    .end local v2    # "receiptManager":Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    :cond_42
    :goto_42
    return-void

    .line 156
    :cond_43
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "not connected"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_42
.end method

.method private setDeleteDownloadAlarm(Landroid/content/Context;J)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "downloadId"    # J

    .prologue
    .line 440
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    add-long v2, v4, v6

    .line 441
    .local v2, "time":J
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->getDeleteDownloadAlarmPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;

    move-result-object v1

    .line 442
    .local v1, "sender":Landroid/app/PendingIntent;
    const-string v4, "alarm"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 443
    .local v0, "am":Landroid/app/AlarmManager;
    const/4 v4, 0x3

    invoke-virtual {v0, v4, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 444
    return-void
.end method

.method private setNotificationForRedownloadPackage(Landroid/content/Context;JLjava/lang/String;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 494
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "pack_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "pack_type"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "content_id"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "content_packId"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "content_contentURL"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "content_displayName"

    aput-object v2, v0, v1

    invoke-static {p1, p2, p3, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackContentById(Landroid/content/Context;J[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v6

    .line 505
    .local v6, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/delete_download_entry"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 506
    invoke-static {p1, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 505
    invoke-virtual {v0, v1, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    .line 508
    .local v7, "result":I
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries deleted in download_packs_table for packId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 511
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    move-result-object v0

    .line 513
    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v1

    if-eqz v1, :cond_79

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    :cond_79
    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    .line 512
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->notifyPackDownloadFailed(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)V

    .line 515
    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {p1, p2, p3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyDownloadStatusChange(Landroid/content/Context;JLjava/lang/String;I)V

    .line 516
    return-void
.end method

.method private tryDeleteDownloadedFile(Landroid/app/DownloadManager;J)V
    .registers 16
    .param p1, "downloadManager"    # Landroid/app/DownloadManager;
    .param p2, "id"    # J

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 239
    new-instance v4, Landroid/app/DownloadManager$Query;

    invoke-direct {v4}, Landroid/app/DownloadManager$Query;-><init>()V

    .line 240
    .local v4, "query":Landroid/app/DownloadManager$Query;
    new-array v7, v7, [J

    aput-wide p2, v7, v8

    invoke-virtual {v4, v7}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    .line 242
    invoke-virtual {p1, v4}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v0

    .line 243
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_50

    .line 245
    :try_start_14
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 246
    const-string v7, "local_uri"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 247
    .local v3, "index":I
    const/4 v7, -0x1

    if-le v3, v7, :cond_4d

    .line 248
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 249
    .local v2, "filename":Ljava/lang/String;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "filename: %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 250
    if-eqz v2, :cond_4d

    .line 251
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 252
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v5

    .line 253
    .local v5, "success":Z
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "deleted: %b"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_4d} :catch_51
    .catchall {:try_start_14 .. :try_end_4d} :catchall_59

    .line 259
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "filename":Ljava/lang/String;
    .end local v5    # "success":Z
    :cond_4d
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 262
    .end local v3    # "index":I
    :cond_50
    :goto_50
    return-void

    .line 256
    :catch_51
    move-exception v6

    .line 257
    .local v6, "t":Ljava/lang/Throwable;
    :try_start_52
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_55
    .catchall {:try_start_52 .. :try_end_55} :catchall_59

    .line 259
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_50

    .end local v6    # "t":Ljava/lang/Throwable;
    :catchall_59
    move-exception v7

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v7
.end method

.method private unpackZipFile(Ljava/io/File;Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 6
    .param p1, "zipFile"    # Ljava/io/File;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "packIdentifier"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 476
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 477
    .local v0, "inputStream":Ljava/io/InputStream;
    invoke-direct {p0, v0, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->unpackZipFile(Ljava/io/InputStream;Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method private unpackZipFile(Ljava/io/InputStream;Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 8
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "packIdentifier"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 482
    invoke-static {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackItemsContentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 483
    .local v1, "packagePath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 485
    .local v0, "packageDirectory":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 486
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    invoke-static {v2}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 488
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setReadable(ZZ)Z

    .line 489
    invoke-static {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->unzip(Ljava/io/InputStream;Ljava/io/File;)V

    .line 490
    return-object v0
.end method

.method private validatePackContentZip(Landroid/content/Context;JLjava/lang/String;Ljava/io/File;)Z
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "zipFile"    # Ljava/io/File;

    .prologue
    const/4 v8, 0x0

    .line 519
    invoke-virtual {p0, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->convertPackType(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v7

    .line 520
    .local v7, "packTypeEnum":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    if-nez v7, :cond_21

    .line 521
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unrecognized packtype: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    move v1, v8

    .line 531
    :goto_20
    return v1

    .line 525
    :cond_21
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->CONTENT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v1, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;

    move-result-object v0

    .line 527
    .local v0, "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    const/4 v5, 0x1

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p5

    :try_start_2b
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;->validate(Landroid/content/Context;JLjava/io/File;Z)Z
    :try_end_2e
    .catch Ljava/lang/AssertionError; {:try_start_2b .. :try_end_2e} :catch_30

    move-result v1

    goto :goto_20

    .line 528
    :catch_30
    move-exception v6

    .line 529
    .local v6, "e":Ljava/lang/AssertionError;
    invoke-virtual {v6}, Ljava/lang/AssertionError;->printStackTrace()V

    .line 530
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to validate package, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    move v1, v8

    .line 531
    goto :goto_20
.end method


# virtual methods
.method convertPackType(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .registers 4
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    .line 537
    :try_start_0
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 539
    :goto_a
    return-object v1

    .line 538
    :catch_b
    move-exception v0

    .line 539
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    const/4 v1, 0x0

    .line 76
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "onReceive: %s"

    new-array v7, v5, [Ljava/lang/Object;

    aput-object p2, v7, v1

    invoke-interface {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "action":Ljava/lang/String;
    const/4 v4, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_a6

    :cond_19
    move v1, v4

    :goto_1a
    packed-switch v1, :pswitch_data_cc

    .line 113
    :goto_1d
    return-void

    .line 80
    :sswitch_1e
    const-string v5, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    goto :goto_1a

    :sswitch_27
    const-string v1, "aviary.android.cds.intent.action.ACTION_DOWNLOAD_PACKS_CONTENT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    move v1, v5

    goto :goto_1a

    :sswitch_31
    const-string v1, "aviary.android.cds.intent.action.ACTION_REMOVE_DOWNLOAD_CONTENT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x2

    goto :goto_1a

    :sswitch_3b
    const-string v1, "aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISSED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x3

    goto :goto_1a

    :sswitch_45
    const-string v1, "android.net.wifi.supplicant.CONNECTION_CHANGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x4

    goto :goto_1a

    :sswitch_4f
    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x5

    goto :goto_1a

    :sswitch_59
    const-string v1, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x6

    goto :goto_1a

    :sswitch_63
    const-string v1, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x7

    goto :goto_1a

    :sswitch_6d
    const-string v1, "aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/16 v1, 0x8

    goto :goto_1a

    .line 82
    :pswitch_78
    const-string v1, "extra_download_id"

    const-wide/16 v4, 0x0

    invoke-virtual {p2, v1, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 83
    .local v2, "downloadId":J
    invoke-direct {p0, p1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleActionDownloadComplete(Landroid/content/Context;J)V

    goto :goto_1d

    .line 86
    .end local v2    # "downloadId":J
    :pswitch_84
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleActionDownloadPacksContent(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1d

    .line 89
    :pswitch_88
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleDeleteDownloadEntry(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1d

    .line 92
    :pswitch_8c
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleNotificationDismissed(Landroid/content/Context;)V

    goto :goto_1d

    .line 95
    :pswitch_90
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleConnectivityChange(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1d

    .line 98
    :pswitch_94
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleConnectivityChange(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1d

    .line 101
    :pswitch_98
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handlePowerConnected(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1d

    .line 104
    :pswitch_9c
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handlePackageReplaced(Landroid/content/Context;)V

    goto/16 :goto_1d

    .line 107
    :pswitch_a1
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;->handleNotificationDismiss(Landroid/content/Context;)V

    goto/16 :goto_1d

    .line 80
    :sswitch_data_a6
    .sparse-switch
        -0x69c3ecfc -> :sswitch_6d
        -0x684960b1 -> :sswitch_31
        -0x1f291895 -> :sswitch_27
        -0x147b62d9 -> :sswitch_4f
        -0x87c955d -> :sswitch_3b
        0x41ccaef -> :sswitch_45
        0x3cbf870b -> :sswitch_59
        0x4a702ceb -> :sswitch_1e
        0x6789a577 -> :sswitch_63
    .end sparse-switch

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_78
        :pswitch_84
        :pswitch_88
        :pswitch_8c
        :pswitch_90
        :pswitch_94
        :pswitch_98
        :pswitch_9c
        :pswitch_a1
    .end packed-switch
.end method
