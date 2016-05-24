.class final Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "ReceiptProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DatabaseHelper"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 151
    const-string v0, "receipts"

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 152
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 156
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCreate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 157
    const-string v0, "CREATE TABLE IF NOT EXISTS receipts_table( r_id INTEGER PRIMARY KEY AUTOINCREMENT, r_json BLOB NOT NULL, r_item_type INTEGER NOT NULL DEFAULT 0, r_fail_count INTEGER NOT NULL DEFAULT 0 )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 158
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 4
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 182
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 184
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onOpen"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 186
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_21

    .line 187
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onConfigure"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 189
    const-string v0, "PRAGMA foreign_keys = ON;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 190
    const-string v0, "PRAGMA encoding=\"UTF-8\";"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 192
    :cond_21
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 6
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 162
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onUpgrade"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 164
    const/4 v0, 0x3

    if-ge p2, v0, :cond_19

    .line 165
    const-string v0, "DROP TABLE if exists uploads_table"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 166
    const-string v0, "ALTER TABLE receipts_table ADD COLUMN r_item_type INTEGER NOT NULL DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 172
    const-string v0, "ALTER TABLE receipts_table ADD COLUMN r_fail_count INTEGER NOT NULL DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 178
    :cond_19
    return-void
.end method
