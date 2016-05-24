.class public final Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;
.super Ljava/lang/Object;
.source "RestoreAllHelper.java"


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field context:Landroid/content/Context;

.field packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field progressNotification:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

.field service:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

.field wifiOnly:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "RestoreAllHelper"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Z)V
    .registers 5
    .param p1, "service"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;
    .param p2, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .param p3, "wifiOnly"    # Z

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->service:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

    .line 41
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 43
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->wifiOnly:Z

    .line 44
    return-void
.end method

.method private acquireRestoreList(Ljava/util/List;)Ljava/util/ArrayList;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "purchaseList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 295
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "acquireRestoreList"

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 296
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 300
    .local v5, "restorePackList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eqz v8, :cond_52

    .line 301
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->acquireRestoreListCursor(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Landroid/database/Cursor;

    move-result-object v1

    .line 312
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_17
    if-eqz v1, :cond_78

    .line 314
    :try_start_19
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "cursor.size: %d"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 315
    :cond_2e
    :goto_2e
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_74

    .line 316
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v4

    .line 317
    .local v4, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v0

    .line 318
    .local v0, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->setContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)V

    .line 320
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2e

    .line 321
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4c
    .catchall {:try_start_19 .. :try_end_4c} :catchall_4d

    goto :goto_2e

    .line 325
    .end local v0    # "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    .end local v4    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    :catchall_4d
    move-exception v7

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v7

    .line 303
    .end local v1    # "cursor":Landroid/database/Cursor;
    :cond_52
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v8

    array-length v8, v8

    new-array v2, v8, [Landroid/database/Cursor;

    .line 304
    .local v2, "cursors":[Landroid/database/Cursor;
    const/4 v3, 0x0

    .line 305
    .local v3, "index":I
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v8

    array-length v9, v8

    :goto_5f
    if-ge v7, v9, :cond_6e

    aget-object v6, v8, v7

    .line 306
    .local v6, "type":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->acquireRestoreListCursor(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Landroid/database/Cursor;

    move-result-object v10

    aput-object v10, v2, v3

    .line 307
    add-int/lit8 v3, v3, 0x1

    .line 305
    add-int/lit8 v7, v7, 0x1

    goto :goto_5f

    .line 309
    .end local v6    # "type":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :cond_6e
    new-instance v1, Landroid/database/MergeCursor;

    invoke-direct {v1, v2}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    .restart local v1    # "cursor":Landroid/database/Cursor;
    goto :goto_17

    .line 325
    .end local v2    # "cursors":[Landroid/database/Cursor;
    .end local v3    # "index":I
    :cond_74
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 330
    return-object v5

    .line 328
    :cond_78
    new-instance v7, Ljava/lang/Exception;

    const-string v8, "Restore list is empty"

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private acquireRestoreListCursor(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Landroid/database/Cursor;
    .registers 8
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    const/4 v3, 0x0

    .line 282
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "acquireRestoreListCursor"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack/type/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 284
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "/content/restore/list"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/16 v2, 0xe

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "pack_id as _id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "pack_id"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "pack_type"

    aput-object v5, v2, v4

    const/4 v4, 0x3

    const-string v5, "pack_identifier"

    aput-object v5, v2, v4

    const/4 v4, 0x4

    const-string v5, "content_id"

    aput-object v5, v2, v4

    const/4 v4, 0x5

    const-string v5, "content_contentPath"

    aput-object v5, v2, v4

    const/4 v4, 0x6

    const-string v5, "content_contentURL"

    aput-object v5, v2, v4

    const/4 v4, 0x7

    const-string v5, "content_displayName"

    aput-object v5, v2, v4

    const/16 v4, 0x8

    const-string v5, "content_iconPath"

    aput-object v5, v2, v4

    const/16 v4, 0x9

    const-string v5, "content_iconUrl"

    aput-object v5, v2, v4

    const/16 v4, 0xa

    const-string v5, "content_isFree"

    aput-object v5, v2, v4

    const/16 v4, 0xb

    const-string v5, "content_purchased"

    aput-object v5, v2, v4

    const/16 v4, 0xc

    const-string v5, "content_packId"

    aput-object v5, v2, v4

    const/16 v4, 0xd

    const-string v5, "content_numItems"

    aput-object v5, v2, v4

    const-string v5, "pack_id ASC"

    move-object v4, v3

    .line 283
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private dismissCdsReceiverNotification()V
    .registers 4

    .prologue
    .line 195
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 196
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 197
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 198
    return-void
.end method

.method private downloadManifest()Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 126
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "downloadManifest"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 127
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;-><init>()V

    .line 128
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->service:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getLatestManifestVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->wifiOnly:Z

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;->download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v1

    return-object v1
.end method

.method private downloadMissingIcons(Ljava/util/ArrayList;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Ljava/util/List;
    .registers 7
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "downloadMissingIcons"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 267
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 269
    .local v1, "errorList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;-><init>(Landroid/content/Context;)V

    .line 270
    invoke-virtual {v2, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    .line 271
    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->withDefinedList(Ljava/util/ArrayList;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->service:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

    .line 272
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getThreadPool()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->wifiOnly:Z

    .line 273
    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->wifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    .line 274
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    move-result-object v0

    .line 276
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->consume()V

    .line 277
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->getExceptions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 278
    return-object v1
.end method

.method private downloadPacks(Ljava/util/List;II)Ljava/util/List;
    .registers 28
    .param p2, "currentProgress"    # I
    .param p3, "maxProgress"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;II)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v18

    .line 212
    .local v18, "total":I
    const-wide/16 v8, 0x0

    .line 213
    .local v8, "i":D
    sub-int v19, p3, p2

    move/from16 v0, v19

    int-to-double v4, v0

    .line 215
    .local v4, "deltaProgress":D
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v7, "errorList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 218
    .local v11, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    :goto_14
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_f1

    .line 219
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 220
    .local v12, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v14

    .line 221
    .local v14, "packId":J
    const/16 v16, 0x0

    .line 223
    .local v16, "requestResult":Ljava/lang/String;
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v10

    .line 224
    .local v10, "identifier":Ljava/lang/String;
    const/4 v6, 0x0

    .line 227
    .local v6, "error":Ljava/lang/Throwable;
    :try_start_2b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v0, v14, v15, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->requestPackDownload(Landroid/content/Context;JZ)Ljava/lang/String;
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_3a} :catch_b1

    move-result-object v16

    .line 232
    :goto_3b
    if-nez v16, :cond_d5

    .line 233
    sget-object v19, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "failed to start download for "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 234
    if-eqz v6, :cond_b5

    .line 235
    new-instance v19, Ljava/lang/Exception;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Failed to download "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ". "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 237
    invoke-virtual {v6}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 235
    move-object/from16 v0, v19

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    :goto_86
    invoke-interface {v11}, Ljava/util/Iterator;->remove()V

    .line 247
    :goto_89
    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v20, v0

    div-double v20, v8, v20

    mul-double v20, v20, v4

    move-wide/from16 v0, v20

    double-to-int v0, v0

    move/from16 v19, v0

    add-int v13, p2, v19

    .line 248
    .local v13, "progress":I
    const/16 v19, 0x64

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v13, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->updateProgressNotification(IIZ)V

    .line 249
    const-wide/16 v20, 0x3e8

    invoke-static/range {v20 .. v21}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->trySleep(J)V

    .line 250
    const-wide/high16 v20, 0x3ff0000000000000L

    add-double v8, v8, v20

    .line 251
    goto/16 :goto_14

    .line 228
    .end local v13    # "progress":I
    :catch_b1
    move-exception v17

    .line 229
    .local v17, "t":Ljava/lang/Throwable;
    move-object/from16 v6, v17

    goto :goto_3b

    .line 239
    .end local v17    # "t":Ljava/lang/Throwable;
    :cond_b5
    new-instance v19, Ljava/lang/Exception;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Download failed for "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_86

    .line 244
    :cond_d5
    sget-object v19, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v20, "started download request for %s (result:%s)"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    aput-object v16, v21, v22

    invoke-interface/range {v19 .. v21}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_89

    .line 252
    .end local v6    # "error":Ljava/lang/Throwable;
    .end local v10    # "identifier":Ljava/lang/String;
    .end local v12    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v14    # "packId":J
    .end local v16    # "requestResult":Ljava/lang/String;
    :cond_f1
    return-object v7
.end method

.method private notifyComplete(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_d

    .line 187
    :cond_8
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->progressNotification:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->alertNothingToRestore()V

    .line 189
    :cond_d
    return-void
.end method

.method private onComplete(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/List;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 156
    .local p2, "completeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    .local p3, "errorList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onComplete"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->progressNotification:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->cancel()V

    .line 161
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_16

    .line 162
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->notifyComplete(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 166
    :goto_15
    return-void

    .line 164
    :cond_16
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->notifyRestoreCompleteWithErrors(Landroid/content/Context;Ljava/util/List;)V

    goto :goto_15
.end method

.method private restoreAllInternal()V
    .registers 10

    .prologue
    const/16 v8, 0x46

    const/4 v7, 0x0

    const/16 v6, 0x64

    .line 80
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v1, "exceptionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    :try_start_a
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->downloadManifest()Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_d} :catch_3e

    move-result-object v2

    .line 93
    .local v2, "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    const/4 v5, 0x5

    invoke-direct {p0, v6, v5, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->updateProgressNotification(IIZ)V

    .line 96
    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->restorePurchases(Ljava/util/List;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Ljava/util/List;

    move-result-object v3

    .line 97
    .local v3, "purchaedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v5, 0x23

    invoke-direct {p0, v6, v5, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->updateProgressNotification(IIZ)V

    .line 100
    const/4 v4, 0x0

    .line 102
    .local v4, "restoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    :try_start_1c
    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->acquireRestoreList(Ljava/util/List;)Ljava/util/ArrayList;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1f} :catch_57

    move-result-object v4

    .line 107
    :goto_20
    if-eqz v4, :cond_38

    .line 108
    const/16 v5, 0x28

    invoke-direct {p0, v6, v5, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->updateProgressNotification(IIZ)V

    .line 111
    invoke-direct {p0, v4, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->downloadMissingIcons(Ljava/util/ArrayList;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 112
    invoke-direct {p0, v6, v8, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->updateProgressNotification(IIZ)V

    .line 115
    invoke-direct {p0, v4, v8, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->downloadPacks(Ljava/util/List;II)Ljava/util/List;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 119
    :cond_38
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-direct {p0, v5, v4, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->onComplete(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 120
    .end local v2    # "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .end local v3    # "purchaedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "restoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    :goto_3d
    return-void

    .line 87
    :catch_3e
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "failed to download the manifest"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 89
    new-instance v5, Ljava/lang/Exception;

    const-string v6, "Failed to download the latest cds manifest"

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-direct {p0, v5, v6, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->onComplete(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/List;)V

    goto :goto_3d

    .line 103
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .restart local v3    # "purchaedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "restoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    :catch_57
    move-exception v0

    .line 104
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_20
.end method

.method private restorePurchases(Ljava/util/List;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Ljava/util/List;
    .registers 12
    .param p2, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    .local p1, "exceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "restorePurchases"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 133
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v4, "purchasedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-nez v0, :cond_26

    .line 139
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v8

    .line 140
    .local v8, "list":[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    array-length v0, v8

    new-array v5, v0, [Ljava/lang/String;

    .line 141
    .local v5, "packTypes":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_18
    array-length v0, v8

    if-ge v7, v0, :cond_32

    .line 142
    aget-object v0, v8, v7

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v7

    .line 141
    add-int/lit8 v7, v7, 0x1

    goto :goto_18

    .line 145
    .end local v5    # "packTypes":[Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "list":[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :cond_26
    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v0

    .line 148
    .restart local v5    # "packTypes":[Ljava/lang/String;
    :cond_32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->service:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->wifiOnly:Z

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->restoreOwnedPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;ZLjava/util/List;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    .line 149
    .local v6, "exceptionList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface {p1, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 151
    return-object v4
.end method

.method private updateProgressNotification(IIZ)V
    .registers 5
    .param p1, "max"    # I
    .param p2, "progress"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->progressNotification:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->setProgress(IIZ)V

    .line 177
    return-void
.end method


# virtual methods
.method public dispose()V
    .registers 2

    .prologue
    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->progressNotification:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    .line 49
    return-void
.end method

.method restoreAll()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 61
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "restoreAll. packType: %s"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->cancelRestoreOngoingNotification(Landroid/content/Context;)V

    .line 65
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->dismissCdsReceiverNotification()V

    .line 68
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->createRestoreOngoingNotification(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->progressNotification:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    .line 71
    const/16 v0, 0x64

    invoke-direct {p0, v0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->updateProgressNotification(IIZ)V

    .line 74
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->restoreAllInternal()V

    .line 75
    return-void
.end method
