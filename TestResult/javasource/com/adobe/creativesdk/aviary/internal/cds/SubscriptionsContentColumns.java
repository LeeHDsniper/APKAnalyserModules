package com.adobe.creativesdk.aviary.internal.cds;

import android.database.sqlite.SQLiteDatabase;

public final class SubscriptionsContentColumns
{
  static void create(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS subscriptions_content_table (subscriptions_content_id INTEGER PRIMARY KEY AUTOINCREMENT, subscriptions_subscription_id INTEGER NOT NULL, subscriptions_content_display_name VARCHAR(255) NOT NULL, subscriptions_content_display_description VARCHAR(255) NOT NULL, subscriptions_content_duration_tier INTEGER NOT NULL, subscriptions_content_purchased INTEGER NOT NULL DEFAULT 0, subscriptions_content_unlock_type VARCHAR(255) NOT NULL, FOREIGN KEY(subscriptions_subscription_id) REFERENCES subscription_table(subscription_id) ON DELETE CASCADE);");
  }
}
