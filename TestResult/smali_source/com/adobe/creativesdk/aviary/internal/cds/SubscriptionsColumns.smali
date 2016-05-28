.class public final Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsColumns;
.super Ljava/lang/Object;
.source "SubscriptionsColumns.java"


# direct methods
.method static create(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 16
    const-string v0, "CREATE TABLE IF NOT EXISTS subscription_table (subscription_id INTEGER PRIMARY KEY AUTOINCREMENT, subscription_version_key VARCHAR(255) NOT NULL, subscription_visible INTEGER NOT NULL DEFAULT 1, subscription_identifier VARCHAR(255) NOT NULL UNIQUE);"

    .line 22
    .local v0, "subscriptionsTableCreate":Ljava/lang/String;
    const-string v1, "CREATE TABLE IF NOT EXISTS subscription_table (subscription_id INTEGER PRIMARY KEY AUTOINCREMENT, subscription_version_key VARCHAR(255) NOT NULL, subscription_visible INTEGER NOT NULL DEFAULT 1, subscription_identifier VARCHAR(255) NOT NULL UNIQUE);"

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 23
    return-void
.end method
