.class public final Lcom/adobe/creativesdk/aviary/internal/cds/SubscriptionsContentColumns;
.super Ljava/lang/Object;
.source "SubscriptionsContentColumns.java"


# direct methods
.method static create(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 19
    const-string v0, "CREATE TABLE IF NOT EXISTS subscriptions_content_table (subscriptions_content_id INTEGER PRIMARY KEY AUTOINCREMENT, subscriptions_subscription_id INTEGER NOT NULL, subscriptions_content_display_name VARCHAR(255) NOT NULL, subscriptions_content_display_description VARCHAR(255) NOT NULL, subscriptions_content_duration_tier INTEGER NOT NULL, subscriptions_content_purchased INTEGER NOT NULL DEFAULT 0, subscriptions_content_unlock_type VARCHAR(255) NOT NULL, FOREIGN KEY(subscriptions_subscription_id) REFERENCES subscription_table(subscription_id) ON DELETE CASCADE);"

    .line 29
    .local v0, "subscriptionsContentTableCreate":Ljava/lang/String;
    const-string v1, "CREATE TABLE IF NOT EXISTS subscriptions_content_table (subscriptions_content_id INTEGER PRIMARY KEY AUTOINCREMENT, subscriptions_subscription_id INTEGER NOT NULL, subscriptions_content_display_name VARCHAR(255) NOT NULL, subscriptions_content_display_description VARCHAR(255) NOT NULL, subscriptions_content_duration_tier INTEGER NOT NULL, subscriptions_content_purchased INTEGER NOT NULL DEFAULT 0, subscriptions_content_unlock_type VARCHAR(255) NOT NULL, FOREIGN KEY(subscriptions_subscription_id) REFERENCES subscription_table(subscription_id) ON DELETE CASCADE);"

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 30
    return-void
.end method
