package com.localytics.android;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.provider.BaseColumns;
import android.util.Log;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import org.json.JSONObject;

class LocalyticsProvider
{
  private static final Map<String, String> sCountProjectionMap = Collections.unmodifiableMap(getCountProjectionMap());
  private static final Object[] sLocalyticsProviderIntrinsicLock;
  private static final Map<String, LocalyticsProvider> sLocalyticsProviderMap = new HashMap();
  private static final Set<String> sValidTables = Collections.unmodifiableSet(getValidTables());
  private final SQLiteDatabase mDb;
  
  static
  {
    sLocalyticsProviderIntrinsicLock = new Object[0];
  }
  
  protected LocalyticsProvider(Context paramContext, String paramString)
  {
    mDb = new DatabaseHelper(paramContext, String.format("com.localytics.android.%s.sqlite", new Object[] { DatapointHelper.getSha256_buggy(paramString) }), 18).getWritableDatabase();
  }
  
  private static boolean deleteDirectory(File paramFile)
  {
    if ((paramFile.exists()) && (paramFile.isDirectory()))
    {
      String[] arrayOfString = paramFile.list();
      int j = arrayOfString.length;
      int i = 0;
      while (i < j)
      {
        if (!deleteDirectory(new File(paramFile, arrayOfString[i]))) {
          return false;
        }
        i += 1;
      }
    }
    return paramFile.delete();
  }
  
