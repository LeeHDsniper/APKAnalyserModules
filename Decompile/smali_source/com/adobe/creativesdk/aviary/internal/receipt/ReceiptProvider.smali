.class Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
.super Ljava/lang/Object;
.source "ReceiptProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider$DatabaseHelper;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private static sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;


# instance fields
.field private mDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-string v0, "ReceiptProvider"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    :try_start_3
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider$DatabaseHelper;

    invoke-direct {v1, p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider$DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_e} :catch_f

    .line 45
    :goto_e
    return-void

    .line 41
    :catch_f
    move-exception v0

    .line 42
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 43
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "cannot open the database!!!!"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_e
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 132
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    if-nez v1, :cond_17

    .line 133
    const-class v2, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    monitor-enter v2

    .line 134
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    .line 135
    .local v0, "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    if-nez v0, :cond_16

    .line 136
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    monitor-enter v3
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_1d

    .line 137
    :try_start_e
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    .line 138
    monitor-exit v3
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_1a

    .line 140
    :cond_16
    :try_start_16
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_1d

    .line 142
    .end local v0    # "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    :cond_17
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    return-object v1

    .line 138
    .restart local v0    # "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    :catchall_1a
    move-exception v1

    :try_start_1b
    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    :try_start_1c
    throw v1

    .line 140
    .end local v0    # "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    :catchall_1d
    move-exception v1

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_1d

    throw v1
.end method


# virtual methods
.method public addContent(Lorg/json/JSONObject;)J
    .registers 7
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    const/4 v4, 0x0

    .line 61
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_8

    .line 62
    const-wide/16 v2, -0x1

    .line 70
    :goto_7
    return-wide v2

    .line 65
    :cond_8
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "addContent: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 66
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 67
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "r_json"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 68
    const-string v1, "r_item_type"

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 69
    const-string v1, "r_fail_count"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 70
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "receipts_table"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    goto :goto_7
.end method

.method public addTicket(Lorg/json/JSONObject;Z)J
    .registers 9
    .param p1, "json"    # Lorg/json/JSONObject;
    .param p2, "isFree"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 48
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_9

    .line 49
    const-wide/16 v2, -0x1

    .line 57
    :goto_8
    return-wide v2

    .line 52
    :cond_9
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "addTicket: %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p1, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 53
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 54
    .local v0, "values":Landroid/content/ContentValues;
    const-string v2, "r_json"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 55
    const-string v2, "r_item_type"

    if-eqz p2, :cond_4a

    :goto_30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 56
    const-string v1, "r_fail_count"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 57
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "receipts_table"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    goto :goto_8

    .line 55
    :cond_4a
    const/4 v1, 0x2

    goto :goto_30
.end method

.method deleteReceipt(J)I
    .registers 10
    .param p1, "id"    # J

    .prologue
    const/4 v0, 0x0

    .line 125
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_6

    .line 128
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "receipts_table"

    const-string v3, "r_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_5
.end method

.method getAccountContent()Landroid/database/Cursor;
    .registers 10

    .prologue
    const/4 v2, 0x0

    .line 85
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_6

    .line 93
    :goto_5
    return-object v2

    .line 89
    :cond_6
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 90
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v1, "receipts_table"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 91
    const-string v8, "r_item_type=?"

    .line 92
    .local v8, "selection":Ljava/lang/String;
    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v1

    .line 93
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "r_item_type=?"

    const-string v7, "r_id DESC"

    move-object v5, v2

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_5
.end method

.method public getReceipts()Landroid/database/Cursor;
    .registers 10

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 97
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_8

    .line 105
    :goto_7
    return-object v2

    .line 101
    :cond_8
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 102
    .local v0, "builder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v1, "receipts_table"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 103
    const-string v8, "r_item_type=? OR r_item_type=?"

    .line 104
    .local v8, "selection":Ljava/lang/String;
    new-array v4, v6, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v1

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v5

    .line 105
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "r_item_type=? OR r_item_type=?"

    const-string v7, "r_id DESC"

    move-object v5, v2

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_7
.end method

.method updateReceipt(JLandroid/content/ContentValues;)J
    .registers 9
    .param p1, "id"    # J
    .param p3, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 116
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_7

    .line 117
    const-wide/16 v2, -0x1

    .line 121
    :goto_6
    return-wide v2

    .line 119
    :cond_7
    const-string v0, "r_id=?"

    .line 120
    .local v0, "where":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 121
    .local v1, "whereArgs":[Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "receipts_table"

    const-string v4, "r_id=?"

    invoke-virtual {v2, v3, p3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    goto :goto_6
.end method
