package com.adobe.creativesdk.aviary.internal.cds;

import android.database.sqlite.SQLiteDatabase;

public final class SubscriptionsColumns
{
  static void create(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS subscription_table (subscription_id INTEGER PRIMARY KEY AUTOINCREMENT, subscription_version_key VARCHAR(255) NOT NULL, subscription_visible INTEGER NOT NULL DEFAULT 1, subscription_identifier VARCHAR(255) NOT NULL UNIQUE);");
  }
}
