.class final Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "CdsDatabaseHelper.java"


# static fields
.field private static volatile instance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private static mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const-string v0, "CdsDatabaseHelper"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    const-string v0, "aviarycds.sqlite"

    const/4 v1, 0x0

    const/16 v2, 0xa

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 51
    sput-object p1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->mContext:Landroid/content/Context;

    .line 52
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->instance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    if-nez v0, :cond_13

    .line 56
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    monitor-enter v1

    .line 57
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->instance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    if-nez v0, :cond_12

    .line 58
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->instance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    .line 60
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 62
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->instance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    return-object v0

    .line 60
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method static getPackFeaturedLabel(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    .line 698
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v0

    .line 699
    .local v0, "type":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    if-eqz v0, :cond_44

    .line 701
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_48

    .line 727
    const-string v1, "Featured"

    .line 730
    :goto_13
    return-object v1

    .line 703
    :pswitch_14
    if-eqz p0, :cond_1d

    .line 704
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_featured_frames:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 706
    :cond_1d
    const-string v1, "Featured Frames"

    goto :goto_13

    .line 709
    :pswitch_20
    if-eqz p0, :cond_29

    .line 710
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_featured_effects:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 712
    :cond_29
    const-string v1, "Featured Effects"

    goto :goto_13

    .line 715
    :pswitch_2c
    if-eqz p0, :cond_35

    .line 716
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_featured_stickers:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 718
    :cond_35
    const-string v1, "Featured Stickers"

    goto :goto_13

    .line 721
    :pswitch_38
    if-eqz p0, :cond_41

    .line 722
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_featured_overlays:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 724
    :cond_41
    const-string v1, "Featured Overlays"

    goto :goto_13

    .line 730
    :cond_44
    const-string v1, "Featured"

    goto :goto_13

    .line 701
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_14
        :pswitch_20
        :pswitch_2c
        :pswitch_38
    .end packed-switch
.end method

.method private getTrayFeaturedCount(Ljava/lang/String;Z)I
    .registers 13
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "freeOnly"    # Z

    .prologue
    const/4 v5, 0x0

    .line 411
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "getTrayFeaturedCount: packType: %s, freeOnly: %b"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p1, v7, v5

    const/4 v8, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 414
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SELECT COUNT(pack_id) as _count  FROM packs_table, content_table WHERE pack_id=content_packId AND pack_visible=1 AND pack_finishedDownloading=1"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz p2, :cond_9a

    const-string v4, " AND content_isFree=1"

    :goto_23
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " AND "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "content_iconPath"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " NOT NULL"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " AND "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "content_purchased"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "=0"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " AND "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "pack_type"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "=\'"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "\' "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " ORDER BY "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "pack_displayOrder"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " ASC"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 427
    .local v3, "sql":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 429
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v0, 0x0

    .line 430
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v1, :cond_89

    .line 431
    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 433
    :cond_89
    if-eqz v0, :cond_a0

    .line 435
    :try_start_8b
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_9d

    .line 436
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I
    :try_end_95
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_8b .. :try_end_95} :catch_a2
    .catchall {:try_start_8b .. :try_end_95} :catchall_bf

    move-result v4

    .line 441
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 444
    :goto_99
    return v4

    .line 414
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v3    # "sql":Ljava/lang/String;
    :cond_9a
    const-string v4, ""

    goto :goto_23

    .line 441
    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v3    # "sql":Ljava/lang/String;
    :cond_9d
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    :cond_a0
    :goto_a0
    move v4, v5

    .line 444
    goto :goto_99

    .line 438
    :catch_a2
    move-exception v2

    .line 439
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_a3
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "handled: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_bb
    .catchall {:try_start_a3 .. :try_end_bb} :catchall_bf

    .line 441
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_a0

    .end local v2    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_bf
    move-exception v4

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v4
.end method

.method private getTrayInstalledCount(Ljava/lang/String;)I
    .registers 10
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 449
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SELECT count(pack_id) as _count FROM packs_table, content_table WHERE pack_id=content_packId AND pack_type=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "content_purchased"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "=1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "content_contentPath"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " NOT NULL"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 458
    .local v3, "sql":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 460
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v0, 0x0

    .line 461
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v1, :cond_4a

    .line 462
    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 464
    :cond_4a
    if-eqz v0, :cond_5a

    .line 466
    :try_start_4c
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 467
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I
    :try_end_56
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4c .. :try_end_56} :catch_5f
    .catchall {:try_start_4c .. :try_end_56} :catchall_7c

    move-result v4

    .line 472
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 475
    :cond_5a
    :goto_5a
    return v4

    .line 472
    :cond_5b
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_5a

    .line 469
    :catch_5f
    move-exception v2

    .line 470
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_60
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "handled: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_78
    .catchall {:try_start_60 .. :try_end_78} :catchall_7c

    .line 472
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_5a

    .end local v2    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_7c
    move-exception v4

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v4
.end method

.method static insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    .registers 5
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 364
    const/4 v0, 0x4

    invoke-static {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;I)J

    move-result-wide v0

    return-wide v0
.end method