  static void deleteOldFiles(Context paramContext)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context cannot be null");
    }
    deleteDirectory(new File(paramContext.getFilesDir(), "localytics"));
  }
  
  private static HashMap<String, String> getCountProjectionMap()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("_count", "COUNT(*)");
    return localHashMap;
  }
  
  public static LocalyticsProvider getInstance(Context paramContext, String paramString)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context cannot be null");
    }
    if (paramContext.getClass().getName().equals("android.test.RenamingDelegatingContext")) {
      return new LocalyticsProvider(paramContext, paramString);
    }
    synchronized (sLocalyticsProviderIntrinsicLock)
    {
      LocalyticsProvider localLocalyticsProvider2 = (LocalyticsProvider)sLocalyticsProviderMap.get(paramString);
      LocalyticsProvider localLocalyticsProvider1 = localLocalyticsProvider2;
      if (localLocalyticsProvider2 == null)
      {
        localLocalyticsProvider1 = new LocalyticsProvider(paramContext, paramString);
        sLocalyticsProviderMap.put(paramString, localLocalyticsProvider1);
      }
      return localLocalyticsProvider1;
    }
  }
  
  private static Set<String> getValidTables()
  {
    HashSet localHashSet = new HashSet();
    localHashSet.add("api_keys");
    localHashSet.add("attributes");
    localHashSet.add("events");
    localHashSet.add("event_history");
    localHashSet.add("sessions");
    localHashSet.add("upload_blobs");
    localHashSet.add("upload_blob_events");
    localHashSet.add("info");
    localHashSet.add("identifiers");
    localHashSet.add("amp_rules");
    localHashSet.add("amp_ruleevent");
    localHashSet.add("amp_conditions");
    localHashSet.add("amp_condition_values");
    localHashSet.add("amp_displayed");
    localHashSet.add("custom_dimensions");
    localHashSet.add("profile");
    return localHashSet;
  }
  
  private static boolean isValidTable(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    return sValidTables.contains(paramString);
  }
  
  Map<String, String> getUserIdAndType()
  {
    String str1 = "";
    int i = 0;
    Object localObject3 = null;
    label208:
    label210:
    for (;;)
    {
      try
      {
        Object localObject4 = query("identifiers", null, "key = \"customer_id\"", null, null);
        localObject3 = localObject4;
        if (((Cursor)localObject4).moveToFirst())
        {
          localObject3 = localObject4;
          str1 = ((Cursor)localObject4).getString(((Cursor)localObject4).getColumnIndexOrThrow("value"));
          i = 1;
        }
        localObject3 = localObject4;
        if (localObject4 != null)
        {
          ((Cursor)localObject4).close();
          localObject3 = null;
        }
        localObject4 = str1;
        if (i == 0) {}
        Cursor localCursor;
        String str2 = "anonymous";
      }
      finally
      {
        try
        {
          localCursor = query("api_keys", new String[] { "uuid" }, null, null, null);
          localObject3 = localCursor;
          if (localCursor.moveToFirst())
          {
            localObject3 = localCursor;
            str1 = localCursor.getString(localCursor.getColumnIndexOrThrow("uuid"));
          }
          localObject4 = str1;
          if (localCursor != null)
          {
            localCursor.close();
            localObject4 = str1;
          }
          localObject3 = new HashMap();
          ((HashMap)localObject3).put("id", localObject4);
          if (i == 0) {
            break label210;
          }
          str1 = "known";
          ((HashMap)localObject3).put("type", str1);
          return localObject3;
        }
        finally
        {
          if (localObject3 == null) {
            break label208;
          }
          ((Cursor)localObject3).close();
        }
        localObject1 = finally;
        if (localObject3 != null) {
          ((Cursor)localObject3).close();
        }
      }
    }
  }
  
  public long insert(String paramString, ContentValues paramContentValues)
  {
    if (!isValidTable(paramString)) {
      throw new IllegalArgumentException(String.format("tableName %s is invalid", new Object[] { paramString }));
    }
    if (paramContentValues == null) {
      throw new IllegalArgumentException("values cannot be null");
    }
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", String.format("Insert table: %s, values: %s", new Object[] { paramString, paramContentValues.toString() }));
    }
    long l = mDb.insertOrThrow(paramString, null, paramContentValues);
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", String.format("Inserted row with new id %d", new Object[] { Long.valueOf(l) }));
    }
    return l;
  }
  
  public Cursor query(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3)
  {
    if (!isValidTable(paramString1)) {
      throw new IllegalArgumentException(String.format("tableName %s is invalid", new Object[] { paramString1 }));
    }
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", String.format("Query table: %s, projection: %s, selection: %s, selectionArgs: %s", new Object[] { paramString1, Arrays.toString(paramArrayOfString1), paramString2, Arrays.toString(paramArrayOfString2) }));
    }
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables(paramString1);
    if ((paramArrayOfString1 != null) && (1 == paramArrayOfString1.length) && ("_count".equals(paramArrayOfString1[0]))) {
      localSQLiteQueryBuilder.setProjectionMap(sCountProjectionMap);
    }
    paramString1 = localSQLiteQueryBuilder.query(mDb, paramArrayOfString1, paramString2, paramArrayOfString2, null, null, paramString3);
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", "Query result is: " + DatabaseUtils.dumpCursorToString(paramString1));
    }
    return paramString1;
  }
  
  public int remove(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    if (!isValidTable(paramString1)) {
      throw new IllegalArgumentException(String.format("tableName %s is invalid", new Object[] { paramString1 }));
    }
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", String.format("Delete table: %s, selection: %s, selectionArgs: %s", new Object[] { paramString1, paramString2, Arrays.toString(paramArrayOfString) }));
    }
    if (paramString2 == null) {}
    for (int i = mDb.delete(paramString1, "1", null);; i = mDb.delete(paramString1, paramString2, paramArrayOfString))
    {
      if (Constants.IS_LOGGABLE) {
        Log.v("Localytics", String.format("Deleted %d rows", new Object[] { Integer.valueOf(i) }));
      }
      return i;
    }
  }
  
  public Object runBatchTransaction(Callable<Object> paramCallable)
  {
    if (paramCallable == null) {
      throw new IllegalArgumentException("callable cannot be null");
    }
    mDb.beginTransaction();
    try
    {
      paramCallable = paramCallable.call();
      mDb.setTransactionSuccessful();
      return paramCallable;
    }
    catch (Exception paramCallable)
    {
      throw new RuntimeException("Database batch transaction failed");
    }
    finally
    {
      mDb.endTransaction();
    }
  }
  
  public void runBatchTransaction(Runnable paramRunnable)
  {
    if (paramRunnable == null) {
      throw new IllegalArgumentException("runnable cannot be null");
    }
    mDb.beginTransaction();
    try
    {
      paramRunnable.run();
      mDb.setTransactionSuccessful();
      return;
    }
    finally
    {
      mDb.endTransaction();
    }
  }
  
  public int update(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString)
  {
    if (!isValidTable(paramString1)) {
      throw new IllegalArgumentException(String.format("tableName %s is invalid", new Object[] { paramString1 }));
    }
    if (Constants.IS_LOGGABLE) {
      Log.v("Localytics", String.format("Update table: %s, values: %s, selection: %s, selectionArgs: %s", new Object[] { paramString1, paramContentValues.toString(), paramString2, Arrays.toString(paramArrayOfString) }));
    }
    return mDb.update(paramString1, paramContentValues, paramString2, paramArrayOfString);
  }
  
  public static final class AttributesDbColumns
    implements BaseColumns
  {
    static final String ATTRIBUTE_CUSTOM_DIMENSION_1 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_0" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_10 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_9" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_2 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_1" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_3 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_2" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_4 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_3" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_5 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_4" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_6 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_5" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_7 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_6" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_8 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_7" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_9 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_8" });
  }
  
  public static final class CustomDimensionsDbColumns
    implements BaseColumns
  {
    static final String CUSTOM_DIMENSION_1 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_0" });
    static final String CUSTOM_DIMENSION_10 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_9" });
    static final String CUSTOM_DIMENSION_2 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_1" });
    static final String CUSTOM_DIMENSION_3 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_2" });
    static final String CUSTOM_DIMENSION_4 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_3" });
    static final String CUSTOM_DIMENSION_5 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_4" });
    static final String CUSTOM_DIMENSION_6 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_5" });
    static final String CUSTOM_DIMENSION_7 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_6" });
    static final String CUSTOM_DIMENSION_8 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_7" });
    static final String CUSTOM_DIMENSION_9 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_8" });
  }
  
  private static final class DatabaseHelper
    extends SQLiteOpenHelper
  {
    private final Context mContext;
    
    public DatabaseHelper(Context paramContext, String paramString, int paramInt)
    {
      super(paramString, null, paramInt);
      mContext = paramContext;
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      if (paramSQLiteDatabase == null) {
        throw new IllegalArgumentException("db cannot be null");
      }
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT UNIQUE NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL CHECK(%s IN (%s, %s)));", new Object[] { "api_keys", "_id", "api_key", "uuid", "created_time", "created_time", "opt_out", "opt_out", "0", "1" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT UNIQUE NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s INTEGER NOT NULL CHECK (%s >= 0));", new Object[] { "sessions", "_id", "api_key_ref", "api_keys", "_id", "uuid", "session_start_wall_time", "session_start_wall_time", "localytics_library_version", "iu", "app_version", "android_version", "android_sdk", "device_model", "device_manufacturer", "device_android_id_hash", "device_telephony_id", "device_telephony_id_hash", "device_serial_number_hash", "device_wifi_mac_hash", "locale_language", "locale_country", "network_carrier", "network_country", "network_type", "device_country", "latitude", "longitude", "device_android_id", "device_advertising_id", "elapsed", "elapsed" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL DEFAULT 0, %s REAL, %s REAL, %s TEXT, %s TEXT, %s TEXT);", new Object[] { "events", "_id", "session_key_ref", "sessions", "_id", "uuid", "event_name", "real_time", "real_time", "wall_time", "wall_time", "clv_increase", "event_lat", "event_lng", "customer_id", "user_type", "ids" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT NOT NULL CHECK(%s IN (%s, %s)), %s TEXT NOT NULL, %s INTEGER);", new Object[] { "event_history", "_id", "session_key_ref", "sessions", "_id", "type", "type", Integer.valueOf(0), Integer.valueOf(1), "name", "processed_in_blob" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL);", new Object[] { "attributes", "_id", "events_key_ref", "events", "_id", "attribute_key", "attribute_value" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL);", new Object[] { "upload_blobs", "_id", "uuid" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "upload_blob_events", "_id", "upload_blobs_key_ref", "upload_blobs", "_id", "events_key_ref", "events", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s INTEGER, %s INTEGER, %s INTEGER);", new Object[] { "info", "_id", "fb_attribution", "play_attribution", "sender_id", "registration_id", "registration_version", "first_android_id", "first_telephony_id", "first_advertising_id", "package_name", "first_run", "push_disabled", "last_session_open_time" }));
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("fb_attribution", DatapointHelper.getFBAttribution(mContext));
      localContentValues.put("first_run", Boolean.TRUE);
      localContentValues.put("first_android_id", DatapointHelper.getAndroidIdOrNull(mContext));
      localContentValues.put("first_telephony_id", DatapointHelper.getTelephonyDeviceIdOrNull(mContext));
      localContentValues.put("first_advertising_id", DatapointHelper.getAdvertisingIdOrNull(mContext));
      localContentValues.put("package_name", mContext.getPackageName());
      paramSQLiteDatabase.insertOrThrow("info", null, localContentValues);
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);", new Object[] { "identifiers", "_id", "key", "value" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER NOT NULL, %s TEXT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)", new Object[] { "amp_rules", "_id", "campaign_id", "expiration", "display_seconds", "display_session", "version", "phone_location", "phone_size_width", "phone_size_height", "tablet_location", "tablet_size_width", "tablet_size_height", "time_to_display", "internet_required", "ab_test", "rule_name", "location", "devices" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_ruleevent", "_id", "event_name", "rule_id_ref", "amp_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL);", new Object[] { "amp_displayed", "_id", "displayed", "campaign_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_conditions", "_id", "attribute_name", "operator", "rule_id_ref", "amp_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_condition_values", "_id", "value", "condition_id_ref", "amp_conditions", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);", new Object[] { "custom_dimensions", "_id", "custom_dimension_key", "custom_dimension_value" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s TEXT, %s INTEGER)", new Object[] { "profile", "_id", "attribute", "customer_id", "action" }));
    }
    
    public void onOpen(SQLiteDatabase paramSQLiteDatabase)
    {
      super.onOpen(paramSQLiteDatabase);
      if (Constants.IS_LOGGABLE) {
        Log.v("Localytics", String.format("SQLite library version is: %s", new Object[] { DatabaseUtils.stringForQuery(paramSQLiteDatabase, "select sqlite_version()", null) }));
      }
      if (!paramSQLiteDatabase.isReadOnly()) {
        paramSQLiteDatabase.execSQL("PRAGMA foreign_keys = ON;");
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      if (paramInt1 < 3)
      {
        paramSQLiteDatabase.delete("upload_blob_events", null, null);
        paramSQLiteDatabase.delete("event_history", null, null);
        paramSQLiteDatabase.delete("upload_blobs", null, null);
        paramSQLiteDatabase.delete("attributes", null, null);
        paramSQLiteDatabase.delete("events", null, null);
        paramSQLiteDatabase.delete("sessions", null, null);
      }
      if (paramInt1 < 4) {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "iu" }));
      }
      if (paramInt1 < 5) {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "device_wifi_mac_hash" }));
      }
      Object localObject1;
      Cursor localCursor;
      ContentValues localContentValues;
      String str;
      Object localObject3;
      if (paramInt1 < 6)
      {
        localObject1 = null;
        try
        {
          localCursor = paramSQLiteDatabase.query("attributes", new String[] { "_id", "attribute_key" }, null, null, null, null, null);
          localObject1 = localCursor;
          paramInt2 = localCursor.getColumnIndexOrThrow("_id");
          localObject1 = localCursor;
          int i = localCursor.getColumnIndexOrThrow("attribute_key");
          localObject1 = localCursor;
          localContentValues = new ContentValues();
          localObject1 = localCursor;
          str = String.format("%s = ?", new Object[] { "_id" });
          localObject1 = localCursor;
          localObject3 = new String[1];
          localObject1 = localCursor;
          localCursor.moveToPosition(-1);
          for (;;)
          {
            localObject1 = localCursor;
            if (!localCursor.moveToNext()) {
              break;
            }
            localObject1 = localCursor;
            localContentValues.put("attribute_key", String.format("%s:%s", new Object[] { mContext.getPackageName(), localCursor.getString(i) }));
            localObject1 = localCursor;
            localObject3[0] = Long.toString(localCursor.getLong(paramInt2));
            localObject1 = localCursor;
            paramSQLiteDatabase.update("attributes", localContentValues, str, (String[])localObject3);
            localObject1 = localCursor;
            localContentValues.clear();
          }
          if (localCursor == null) {
            break label371;
          }
        }
        finally
        {
          if (localObject1 != null) {
            ((Cursor)localObject1).close();
          }
        }
        localCursor.close();
      }
      label371:
      if (paramInt1 < 7)
      {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s TEXT, %s INTEGER);", new Object[] { "info", "fb_attribution", "first_run" }));
        localObject1 = new ContentValues();
        ((ContentValues)localObject1).putNull("fb_attribution");
        ((ContentValues)localObject1).put("first_run", Boolean.FALSE);
        paramSQLiteDatabase.insertOrThrow("info", null, (ContentValues)localObject1);
      }
      if (paramInt1 < 8) {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);", new Object[] { "identifiers", "_id", "key", "value" }));
      }
      if (paramInt1 < 9) {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER NOT NULL DEFAULT 0;", new Object[] { "events", "clv_increase" }));
      }
      if (paramInt1 < 10) {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "play_attribution" }));
      }
      if (paramInt1 < 11)
      {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "registration_id" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "registration_version" }));
      }
      if (paramInt1 < 12)
      {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_android_id" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_telephony_id" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "package_name" }));
        localObject1 = new ContentValues();
        ((ContentValues)localObject1).put("first_android_id", DatapointHelper.getAndroidIdOrNull(mContext));
        ((ContentValues)localObject1).put("first_telephony_id", DatapointHelper.getTelephonyDeviceIdOrNull(mContext));
        ((ContentValues)localObject1).put("package_name", mContext.getPackageName());
        paramSQLiteDatabase.update("info", (ContentValues)localObject1, null, null);
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "device_android_id" }));
      }
      if (paramInt1 < 13)
      {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s REAL;", new Object[] { "events", "event_lat" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s REAL;", new Object[] { "events", "event_lng" }));
      }
      if (paramInt1 < 14)
      {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER NOT NULL, %s TEXT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)", new Object[] { "amp_rules", "_id", "campaign_id", "expiration", "display_seconds", "display_session", "version", "phone_location", "phone_size_width", "phone_size_height", "tablet_location", "tablet_size_width", "tablet_size_height", "time_to_display", "internet_required", "ab_test", "rule_name", "location", "devices" }));
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_ruleevent", "_id", "event_name", "rule_id_ref", "amp_rules", "_id" }));
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL);", new Object[] { "amp_displayed", "_id", "displayed", "campaign_id" }));
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_conditions", "_id", "attribute_name", "operator", "rule_id_ref", "amp_rules", "_id" }));
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_condition_values", "_id", "value", "condition_id_ref", "amp_conditions", "_id" }));
      }
      if (paramInt1 < 15) {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);", new Object[] { "custom_dimensions", "_id", "custom_dimension_key", "custom_dimension_value" }));
      }
      if (paramInt1 < 16)
      {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_advertising_id" }));
        localObject1 = new ContentValues();
        ((ContentValues)localObject1).put("first_advertising_id", DatapointHelper.getAdvertisingIdOrNull(mContext));
        paramSQLiteDatabase.update("info", (ContentValues)localObject1, null, null);
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "device_advertising_id" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER;", new Object[] { "info", "push_disabled" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "sender_id" }));
      }
      if (paramInt1 < 17)
      {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s INTEGER)", new Object[] { "profile", "_id", "attribute", "action" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "events", "customer_id" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "events", "user_type" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "events", "ids" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER", new Object[] { "info", "last_session_open_time" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER NOT NULL CHECK (%s >= 0) DEFAULT 0", new Object[] { "sessions", "elapsed", "elapsed" }));
      }
      if (paramInt1 < 18)
      {
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT", new Object[] { "profile", "customer_id" }));
        localObject1 = null;
        localContentValues = new ContentValues();
        try
        {
          localCursor = paramSQLiteDatabase.query("profile", null, null, null, null, null, null);
          Object localObject2;
          for (;;)
          {
            localObject1 = localCursor;
            if (!localCursor.moveToNext()) {
              break;
            }
            localObject1 = localCursor;
            str = String.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("_id")));
            localObject1 = localCursor;
            try
            {
              localObject3 = new JSONObject(localCursor.getString(localCursor.getColumnIndexOrThrow("attribute")));
              localObject1 = localCursor;
              localContentValues.put("attribute", ((JSONObject)localObject3).getString("attributes"));
              localObject1 = localCursor;
              localContentValues.put("customer_id", ((JSONObject)localObject3).getString("id"));
              localObject1 = localCursor;
              paramSQLiteDatabase.update("profile", localContentValues, String.format("%s = %s", new Object[] { "_id", str }), null);
              localObject1 = localCursor;
              localContentValues.clear();
            }
            catch (Exception localException)
            {
              localObject2 = localCursor;
              paramSQLiteDatabase.delete("profile", String.format("%s = %s", new Object[] { "_id", str }), null);
            }
          }
          if (localCursor == null) {
            return;
          }
        }
        finally
        {
          if (localObject2 != null) {
            localObject2.close();
          }
        }
        localCursor.close();
      }
    }
  }
}
