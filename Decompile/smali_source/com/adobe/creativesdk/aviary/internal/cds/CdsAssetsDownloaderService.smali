.class public Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;
.source "CdsAssetsDownloaderService.java"


# static fields
.field private static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-string v0, "AdobeImageCdsAssetsDownloaderService"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 41
    const-string v0, "AdobeImageCdsAssetsDownloaderService"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;-><init>(Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method private downloadExtraAssets(ZI)V
    .registers 5
    .param p1, "wifiOnly"    # Z
    .param p2, "maxItems"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "downloadExtraAssets"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 78
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 81
    if-eqz p1, :cond_13

    .line 82
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 86
    :cond_13
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processDetails(ZI)V

    .line 89
    if-eqz p1, :cond_1f

    .line 90
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 94
    :cond_1f
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processFutureMessages(Z)V

    .line 97
    if-eqz p1, :cond_2b

    .line 98
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 102
    :cond_2b
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processFeaturedItems(ZI)V

    .line 105
    if-eqz p1, :cond_37

    .line 106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 110
    :cond_37
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processPreviews(ZI)V

    .line 111
    return-void
.end method

.method private processDetail(Landroid/content/Context;JLjava/lang/String;Z)Z
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "detailLocalPath"    # Ljava/lang/String;
    .param p5, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 245
    if-nez p1, :cond_c

    .line 246
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Invalid Context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 249
    :cond_c
    if-eqz p5, :cond_11

    .line 250
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 254
    :cond_11
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_32

    .line 255
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 256
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 257
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "detail image for packid %d already downloaded.."

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v3, v2

    invoke-interface {v4, v5, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 268
    .end local v1    # "file":Ljava/io/File;
    :goto_31
    return v2

    .line 261
    :cond_32
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "download detail image for pack %d"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 263
    :try_start_41
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->DETAIL_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v4

    invoke-virtual {v4, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_4a} :catch_4c

    move v2, v3

    .line 264
    goto :goto_31

    .line 265
    :catch_4c
    move-exception v0

    .line 266
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_31
.end method

.method private processDetails(ZI)V
    .registers 25
    .param p1, "wifiOnly"    # Z
    .param p2, "maxItems"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 186
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "processDetails"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 187
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_15

    .line 188
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Invalid Context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 191
    :cond_15
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v16

    .line 194
    .local v16, "packtypes":[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v21, v0

    const/4 v2, 0x0

    move/from16 v20, v2

    :goto_21
    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_e7

    aget-object v15, v16, v20

    .line 195
    .local v15, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "processing %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v15, v5, v7

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 197
    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "content_packId"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "content_detailImageLocalPath"

    aput-object v3, v4, v2

    .line 202
    .local v4, "projection":[Ljava/lang/String;
    const-string v18, "pack_type=? AND content_purchased=? AND pack_visible=? AND pack_markedForDeletion=? AND ifnull(length(content_featureImageURL), 0) > 0"

    .line 207
    .local v18, "selection":Ljava/lang/String;
    const/4 v2, 0x4

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v6, v2

    const/4 v2, 0x1

    const-string v3, "0"

    aput-object v3, v6, v2

    const/4 v2, 0x2

    const-string v3, "1"

    aput-object v3, v6, v2

    const/4 v2, 0x3

    const-string v3, "0"

    aput-object v3, v6, v2

    .line 209
    .local v6, "selectionArgs":[Ljava/lang/String;
    const-string v19, "content_purchased ASC, pack_displayOrder ASC"

    .line 211
    .local v19, "sortOrder":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 212
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v5, "pack/content/list"

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v5, "pack_type=? AND content_purchased=? AND pack_visible=? AND pack_markedForDeletion=? AND ifnull(length(content_featureImageURL), 0) > 0"

    const-string v7, "content_purchased ASC, pack_displayOrder ASC"

    .line 211
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 215
    .local v14, "cursor":Landroid/database/Cursor;
    if-nez v14, :cond_80

    .line 216
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Cursor is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 220
    :cond_80
    :try_start_80
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "cursor.size: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-interface {v14}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 221
    const/16 v17, 0x0

    .line 222
    .local v17, "processed":I
    :goto_97
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_b9

    .line 224
    const/4 v2, -0x1

    move/from16 v0, p2

    if-le v0, v2, :cond_c2

    move/from16 v0, v17

    move/from16 v1, p2

    if-lt v0, v1, :cond_c2

    .line 225
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "Processed %d items. Stop"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_b9
    .catchall {:try_start_80 .. :try_end_b9} :catchall_e2

    .line 238
    :cond_b9
    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 194
    add-int/lit8 v2, v20, 0x1

    move/from16 v20, v2

    goto/16 :goto_21

    .line 228
    :cond_c2
    const/4 v2, 0x0

    :try_start_c3
    invoke-interface {v14, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 229
    .local v10, "packId":J
    const/4 v2, 0x1

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 230
    .local v12, "detailLocalPath":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    move-object/from16 v8, p0

    move/from16 v13, p1

    invoke-direct/range {v8 .. v13}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processDetail(Landroid/content/Context;JLjava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_dc

    .line 231
    add-int/lit8 v17, v17, 0x1

    .line 235
    :cond_dc
    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->trySleep(J)V
    :try_end_e1
    .catchall {:try_start_c3 .. :try_end_e1} :catchall_e2

    goto :goto_97

    .line 238
    .end local v10    # "packId":J
    .end local v12    # "detailLocalPath":Ljava/lang/String;
    .end local v17    # "processed":I
    :catchall_e2
    move-exception v2

    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    .line 241
    .end local v4    # "projection":[Ljava/lang/String;
    .end local v6    # "selectionArgs":[Ljava/lang/String;
    .end local v14    # "cursor":Landroid/database/Cursor;
    .end local v15    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .end local v18    # "selection":Ljava/lang/String;
    .end local v19    # "sortOrder":Ljava/lang/String;
    :cond_e7
    return-void
.end method

.method private processFeaturedItem(Landroid/content/Context;Landroid/database/Cursor;Z)Z
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 412
    if-nez p1, :cond_c

    .line 413
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Invalid Context"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 416
    :cond_c
    if-eqz p3, :cond_11

    .line 417
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 420
    :cond_11
    invoke-static {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;

    move-result-object v2

    .line 421
    .local v2, "wrapper":Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;
    if-nez v2, :cond_1f

    .line 422
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "feailed to create wrapper"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 426
    :cond_1f
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->getFeatureImageLocalPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_42

    .line 427
    new-instance v1, Ljava/io/File;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->getFeatureImageLocalPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 428
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_42

    .line 429
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "featured image already downloaded.."

    new-array v6, v3, [Ljava/lang/Object;

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 441
    .end local v1    # "file":Ljava/io/File;
    :goto_41
    return v3

    .line 434
    :cond_42
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "download featured image for pack %d"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 436
    :try_start_55
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->FEATURED_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v5

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/FeaturedColumns$CursorWrapper;->getId()J

    move-result-wide v6

    invoke-virtual {v5, p1, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_62} :catch_64

    move v3, v4

    .line 437
    goto :goto_41

    .line 438
    :catch_64
    move-exception v0

    .line 439
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_41
.end method

.method private processFeaturedItems(ZI)V
    .registers 12
    .param p1, "wifiOnly"    # Z
    .param p2, "maxItems"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 376
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "processFeaturedItems"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 377
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_16

    .line 378
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid Context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 381
    :cond_16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "storeFeatured/banners/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-gez p2, :cond_49

    const/4 v0, 0x3

    :goto_24
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 382
    .local v8, "query":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 383
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v8}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    .line 382
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 386
    .local v6, "cursor":Landroid/database/Cursor;
    if-nez v6, :cond_4b

    .line 387
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cursor is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .end local v6    # "cursor":Landroid/database/Cursor;
    .end local v8    # "query":Ljava/lang/String;
    :cond_49
    move v0, p2

    .line 381
    goto :goto_24

    .line 391
    .restart local v6    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "query":Ljava/lang/String;
    :cond_4b
    :try_start_4b
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cursor.size: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 392
    const/4 v7, 0x0

    .line 393
    .local v7, "processed":I
    :goto_61
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_97

    .line 394
    if-lez p2, :cond_80

    if-lt v7, p2, :cond_80

    .line 395
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Processed %d items. Stop"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7c
    .catchall {:try_start_4b .. :try_end_7c} :catchall_92

    .line 406
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 408
    :goto_7f
    return-void

    .line 398
    :cond_80
    :try_start_80
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, v6, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processFeaturedItem(Landroid/content/Context;Landroid/database/Cursor;Z)Z

    move-result v0

    if-eqz v0, :cond_8c

    .line 399
    add-int/lit8 v7, v7, 0x1

    .line 403
    :cond_8c
    const-wide/16 v0, 0x5

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->trySleep(J)V
    :try_end_91
    .catchall {:try_start_80 .. :try_end_91} :catchall_92

    goto :goto_61

    .line 406
    .end local v7    # "processed":I
    :catchall_92
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .restart local v7    # "processed":I
    :cond_97
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_7f
.end method

.method private processFutureMessage(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;Z)Z
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "messageContent"    # Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    .param p3, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 158
    if-nez p1, :cond_c

    .line 159
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Invalid Context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 162
    :cond_c
    if-eqz p3, :cond_11

    .line 163
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 166
    :cond_11
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentPath()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "contentPath":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_39

    .line 169
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 170
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 171
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "file exists. Skipping.."

    new-array v5, v2, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 182
    .end local v1    # "file":Ljava/io/File;
    :goto_2f
    return v2

    .line 174
    .restart local v1    # "file":Ljava/io/File;
    :cond_30
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "file doesn\'t exist!"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 178
    .end local v1    # "file":Ljava/io/File;
    :cond_39
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "processing: %s"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentIdentifier()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "beginDate: %s, endDate: %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getBeginDate()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getEndDate()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v3

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 181
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->MESSAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v2

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getMessageId()J

    move-result-wide v4

    invoke-virtual {v2, p1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;

    move v2, v3

    .line 182
    goto :goto_2f
.end method

.method private processFutureMessages(Z)V
    .registers 11
    .param p1, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 114
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "processFutureMessages"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_16

    .line 116
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid Context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_16
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 122
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "message/future/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->LAUNCH:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 121
    invoke-static {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    .line 120
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 125
    .local v6, "cursor":Landroid/database/Cursor;
    if-nez v6, :cond_52

    .line 126
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cursor is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_52
    const/4 v8, 0x1

    .line 133
    .local v8, "total":I
    :try_start_53
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cursor.size: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 134
    :cond_68
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 136
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;

    move-result-object v7

    .line 138
    .local v7, "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    if-eqz v7, :cond_68

    .line 141
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, v7, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processFutureMessage(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;Z)Z
    :try_end_7b
    .catchall {:try_start_53 .. :try_end_7b} :catchall_83

    .line 142
    add-int/lit8 v8, v8, -0x1

    .line 144
    if-gtz v8, :cond_68

    .line 150
    .end local v7    # "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :cond_7f
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 152
    return-void

    .line 150
    :catchall_83
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method private processPreview(Landroid/content/Context;JJLjava/lang/String;Ljava/lang/String;Z)Z
    .registers 21
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "contentId"    # J
    .param p6, "previewPath"    # Ljava/lang/String;
    .param p7, "packTypeString"    # Ljava/lang/String;
    .param p8, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    if-nez p1, :cond_a

    .line 338
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Invalid Context"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 341
    :cond_a
    if-eqz p8, :cond_f

    .line 342
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->throwIfNotConnected(Landroid/content/Context;)V

    .line 346
    :cond_f
    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5b

    .line 347
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p6

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 348
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 349
    invoke-static/range {p7 .. p7}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v9

    .line 351
    .local v9, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    .line 352
    invoke-static {v3, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;

    move-result-object v2

    .line 355
    .local v2, "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    const/4 v7, 0x0

    move-object v3, p1

    move-wide/from16 v4, p4

    :try_start_30
    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;->validate(Landroid/content/Context;JLjava/io/File;Z)Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 356
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "detail image for packid %d already downloaded.."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_47
    .catch Ljava/lang/AssertionError; {:try_start_30 .. :try_end_47} :catch_49

    .line 357
    const/4 v3, 0x0

    .line 372
    .end local v2    # "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .end local v6    # "file":Ljava/io/File;
    .end local v9    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :goto_48
    return v3

    .line 359
    .restart local v2    # "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .restart local v6    # "file":Ljava/io/File;
    .restart local v9    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :catch_49
    move-exception v8

    .line 360
    .local v8, "e":Ljava/lang/AssertionError;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "need to download again previews for packId %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 365
    .end local v2    # "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .end local v6    # "file":Ljava/io/File;
    .end local v8    # "e":Ljava/lang/AssertionError;
    .end local v9    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :cond_5b
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "download detail image for pack %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 367
    :try_start_6c
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v3

    invoke-virtual {v3, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_75} :catch_77

    .line 368
    const/4 v3, 0x1

    goto :goto_48

    .line 369
    :catch_77
    move-exception v8

    .line 370
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    .line 372
    const/4 v3, 0x0

    goto :goto_48
.end method

.method private processPreviews(ZI)V
    .registers 28
    .param p1, "wifiOnly"    # Z
    .param p2, "maxItems"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 272
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "processFutureMessages"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 274
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_15

    .line 275
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Invalid Context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 278
    :cond_15
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v19

    .line 281
    .local v19, "packtypes":[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v24, v0

    const/4 v2, 0x0

    move/from16 v23, v2

    :goto_21
    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_100

    aget-object v18, v19, v23

    .line 282
    .local v18, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "processing %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v18, v5, v7

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 284
    const/4 v2, 0x4

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "content_packId"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "content_previewPath"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "pack_type"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "content_id"

    aput-object v3, v4, v2

    .line 291
    .local v4, "projection":[Ljava/lang/String;
    const-string v21, "pack_type=? AND content_purchased=? AND pack_visible=? AND pack_markedForDeletion=? AND ifnull(length(content_previewURL), 0) > 0"

    .line 296
    .local v21, "selection":Ljava/lang/String;
    const/4 v2, 0x4

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v6, v2

    const/4 v2, 0x1

    const-string v3, "0"

    aput-object v3, v6, v2

    const/4 v2, 0x2

    const-string v3, "1"

    aput-object v3, v6, v2

    const/4 v2, 0x3

    const-string v3, "0"

    aput-object v3, v6, v2

    .line 298
    .local v6, "selectionArgs":[Ljava/lang/String;
    const-string v22, "content_purchased ASC, pack_displayOrder ASC"

    .line 300
    .local v22, "sortOrder":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 301
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v5, "pack/content/list"

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v5, "pack_type=? AND content_purchased=? AND pack_visible=? AND pack_markedForDeletion=? AND ifnull(length(content_previewURL), 0) > 0"

    const-string v7, "content_purchased ASC, pack_displayOrder ASC"

    .line 300
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 304
    .local v17, "cursor":Landroid/database/Cursor;
    if-nez v17, :cond_8a

    .line 305
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Cursor is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 309
    :cond_8a
    :try_start_8a
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "cursor.size: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 310
    const/16 v20, 0x0

    .line 311
    .local v20, "processed":I
    :goto_a1
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_c0

    .line 312
    if-lez p2, :cond_c9

    move/from16 v0, v20

    move/from16 v1, p2

    if-lt v0, v1, :cond_c9

    .line 313
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "Processed %d items. Stop"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_c0
    .catchall {:try_start_8a .. :try_end_c0} :catchall_fb

    .line 329
    :cond_c0
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 281
    add-int/lit8 v2, v23, 0x1

    move/from16 v23, v2

    goto/16 :goto_21

    .line 317
    :cond_c9
    const/4 v2, 0x0

    :try_start_ca
    move-object/from16 v0, v17

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 318
    .local v10, "packId":J
    const/4 v2, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 319
    .local v14, "previewPath":Ljava/lang/String;
    const/4 v2, 0x2

    move-object/from16 v0, v17

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 320
    .local v15, "type":Ljava/lang/String;
    const/4 v2, 0x3

    move-object/from16 v0, v17

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 322
    .local v12, "contentId":J
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    move-object/from16 v8, p0

    move/from16 v16, p1

    invoke-direct/range {v8 .. v16}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->processPreview(Landroid/content/Context;JJLjava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_f5

    .line 323
    add-int/lit8 v20, v20, 0x1

    .line 326
    :cond_f5
    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->trySleep(J)V
    :try_end_fa
    .catchall {:try_start_ca .. :try_end_fa} :catchall_fb

    goto :goto_a1

    .line 329
    .end local v10    # "packId":J
    .end local v12    # "contentId":J
    .end local v14    # "previewPath":Ljava/lang/String;
    .end local v15    # "type":Ljava/lang/String;
    .end local v20    # "processed":I
    :catchall_fb
    move-exception v2

    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    .line 332
    .end local v4    # "projection":[Ljava/lang/String;
    .end local v6    # "selectionArgs":[Ljava/lang/String;
    .end local v17    # "cursor":Landroid/database/Cursor;
    .end local v18    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .end local v21    # "selection":Ljava/lang/String;
    .end local v22    # "sortOrder":Ljava/lang/String;
    :cond_100
    return-void
.end method

.method private throwIfNotConnected(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 445
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 446
    new-instance v0, Ljava/io/IOException;

    const-string v1, "NotConnected"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 448
    :cond_e
    return-void
.end method


# virtual methods
.method public onCreate()V
    .registers 1

    .prologue
    .line 46
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->onCreate()V

    .line 47
    return-void
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 51
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->onDestroy()V

    .line 52
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .registers 11
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    .line 56
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "onHandleIntent: %s"

    new-array v6, v8, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 57
    if-nez p1, :cond_10

    .line 74
    :cond_f
    :goto_f
    return-void

    .line 61
    :cond_10
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "action":Ljava/lang/String;
    const-string v4, "extra-execute-wifi-only"

    invoke-virtual {p1, v4, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 64
    .local v3, "wifiOnly":Z
    const-string v4, "extra-max-items"

    const/4 v5, -0x1

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 66
    .local v1, "maxItems":I
    const-string v4, "aviary.intent.action.CDS_DOWNLOAD_EXTRA_ASSETS"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 68
    :try_start_29
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;->downloadExtraAssets(ZI)V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_2c} :catch_2d

    goto :goto_f

    .line 69
    :catch_2d
    move-exception v2

    .line 70
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_f
.end method