.method static insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;I)J
    .registers 9
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p3, "conflictAlgorithm"    # I

    .prologue
    .line 368
    const/4 v2, 0x0

    invoke-virtual {p2, p0, v2, p1, p3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    .line 369
    .local v0, "rowId":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_31

    .line 370
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error occurred inserting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " into "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 372
    :cond_31
    return-wide v0
.end method


# virtual methods
.method delete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 6
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "tableName"    # Ljava/lang/String;
    .param p3, "whereClause"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 384
    invoke-virtual {p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method deleteMessage(J)I
    .registers 10
    .param p1, "messageId"    # J

    .prologue
    const/4 v1, 0x0

    .line 1474
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1475
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_18

    .line 1476
    const-string v2, "messages_table"

    const-string v3, "msg_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1478
    :cond_18
    return v1
.end method

.method deletePack(J)I
    .registers 10
    .param p1, "packId"    # J

    .prologue
    const/4 v1, 0x0

    .line 1462
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1463
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_18

    .line 1464
    const-string v2, "packs_table"

    const-string v3, "pack_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1466
    :cond_18
    return v1
.end method

.method deletePackDownloadEntry(J)I
    .registers 10
    .param p1, "packId"    # J

    .prologue
    const/4 v1, 0x0

    .line 1448
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1449
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_18

    .line 1450
    const-string v2, "packs_download_table"

    const-string v3, "download_packId=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    .line 1452
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 1450
    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1454
    :cond_18
    return v1
.end method

.method getActiveMessage(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p1, "messageType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1193
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1194
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId), packs_table, content_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1199
    const-string v8, "msg_type=? AND msgcnt_visited=0 AND msgcnt_contentPath NOT NULL AND (strftime(\'%s\', datetime(\'now\')) BETWEEN strftime(\'%s\',msgcnt_beginDate) AND strftime(\'%s\', msgcnt_endDate)) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0"

    .line 1206
    .local v8, "selection":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    .line 1208
    .local v4, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1209
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_23

    .line 1210
    const-string v3, "msg_type=? AND msgcnt_visited=0 AND msgcnt_contentPath NOT NULL AND (strftime(\'%s\', datetime(\'now\')) BETWEEN strftime(\'%s\',msgcnt_beginDate) AND strftime(\'%s\', msgcnt_endDate)) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0"

    const-string v7, "msgcnt_beginDate DESC"

    move-object v2, p2

    move-object v6, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1212
    :cond_23
    return-object v5
.end method

.method getAvailableForRestorePacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1075
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1076
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1080
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1081
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_20

    .line 1082
    const-string v3, "(content_purchased=0 OR ifnull(length(content_contentPath), 0) < 1 ) AND pack_type=? AND pack_markedForDeletion=0"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, p3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1092
    :cond_20
    return-object v5
.end method

.method getAvailablePacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 14
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1018
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1019
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1023
    const-string v2, "pack_finishedDownloading=1 AND "

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1024
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack_type=\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\' AND "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1025
    const-string v2, "(pack_visible=1 OR (pack_visible=0 AND content_purchased=1)) AND "

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1028
    const-string v2, "pack_markedForDeletion=0 "

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1030
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1031
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_45

    move-object v2, p2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, p5

    .line 1032
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 1034
    :cond_45
    return-object v3
.end method

.method getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 66
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getFeatured(ZI)Landroid/database/Cursor;
    .registers 12
    .param p1, "featured"    # Z
    .param p2, "packCount"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x1

    .line 737
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 740
    .local v0, "buffer":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_13

    .line 741
    const-string v5, "SELECT * FROM (  SELECT -2 as _id, \'\' as identifier, \'effect\' as packType, \'Featured Effects\' as displayName, \'\' as iconPath, \'\' as free, \'\' as purchased, \'\' as contentPath, 0 as featureisFreeWithLogin, 0 as type)"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 753
    const-string v5, " UNION ALL "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 756
    :cond_13
    const/4 v5, 0x4

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "effect"

    aput-object v6, v3, v5

    const-string v5, "frame"

    aput-object v5, v3, v8

    const/4 v5, 0x2

    const-string v6, "sticker"

    aput-object v6, v3, v5

    const/4 v5, 0x3

    const-string v6, "overlay"

    aput-object v6, v3, v5

    .line 758
    .local v3, "packTypes":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2a
    array-length v5, v3

    if-ge v2, v5, :cond_1b9

    .line 760
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SELECT * FROM (  SELECT "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit16 v6, v2, 0x3e8

    neg-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_id"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "identifier"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "packType"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 765
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getContext()Landroid/content/Context;

    move-result-object v6

    aget-object v7, v3, v2

    invoke-static {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackFeaturedLabel(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "displayName"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "iconPath"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "free"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "purchased"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'\' as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "contentPath"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "0 as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "featureisFreeWithLogin"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "type"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 760
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 773
    const-string v5, " UNION ALL "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 774
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SELECT * FROM ( SELECT pack_id as _id, pack_identifier as identifier, pack_type as packType, content_displayName as displayName, content_iconPath as iconPath, content_isFree as free, content_purchased as purchased, content_contentPath as contentPath, content_isFreeWithLogin as featureisFreeWithLogin, 2 as type FROM packs_table JOIN content_table ON ( packs_table.pack_id = content_table.content_packId) WHERE pack_type=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "pack_visible"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "=1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "pack_finishedDownloading"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "=1"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "pack_markedForDeletion"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "=0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ORDER BY "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "content_purchased"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ASC, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "pack_displayOrder"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ASC"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " LIMIT 0, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " )"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    add-int/lit8 v5, v2, 0x1

    array-length v6, v3

    if-ge v5, v6, :cond_1b5

    .line 794
    const-string v5, " UNION ALL "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 758
    :cond_1b5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2a

    .line 798
    :cond_1b9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 799
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_1c7

    .line 800
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    .line 802
    :cond_1c7
    return-object v4
.end method

.method public getFeaturedBanners(I)Landroid/database/Cursor;
    .registers 7
    .param p1, "featured"    # I

    .prologue
    const/4 v2, 0x0

    .line 667
    const/4 v3, 0x1

    if-ge p1, v3, :cond_5

    .line 689
    :cond_4
    :goto_4
    return-object v2

    .line 671
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SELECT pack_id as _id, pack_identifier as identifier, pack_type as packType, content_displayName as displayName, content_featureImageURL as featureURL, content_featureImageLocalPath as featureImageLocalPath, content_isFree as free, content_purchased as purchased, 0 as type FROM (SELECT * FROM content_table JOIN packs_table ON (packs_table.pack_id=content_table.content_packId) WHERE ifnull(length(content_featureImageURL), 0) > 0 AND pack_visible=1 AND pack_markedForDeletion=0 ORDER BY content_isFree DESC, pack_displayOrder DESC, pack_id DESC ) GROUP BY pack_type LIMIT 0, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 685
    .local v1, "query":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 686
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_4

    .line 687
    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_4
.end method

.method getFutureMessages(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p1, "messageType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1256
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1257
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId), packs_table, content_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1262
    const-string v8, "msg_type=? AND msgcnt_visited=0 AND ( strftime(\'%s\', datetime(\'now\')) BETWEEN strftime(\'%s\',msgcnt_beginDate) AND strftime(\'%s\', msgcnt_endDate) ) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0"

    .line 1268
    .local v8, "selection":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    .line 1270
    .local v4, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1271
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_23

    .line 1272
    const-string v3, "msg_type=? AND msgcnt_visited=0 AND ( strftime(\'%s\', datetime(\'now\')) BETWEEN strftime(\'%s\',msgcnt_beginDate) AND strftime(\'%s\', msgcnt_endDate) ) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0"

    const-string v7, "msgcnt_beginDate DESC"

    move-object v2, p2

    move-object v6, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1274
    :cond_23
    return-object v5
.end method

.method getHiddenPacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 15
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1042
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1043
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1047
    const-string v2, "pack_finishedDownloading=1 AND "

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1048
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack_type=\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\' AND "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1050
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 1051
    .local v8, "string":Ljava/lang/StringBuilder;
    const-string v2, "pack_visible=0 AND content_purchased=0"

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1053
    if-eqz p3, :cond_40

    .line 1054
    const-string v2, " AND "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1055
    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1058
    :cond_40
    const-string v2, " AND "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1059
    invoke-virtual {v0, v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1061
    const-string v2, "pack_markedForDeletion=0 "

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 1063
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1064
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_5c

    move-object v2, p2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, p5

    .line 1065
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 1067
    :cond_5c
    return-object v3
.end method

.method getInstalledPacks([Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "projectionIn"    # [Ljava/lang/String;
    .param p2, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1115
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1116
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1120
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1121
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-nez v1, :cond_12

    .line 1126
    :goto_11
    return-object v4

    :cond_12
    const-string v3, "content_purchased=1  AND pack_markedForDeletion=0 AND content_contentPath NOT NULL "

    move-object v2, p1

    move-object v5, v4

    move-object v6, v4

    move-object v7, p2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto :goto_11
.end method

.method getInstalledPacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 13
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1096
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1097
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1101
    const-string v8, "content_purchased=1  AND pack_type=? AND pack_markedForDeletion=0 AND content_contentPath NOT NULL "

    .line 1105
    .local v8, "selection":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    .line 1107
    .local v4, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1108
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_22

    .line 1109
    const-string v3, "content_purchased=1  AND pack_type=? AND pack_markedForDeletion=0 AND content_contentPath NOT NULL "

    move-object v2, p2

    move-object v6, v5

    move-object v7, p3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1111
    :cond_22
    return-object v5
.end method

.method getManifestVersion([Ljava/lang/String;)Landroid/database/Cursor;
    .registers 10
    .param p1, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 809
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 810
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "version_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 811
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 812
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_1b

    .line 813
    const-string v7, "version_id DESC"

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 815
    :cond_1b
    return-object v3
.end method

.method getMessageByIdentifier(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1139
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1140
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "messages_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1141
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1142
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_20

    .line 1143
    const-string v3, "msg_identifier=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1145
    :cond_20
    return-object v5
.end method

.method getMessageContent(J[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 13
    .param p1, "messageId"    # J
    .param p3, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1152
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1153
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1156
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1157
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_24

    .line 1158
    const-string v3, "msg_id=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 1161
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p3

    move-object v6, v5

    move-object v7, v5

    .line 1158
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1166
    :cond_24
    return-object v5
.end method

.method getMessages([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1174
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1175
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "messages_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1176
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1177
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_1a

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, v5

    move-object v7, v5

    .line 1178
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1180
    :cond_1a
    return-object v5
.end method

.method getNextMessage(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p1, "messageType"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1225
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1226
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId), packs_table, content_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1231
    const-string v8, "msg_type=? AND msgcnt_visited=0 AND msgcnt_contentPath IS NULL AND ( strftime(\'%s\', datetime(\'now\')) BETWEEN strftime(\'%s\',msgcnt_beginDate) AND strftime(\'%s\', msgcnt_endDate) ) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0"

    .line 1238
    .local v8, "selection":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    .line 1240
    .local v4, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1241
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_23

    .line 1242
    const-string v3, "msg_type=? AND msgcnt_visited=0 AND msgcnt_contentPath IS NULL AND ( strftime(\'%s\', datetime(\'now\')) BETWEEN strftime(\'%s\',msgcnt_beginDate) AND strftime(\'%s\', msgcnt_endDate) ) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0"

    const-string v7, "msgcnt_beginDate DESC"

    move-object v2, p2

    move-object v6, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1244
    :cond_23
    return-object v5
.end method

.method getPackById(J[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 13
    .param p1, "id"    # J
    .param p3, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1002
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1003
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1004
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1005
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_24

    .line 1006
    const-string v3, "pack_id=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p3

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1008
    :cond_24
    return-object v5
.end method

.method getPackByIdentifier(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 989
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 990
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 991
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 992
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_20

    .line 993
    const-string v3, "pack_identifier=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 995
    :cond_20
    return-object v5
.end method

.method getPackContentById(I[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "packId"    # I
    .param p2, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 860
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 861
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 862
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 865
    if-eqz v1, :cond_24

    .line 866
    const-string v3, "packs_table.pack_id=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 869
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    .line 866
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 874
    :cond_24
    return-object v5
.end method

.method getPackContentByIdentifier(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 882
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 883
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 886
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 887
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_20

    .line 888
    const-string v3, "packs_table.pack_identifier=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 896
    :cond_20
    return-object v5
.end method

.method getPackDownloadStatus(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "packId"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 823
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 824
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_download_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 825
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 826
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_24

    .line 827
    const-string v3, "download_packId=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 830
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    .line 827
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 835
    :cond_24
    return-object v5
.end method

.method getPackIdOfDownload(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "downloadId"    # Ljava/lang/String;
    .param p2, "projectionIn"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 839
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 840
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_download_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 841
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 842
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_24

    .line 843
    const-string v3, "download_refId=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 846
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    .line 843
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 851
    :cond_24
    return-object v5
.end method

.method getPackItemById(J[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 13
    .param p1, "itemId"    # J
    .param p3, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 945
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 946
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "items_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 947
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 948
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_24

    .line 949
    const-string v3, "item_id=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 952
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p3

    move-object v6, v5

    move-object v7, v5

    .line 949
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 957
    :cond_24
    return-object v5
.end method

.method getPackItemByIdentifier(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 14
    .param p1, "packIdentifier"    # Ljava/lang/String;
    .param p2, "itemIdentifier"    # Ljava/lang/String;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 967
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 968
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table, content_table, items_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 970
    const-string v2, "pack_id= content_packId AND item_packId=pack_id"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 972
    const-string v2, " AND pack_identifier="

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 973
    invoke-virtual {v0, p1}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhereEscapeString(Ljava/lang/String;)V

    .line 974
    const-string v2, " AND item_identifier="

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 975
    invoke-virtual {v0, p2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhereEscapeString(Ljava/lang/String;)V

    .line 977
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 979
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_2f

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v6, v5

    move-object v7, v5

    .line 980
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 982
    :cond_2f
    return-object v5
.end method

.method getPackItems(I[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "packId"    # I
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 929
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 930
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN items_table ON (packs_table.pack_id = items_table.item_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 934
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 935
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_24

    .line 936
    const-string v3, "pack_id=?"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v2

    move-object v2, p2

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 938
    :cond_24
    return-object v5
.end method

.method getPacks([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 915
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 916
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 917
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 918
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_1a

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, v5

    move-object v7, v5

    .line 919
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 921
    :cond_1a
    return-object v5
.end method

.method getPacksContent([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 13
    .param p1, "projectionIn"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 900
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 901
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v2, "packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 904
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 905
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_1a

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, v5

    move-object v7, p4

    .line 906
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 908
    :cond_1a
    return-object v5
.end method

.method getPermissions([Ljava/lang/String;)Landroid/database/Cursor;
    .registers 10
    .param p1, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1500
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1501
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_13

    .line 1502
    const-string v1, "permission_table"

    const-string v7, "perm_id DESC"

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 1504
    :cond_13
    return-object v3
.end method

.method getTray(Ljava/lang/String;IZZZZ)Landroid/database/Cursor;
    .registers 24
    .param p1, "packType"    # Ljava/lang/String;
    .param p2, "featuredCount"    # I
    .param p3, "freeOnly"    # Z
    .param p4, "showItems"    # Z
    .param p5, "showInstalledPacks"    # Z
    .param p6, "showOwnedDivider"    # Z

    .prologue
    .line 489
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getTrayFeaturedCount(Ljava/lang/String;Z)I

    move-result v3

    .line 490
    .local v3, "availableFeatured":I
    invoke-direct/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getTrayInstalledCount(Ljava/lang/String;)I

    move-result v7

    .line 491
    .local v7, "installedCount":I
    const/4 v12, 0x1

    if-gt v3, v12, :cond_14

    const/4 v12, 0x1

    if-le v7, v12, :cond_108

    :cond_14
    const/4 v11, 0x1

    .line 493
    .local v11, "showGetMore":Z
    :goto_15
    sget-object v12, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v13, "availableFeatured: %d"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-interface {v12, v13, v14}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 494
    sget-object v12, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v13, "installedCount: %d"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-interface {v12, v13, v14}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 496
    const/4 v8, 0x0

    .line 499
    .local v8, "packTypeArgs":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 502
    .local v4, "buffer":Ljava/lang/StringBuilder;
    if-eqz v11, :cond_44

    .line 503
    const-string v12, "SELECT -1 as _id, -1 as _order, \'\' as packagename, \'\' as identifier, 5 as type, \'\' as displayName, \'\' as path, \'\' as installDate, 0 as isFree, -1 as packId, \'\' as packDisplayName, 0 as isFreeWithLogin UNION ALL "

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    :cond_44
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " SELECT * from ( SELECT * from (SELECT pack_id as _id, pack_displayOrder as _order, pack_identifier as packagename, pack_identifier as identifier, 1 as type, content_displayName as displayName, content_iconPath as path, content_installDate as installDate, content_isFree as isFree, pack_id as packId, content_displayName as packDisplayName, content_isFreeWithLogin as isFreeWithLogin FROM packs_table, content_table WHERE pack_id=content_packId AND pack_visible=1 AND pack_finishedDownloading=1"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    if-eqz p3, :cond_10b

    const-string v12, " AND content_isFree=1"

    :goto_53
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " AND "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "content_iconPath"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " NOT NULL "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " AND "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "content_purchased"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "=0 "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " AND "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "pack_type"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "=? "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ORDER BY "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "pack_displayOrder"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ASC LIMIT "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " )"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ORDER BY "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "_order"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " DESC )"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    add-int/lit8 v8, v8, 0x1

    .line 547
    if-eqz p6, :cond_cf

    if-lez v7, :cond_cf

    .line 548
    const-string v12, "UNION ALL SELECT -1 as _id, -1 as _order, \'\' as packagename, \'\' as identifier, 7 as type, \'\' as displayName, \'\' as path, \'\' as installDate, 0 as isFree, -1 as packId, \'\' as packDisplayName, 0 as isFreeWithLogin"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    :cond_cf
    if-nez p4, :cond_d3

    if-eqz p5, :cond_d8

    .line 566
    :cond_d3
    const-string v12, " UNION ALL SELECT * from ("

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    :cond_d8
    if-eqz p5, :cond_e1

    .line 570
    const-string v12, "SELECT DISTINCT pack_id as _id, (pack_id * 10000) as _order, pack_identifier as packagename, pack_identifier as identifier, 2 as type, content_displayName as displayName, content_iconPath as path, content_installDate as installDate, content_isFree as isFree, pack_id as packId, content_displayName as packDisplayName, content_isFreeWithLogin as isFreeWithLogin FROM packs_table, content_table, items_table WHERE pack_id=content_packId  AND pack_id=item_packId AND pack_type=?  AND content_purchased=1  AND content_contentPath NOT NULL"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 591
    add-int/lit8 v8, v8, 0x1

    .line 595
    :cond_e1
    if-eqz p4, :cond_10f

    .line 596
    if-eqz p5, :cond_ea

    .line 597
    const-string v12, " UNION ALL"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    :cond_ea
    const-string v12, " SELECT item_id as _id, ((pack_id * 10000) + item_id ) as _order, pack_identifier as packagename, item_identifier as identifier, 0 as type, item_displayName as displayName, content_contentPath as path, content_installDate as installDate, content_isFree as isFree, pack_id as packId, content_displayName as packDisplayName, content_isFreeWithLogin as isFreeWithLogin FROM packs_table, content_table, items_table WHERE pack_id=content_packId AND pack_id=item_packId AND pack_type=?  AND content_purchased=1  AND content_contentPath NOT NULL  ORDER BY installDate DESC, _order ASC)"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 623
    add-int/lit8 v8, v8, 0x1

    .line 630
    :cond_f1
    :goto_f1
    if-eqz v11, :cond_f8

    .line 632
    const-string v12, " UNION ALL SELECT -1 as _id, -1 as _order, \'\' as packagename, \'\' as identifier, 6 as type, \'\' as displayName, \'\' as path, \'\' as installDate, 0 as isFree, -1 as packId, \'\' as packDisplayName, 0 as isFreeWithLogin"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    :cond_f8
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 653
    .local v9, "packTypeSelectionArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_fe
    if-ge v6, v8, :cond_117

    .line 654
    move-object/from16 v0, p1

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 653
    add-int/lit8 v6, v6, 0x1

    goto :goto_fe

    .line 491
    .end local v4    # "buffer":Ljava/lang/StringBuilder;
    .end local v6    # "i":I
    .end local v8    # "packTypeArgs":I
    .end local v9    # "packTypeSelectionArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v11    # "showGetMore":Z
    :cond_108
    const/4 v11, 0x0

    goto/16 :goto_15

    .line 520
    .restart local v4    # "buffer":Ljava/lang/StringBuilder;
    .restart local v8    # "packTypeArgs":I
    .restart local v11    # "showGetMore":Z
    :cond_10b
    const-string v12, ""

    goto/16 :goto_53

    .line 625
    :cond_10f
    if-eqz p5, :cond_f1

    .line 626
    const-string v12, " ORDER BY installDate DESC, _order ASC)"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f1

    .line 657
    .restart local v6    # "i":I
    .restart local v9    # "packTypeSelectionArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_117
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Ljava/lang/String;

    invoke-interface {v9, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    .line 658
    .local v10, "selectionArgs":[Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 659
    .local v5, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v5, :cond_132

    .line 661
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 663
    :goto_131
    return-object v12

    :cond_132
    const/4 v12, 0x0

    goto :goto_131
.end method

.method insertValues(Ljava/lang/String;Landroid/content/ContentValues;)J
    .registers 5
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 376
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {p1, p2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 153
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onConfigure"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_21

    .line 157
    const-string v0, "PRAGMA foreign_keys=ON;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 158
    const-string v0, "PRAGMA encoding=\"UTF-8\";"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 159
    const-string v0, "PRAGMA page_size=4096;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 160
    const-string v0, "PRAGMA cache_size=5000;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 162
    :cond_21
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 186
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "onCreate"

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 189
    const-string v7, "CREATE TABLE IF NOT EXISTS version_table (version_id INTEGER PRIMARY KEY AUTOINCREMENT, version_versionKey VARCHAR(255) NOT NULL, version_assetsBaseURL VARCHAR(255) NOT NULL );"

    .line 197
    .local v7, "versionTableCreate":Ljava/lang/String;
    const-string v6, "CREATE TABLE IF NOT EXISTS packs_table (pack_id INTEGER PRIMARY KEY AUTOINCREMENT, pack_identifier VARCHAR(255) NOT NULL UNIQUE, pack_type VARCHAR(255) NOT NULL, pack_finishedDownloading INTEGER NOT NULL DEFAULT 0, pack_markedForDeletion INTEGER NOT NULL DEFAULT 0, pack_visible INTEGER NOT NULL DEFAULT 1, pack_displayOrder INTEGER NOT NULL DEFAULT 0 ,pack_creationDate DATETIME DEFAULT (datetime(\'now\',\'localtime\')), pack_versionKey VARCHAR(255) NOT NULL);"

    .line 210
    .local v6, "packsTableCreate":Ljava/lang/String;
    const-string v4, "CREATE TABLE IF NOT EXISTS messages_table (msg_id INTEGER PRIMARY KEY AUTOINCREMENT, msg_type VARCHAR(255) NOT NULL, msg_identifier VARCHAR(255) NOT NULL UNIQUE, msg_versionKey VARCHAR(255) NOT NULL);"

    .line 218
    .local v4, "messageTableCreate":Ljava/lang/String;
    const-string v3, "CREATE TABLE IF NOT EXISTS messages_content_table ( msgcnt_id INTEGER PRIMARY KEY AUTOINCREMENT, msgcnt_messageId INTEGER NOT NULL, msgcnt_contentIdentifier VARCHAR(255), msgcnt_beginDate DATETIME, msgcnt_endDate DATETIME, msgcnt_contentURL TEXT NOT NULL, msgcnt_actionButton VARCHAR(255), msgcnt_dismissButton VARCHAR(255) NOT NULL, msgcnt_layoutStyle VARCHAR(255), msgcnt_paragraph TEXT NOT NULL, msgcnt_showNewBanner INTEGER NOT NULL DEFAULT 1, msgcnt_contentPath TEXT DEFAULT NULL, msgcnt_visited INTEGER NOT NULL DEFAULT 0, msgcnt_title VARCHAR(255),  FOREIGN KEY( msgcnt_messageId ) REFERENCES messages_table( msg_id ) ON DELETE CASCADE );"

    .line 240
    .local v3, "messageContentTableCreate":Ljava/lang/String;
    const-string v0, "CREATE TABLE IF NOT EXISTS content_table (content_id INTEGER PRIMARY KEY AUTOINCREMENT, content_packId INTEGER NOT NULL, content_contentVersion VARCHAR(255) NOT NULL, content_previewVersion VARCHAR(255) NOT NULL, content_iconVersion VARCHAR(255) NOT NULL,content_previewURL VARCHAR(255) NOT NULL, content_contentURL VARCHAR(255) NOT NULL, content_iconUrl VARCHAR(255) NOT NULL, content_isFree INTEGER DEFAULT 0, content_isFreeWithLogin INTEGER DEFAULT 0, content_displayName VARCHAR(255) NOT NULL, content_displayDescription VARCHAR(255), content_downloadRequested INTEGER NOT NULL DEFAULT 0, content_purchased INTEGER NOT NULL DEFAULT 0, content_previewPath VARCHAR(255), content_contentPath VARCHAR(255), content_author VARCHAR(255) DEFAULT \'\', content_authorHyperlink VARCHAR(255) DEFAULT \'\', content_socialMediaString VARCHAR(255) DEFAULT \'\', content_shopBackgroundColor VARCHAR(255) DEFAULT \'\', content_featureImageURL VARCHAR(255) DEFAULT \'\', content_featureImageVersion VARCHAR(255) DEFAULT \'\', content_detailImageURL VARCHAR(255) DEFAULT \'\', content_detailImageVersion VARCHAR(255) DEFAULT \'\', content_detailImageLocalPath VARCHAR(255) DEFAULT \'\', content_featureImageLocalPath VARCHAR(255) DEFAULT \'\', content_iconPath VARCHAR(255), content_iconNeedDownload INTEGER NOT NULL DEFAULT 0, content_previewNeedDownload INTEGER NOT NULL DEFAULT 0, content_contentNeedDownload INTEGER NOT NULL DEFAULT 0, content_installDate DATETIME NOT NULL DEFAULT (datetime(current_timestamp)), content_numItems INTEGER DEFAULT 0, FOREIGN KEY(content_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);"

    .line 278
    .local v0, "contentTableCreate":Ljava/lang/String;
    const-string v2, "CREATE TABLE IF NOT EXISTS items_table (item_id INTEGER PRIMARY KEY AUTOINCREMENT, item_identifier VARCHAR(255) NOT NULL, item_displayName VARCHAR(255), item_contentPath VARCHAR(255), item_options BLOB, item_packId INTEGER NOT NULL, FOREIGN KEY(item_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);"

    .line 289
    .local v2, "itemsTableCreate":Ljava/lang/String;
    const-string v5, "CREATE TABLE IF NOT EXISTS packs_download_table (downloadId INTEGER PRIMARY KEY AUTOINCREMENT, download_packId INTEGER NOT NULL UNIQUE, download_refId INTEGER, download_status INTEGER DEFAULT 0, FOREIGN KEY(download_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);"

    .line 299
    .local v5, "packsDownloadTableCreate":Ljava/lang/String;
    const-string v1, "CREATE TRIGGER notify_download_finished AFTER UPDATE OF content_iconPath ON content_table BEGIN UPDATE packs_table SET pack_finishedDownloading = 1 WHERE packs_table.pack_id = OLD.content_packId; END;"

    .line 310
    .local v1, "downloadCompleteTrigger":Ljava/lang/String;
    const-string v8, "CREATE TABLE IF NOT EXISTS version_table (version_id INTEGER PRIMARY KEY AUTOINCREMENT, version_versionKey VARCHAR(255) NOT NULL, version_assetsBaseURL VARCHAR(255) NOT NULL );"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 313
    const-string v8, "CREATE TABLE IF NOT EXISTS packs_table (pack_id INTEGER PRIMARY KEY AUTOINCREMENT, pack_identifier VARCHAR(255) NOT NULL UNIQUE, pack_type VARCHAR(255) NOT NULL, pack_finishedDownloading INTEGER NOT NULL DEFAULT 0, pack_markedForDeletion INTEGER NOT NULL DEFAULT 0, pack_visible INTEGER NOT NULL DEFAULT 1, pack_displayOrder INTEGER NOT NULL DEFAULT 0 ,pack_creationDate DATETIME DEFAULT (datetime(\'now\',\'localtime\')), pack_versionKey VARCHAR(255) NOT NULL);"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 316
    const-string v8, "CREATE TABLE IF NOT EXISTS messages_table (msg_id INTEGER PRIMARY KEY AUTOINCREMENT, msg_type VARCHAR(255) NOT NULL, msg_identifier VARCHAR(255) NOT NULL UNIQUE, msg_versionKey VARCHAR(255) NOT NULL);"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 318
    const-string v8, "CREATE TABLE IF NOT EXISTS messages_content_table ( msgcnt_id INTEGER PRIMARY KEY AUTOINCREMENT, msgcnt_messageId INTEGER NOT NULL, msgcnt_contentIdentifier VARCHAR(255), msgcnt_beginDate DATETIME, msgcnt_endDate DATETIME, msgcnt_contentURL TEXT NOT NULL, msgcnt_actionButton VARCHAR(255), msgcnt_dismissButton VARCHAR(255) NOT NULL, msgcnt_layoutStyle VARCHAR(255), msgcnt_paragraph TEXT NOT NULL, msgcnt_showNewBanner INTEGER NOT NULL DEFAULT 1, msgcnt_contentPath TEXT DEFAULT NULL, msgcnt_visited INTEGER NOT NULL DEFAULT 0, msgcnt_title VARCHAR(255),  FOREIGN KEY( msgcnt_messageId ) REFERENCES messages_table( msg_id ) ON DELETE CASCADE );"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 321
    const-string v8, "CREATE TABLE IF NOT EXISTS content_table (content_id INTEGER PRIMARY KEY AUTOINCREMENT, content_packId INTEGER NOT NULL, content_contentVersion VARCHAR(255) NOT NULL, content_previewVersion VARCHAR(255) NOT NULL, content_iconVersion VARCHAR(255) NOT NULL,content_previewURL VARCHAR(255) NOT NULL, content_contentURL VARCHAR(255) NOT NULL, content_iconUrl VARCHAR(255) NOT NULL, content_isFree INTEGER DEFAULT 0, content_isFreeWithLogin INTEGER DEFAULT 0, content_displayName VARCHAR(255) NOT NULL, content_displayDescription VARCHAR(255), content_downloadRequested INTEGER NOT NULL DEFAULT 0, content_purchased INTEGER NOT NULL DEFAULT 0, content_previewPath VARCHAR(255), content_contentPath VARCHAR(255), content_author VARCHAR(255) DEFAULT \'\', content_authorHyperlink VARCHAR(255) DEFAULT \'\', content_socialMediaString VARCHAR(255) DEFAULT \'\', content_shopBackgroundColor VARCHAR(255) DEFAULT \'\', content_featureImageURL VARCHAR(255) DEFAULT \'\', content_featureImageVersion VARCHAR(255) DEFAULT \'\', content_detailImageURL VARCHAR(255) DEFAULT \'\', content_detailImageVersion VARCHAR(255) DEFAULT \'\', content_detailImageLocalPath VARCHAR(255) DEFAULT \'\', content_featureImageLocalPath VARCHAR(255) DEFAULT \'\', content_iconPath VARCHAR(255), content_iconNeedDownload INTEGER NOT NULL DEFAULT 0, content_previewNeedDownload INTEGER NOT NULL DEFAULT 0, content_contentNeedDownload INTEGER NOT NULL DEFAULT 0, content_installDate DATETIME NOT NULL DEFAULT (datetime(current_timestamp)), content_numItems INTEGER DEFAULT 0, FOREIGN KEY(content_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 324
    const-string v8, "CREATE TABLE IF NOT EXISTS items_table (item_id INTEGER PRIMARY KEY AUTOINCREMENT, item_identifier VARCHAR(255) NOT NULL, item_displayName VARCHAR(255), item_contentPath VARCHAR(255), item_options BLOB, item_packId INTEGER NOT NULL, FOREIGN KEY(item_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 327
    const-string v8, "CREATE TABLE IF NOT EXISTS packs_download_table (downloadId INTEGER PRIMARY KEY AUTOINCREMENT, download_packId INTEGER NOT NULL UNIQUE, download_refId INTEGER, download_status INTEGER DEFAULT 0, FOREIGN KEY(download_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 330
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 333
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 336
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsContentColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 344
    const-string v8, "CREATE TRIGGER notify_download_finished AFTER UPDATE OF content_iconPath ON content_table BEGIN UPDATE packs_table SET pack_finishedDownloading = 1 WHERE packs_table.pack_id = OLD.content_packId; END;"

    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 346
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 9
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 145
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDowngrade from %d to %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 146
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "aviarycds.sqlite"

    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 147
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 149
    :cond_27
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 7
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 350
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onOpen, isReadOnly: %b"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 352
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_2e

    .line 354
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_24

    .line 355
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 357
    :cond_24
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader;->loadDefaultContent(Landroid/database/sqlite/SQLiteDatabase;)Z

    .line 360
    :cond_2e
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 361
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 9
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 71
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 72
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Could not upgrade table, db is read only"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 141
    :cond_d
    :goto_d
    return-void

    .line 76
    :cond_e
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onUpgrade: %d >> %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 79
    const/4 v0, 0x3

    if-gt p2, v0, :cond_2c

    .line 80
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 84
    :cond_2c
    const/4 v0, 0x4

    if-gt p2, v0, :cond_35

    .line 85
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 86
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsContentColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 90
    :cond_35
    const/4 v0, 0x5

    if-gt p2, v0, :cond_48

    .line 91
    const-string v0, "DROP TABLE IF EXISTS subscription_table"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 92
    const-string v0, "DROP TABLE IF EXISTS subscriptions_content_table"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 93
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 94
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsContentColumns;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 98
    :cond_48
    const/4 v0, 0x6

    if-gt p2, v0, :cond_73

    .line 99
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_author VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 101
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_authorHyperlink VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 103
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_socialMediaString VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 105
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_shopBackgroundColor VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 107
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_featureImageURL VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 109
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_featureImageVersion VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_detailImageURL VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 113
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_detailImageVersion VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 118
    :cond_73
    const/4 v0, 0x7

    if-gt p2, v0, :cond_80

    .line 120
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_detailImageLocalPath VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 123
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_featureImageLocalPath VARCHAR(255) DEFAULT \'\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 129
    :cond_80
    const/16 v0, 0x8

    if-gt p2, v0, :cond_84

    .line 134
    :cond_84
    const/16 v0, 0x9

    if-gt p2, v0, :cond_d

    .line 135
    const-string v0, "ALTER TABLE content_table ADD COLUMN content_isFreeWithLogin INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_d
.end method

.method replacePermissions(Landroid/content/ContentValues;)J
    .registers 8
    .param p1, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 388
    const-wide/16 v2, 0x0

    .line 389
    .local v2, "result":J
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 390
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_1e

    .line 391
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 393
    :try_start_b
    const-string v1, "permission_table"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p0, v0, v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->delete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 394
    const-string v1, "permission_table"

    invoke-static {v1, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_1f

    move-result-wide v2

    .line 396
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 398
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 400
    :cond_1e
    return-wide v2

    .line 396
    :catchall_1f
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    throw v1
.end method

.method setMessageasVisited(JI)I
    .registers 11
    .param p1, "messageContentId"    # J
    .param p3, "visited"    # I

    .prologue
    .line 1432
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1433
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "msgcnt_visited"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1435
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1436
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_27

    .line 1437
    const-string v2, "messages_content_table"

    const-string v3, "msgcnt_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    .line 1441
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1437
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 1443
    :goto_26
    return v2

    :cond_27
    const/4 v2, -0x1

    goto :goto_26
.end method

.method updateDownloadStatus(JI)I
    .registers 11
    .param p1, "downloadRefId"    # J
    .param p3, "status"    # I

    .prologue
    .line 1285
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1286
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "download_status"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1287
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1288
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_27

    .line 1289
    const-string v2, "packs_download_table"

    const-string v3, "download_refId=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    .line 1292
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1289
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 1294
    :goto_26
    return v2

    :cond_27
    const/4 v2, -0x1

    goto :goto_26
.end method

.method updateMessage(JLandroid/content/ContentValues;)I
    .registers 11
    .param p1, "messageId"    # J
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1403
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1404
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_19

    .line 1405
    const-string v1, "messages_table"

    const-string v2, "msg_id=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 1406
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1405
    invoke-virtual {v0, v1, p3, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1409
    :goto_18
    return v1

    :cond_19
    const/4 v1, -0x1

    goto :goto_18
.end method

.method updateMessageContent(JJLandroid/content/ContentValues;)I
    .registers 13
    .param p1, "messageId"    # J
    .param p3, "messageContentId"    # J
    .param p5, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1417
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1418
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_20

    .line 1419
    const-string v1, "messages_content_table"

    const-string v2, "msgcnt_messageId=? AND msgcnt_id=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 1422
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1419
    invoke-virtual {v0, v1, p5, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1424
    :goto_1f
    return v1

    :cond_20
    const/4 v1, -0x1

    goto :goto_1f
.end method

.method updatePack(JLandroid/content/ContentValues;)I
    .registers 5
    .param p1, "packId"    # J
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1302
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updatePack(JLandroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v0

    return v0
.end method

.method updatePack(JLandroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)I
    .registers 10
    .param p1, "packId"    # J
    .param p3, "values"    # Landroid/content/ContentValues;
    .param p4, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 1309
    if-eqz p4, :cond_15

    .line 1310
    const-string v0, "packs_table"

    const-string v1, "pack_id=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p4, v0, p3, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 1312
    :goto_14
    return v0

    :cond_15
    const/4 v0, -0x1

    goto :goto_14
.end method

.method updatePackContent(JJLandroid/content/ContentValues;)I
    .registers 15
    .param p1, "packId"    # J
    .param p3, "contentId"    # J
    .param p5, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1320
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updatePackContent(JJLandroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v0

    return v0
.end method

.method updatePackContent(JJLandroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)I
    .registers 12
    .param p1, "packId"    # J
    .param p3, "contentId"    # J
    .param p5, "values"    # Landroid/content/ContentValues;
    .param p6, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 1324
    if-eqz p6, :cond_1c

    .line 1325
    const-string v0, "content_table"

    const-string v1, "content_id=? AND content_packId=?"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 1328
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 1325
    invoke-virtual {p6, v0, p5, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 1330
    :goto_1b
    return v0

    :cond_1c
    const/4 v0, -0x1

    goto :goto_1b
.end method

.method updatePackContentPurchasedStatus(JJILjava/lang/String;)I
    .registers 16
    .param p1, "packId"    # J
    .param p3, "contentId"    # J
    .param p5, "status"    # I
    .param p6, "contentPath"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1360
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "updatePackContentPurchasedstatus: %d, content: %s"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p6, v4, v7

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1361
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1363
    .local v1, "values":Landroid/content/ContentValues;
    if-eqz p6, :cond_53

    .line 1364
    const-string v2, "content_contentPath"

    invoke-virtual {v1, v2, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1365
    const-string v2, "content_installDate"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1370
    :goto_2d
    const-string v2, "content_purchased"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1371
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1372
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_59

    .line 1373
    const-string v2, "content_table"

    const-string v3, "content_id=? AND content_packId=?"

    new-array v4, v8, [Ljava/lang/String;

    .line 1376
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    .line 1373
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 1378
    :goto_52
    return v2

    .line 1367
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_53
    const-string v2, "content_contentPath"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_2d

    .line 1378
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_59
    const/4 v2, -0x1

    goto :goto_52
.end method

.method updatePackContentRequestDownloadStatus(JI)I
    .registers 11
    .param p1, "packId"    # J
    .param p3, "status"    # I

    .prologue
    .line 1386
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1387
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "content_downloadRequested"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1388
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1389
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_27

    .line 1390
    const-string v2, "content_table"

    const-string v3, "content_packId=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    .line 1393
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1390
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 1395
    :goto_26
    return v2

    :cond_27
    const/4 v2, -0x1

    goto :goto_26
.end method
