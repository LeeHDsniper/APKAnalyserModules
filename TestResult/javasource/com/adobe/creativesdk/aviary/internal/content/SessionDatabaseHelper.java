package com.adobe.creativesdk.aviary.internal.content;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import com.adobe.creativesdk.aviary.internal.headless.moa.JSONWriter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaMetadata;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.nio.charset.Charset;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import org.json.JSONException;

public class SessionDatabaseHelper
  extends SQLiteOpenHelper
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("SessionDatabaseHelper");
  
  public SessionDatabaseHelper(Context paramContext)
  {
    super(paramContext, "aviary.sessions.sqlite", null, 1);
  }
  
  private void printDatabaseStats()
  {
    logger.info("=== DATABASE STATS ===");
    Object localObject1 = getReadableDatabase();
    Object localObject2 = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
    long l1 = ((Calendar)localObject2).getTimeInMillis();
    logger.verbose("current time: %d (%s)", new Object[] { Long.valueOf(l1), ((Calendar)localObject2).getTime().toString() });
    localObject2 = ((SQLiteDatabase)localObject1).query("sessions", null, null, null, null, null, null);
    if (localObject2 != null)
    {
      logger.verbose("total sessions: " + ((Cursor)localObject2).getCount(), new Object[0]);
      if (((Cursor)localObject2).moveToFirst()) {
        do
        {
          int i = ((Cursor)localObject2).getColumnIndex("session_id");
          int j = ((Cursor)localObject2).getColumnIndex("session_data");
          int k = ((Cursor)localObject2).getColumnIndex("session_creation_time");
          long l2 = ((Cursor)localObject2).getLong(i);
          String str = ((Cursor)localObject2).getString(j);
          j = ((Cursor)localObject2).getInt(k);
          Cursor localCursor = ((SQLiteDatabase)localObject1).rawQuery("SELECT COUNT(*) as _count FROM actions WHERE action_session_id=" + l2, null);
          i = 0;
          if (localCursor.moveToFirst()) {
            i = localCursor.getInt(0);
          }
          IOUtils.closeSilently(localCursor);
          logger.verbose("session: %d, uri: %s, created: %d, actions: %d", new Object[] { Long.valueOf(l2), str, Integer.valueOf(j), Integer.valueOf(i) });
        } while (((Cursor)localObject2).moveToNext());
      }
      IOUtils.closeSilently((Cursor)localObject2);
    }
    localObject1 = ((SQLiteDatabase)localObject1).query("sessions", null, "session_creation_time<" + (l1 - 86400000L) / 1000L, null, null, null, null);
    if (localObject1 != null)
    {
      logger.warn("we need to delete: " + ((Cursor)localObject1).getCount() + " loitering sessions");
      ((Cursor)localObject1).close();
    }
  }
  
  private void printSessionStats(long paramLong)
  {
    logger.info("=== SESSION STATS %d ===", new Object[] { Long.valueOf(paramLong) });
    Object localObject1 = getReadableDatabase();
    Object localObject2 = new SQLiteQueryBuilder();
    ((SQLiteQueryBuilder)localObject2).setTables("actions");
    localObject1 = ((SQLiteQueryBuilder)localObject2).query((SQLiteDatabase)localObject1, null, "action_session_id=?", new String[] { String.valueOf(paramLong) }, null, null, "action_id ASC");
    while (((Cursor)localObject1).moveToNext())
    {
      paramLong = ((Cursor)localObject1).getLong(((Cursor)localObject1).getColumnIndex("action_id"));
      long l1 = ((Cursor)localObject1).getLong(((Cursor)localObject1).getColumnIndex("action_session_id"));
      long l2 = ((Cursor)localObject1).getLong(((Cursor)localObject1).getColumnIndex("action_bitmap_ptr"));
      localObject2 = new String(((Cursor)localObject1).getBlob(((Cursor)localObject1).getColumnIndex("action_action")), Charset.forName("UTF-8"));
      logger.verbose("id: %d, session: %d, ptr: %d (0x%x), actions: %s", new Object[] { Long.valueOf(paramLong), Long.valueOf(l1), Long.valueOf(l2), Long.valueOf(l2), localObject2 });
    }
    IOUtils.closeSilently((Cursor)localObject1);
  }
  
  private void purgeDatabase()
  {
    logger.info("purgeDatabase");
    long l = Calendar.getInstance(TimeZone.getTimeZone("UTC")).getTimeInMillis();
    int i = getWritableDatabase().delete("sessions", "session_creation_time<" + (l - 86400000L) / 1000L, null);
    logger.warn("deleted " + i + " loitering sessions");
  }
  
  public int deleteActions(long paramLong)
  {
    logger.info("deleteActions(session: %d)", new Object[] { Long.valueOf(paramLong) });
    int i = getWritableDatabase().delete("actions", "action_session_id=" + paramLong, null);
    logger.verbose("deleted %d actions", new Object[] { Integer.valueOf(i) });
    return i;
  }
  
  public int deleteActionsFrom(long paramLong1, long paramLong2)
  {
    logger.info("deleteActionsFrom(session: %d, action: %d)", new Object[] { Long.valueOf(paramLong1), Long.valueOf(paramLong2) });
    int i = getWritableDatabase().delete("actions", "action_session_id=? AND action_id>?", new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) });
    logger.verbose("deleted %d actions", new Object[] { Integer.valueOf(i) });
    return i;
  }
  
  public int deleteSession(long paramLong)
  {
    logger.info("delete(session: %d)", new Object[] { Long.valueOf(paramLong) });
    int i = getWritableDatabase().delete("sessions", "session_id=" + paramLong, null);
    logger.verbose("deleted %d sessions", new Object[] { Integer.valueOf(i) });
    return i;
  }
  
  public long findActionByBitmap(long paramLong1, long paramLong2)
  {
    Object localObject1 = getReadableDatabase();
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("actions");
    localObject1 = localSQLiteQueryBuilder.query((SQLiteDatabase)localObject1, new String[] { "action_id" }, "action_session_id=? AND action_bitmap_ptr=?", new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) }, null, null, null);
    try
    {
      if (((Cursor)localObject1).moveToFirst())
      {
        paramLong1 = ((Cursor)localObject1).getLong(0);
        return paramLong1;
      }
      return -1L;
    }
    finally
    {
      IOUtils.closeSilently((Cursor)localObject1);
    }
  }
  
  public ActionWrapper findActionGreaterThan(long paramLong1, long paramLong2)
  {
    Object localObject1 = getReadableDatabase();
    Object localObject2 = new SQLiteQueryBuilder();
    ((SQLiteQueryBuilder)localObject2).setTables("actions");
    localObject2 = ((SQLiteQueryBuilder)localObject2).query((SQLiteDatabase)localObject1, new String[] { "action_id", "action_session_id", "action_bitmap_ptr", "action_action" }, "action_session_id=? AND action_id>?", new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) }, null, null, "action_id ASC", "0, 1");
    localObject1 = null;
    if (((Cursor)localObject2).moveToFirst()) {
      localObject1 = new ActionWrapper(((Cursor)localObject2).getLong(0), ((Cursor)localObject2).getLong(1), ((Cursor)localObject2).getLong(2), ((Cursor)localObject2).getBlob(3));
    }
    IOUtils.closeSilently((Cursor)localObject2);
    return localObject1;
  }
  
  public SessionWrapper findSession(long paramLong)
  {
    Object localObject1 = getReadableDatabase();
    Object localObject2 = new SQLiteQueryBuilder();
    ((SQLiteQueryBuilder)localObject2).setTables("sessions");
    localObject2 = ((SQLiteQueryBuilder)localObject2).query((SQLiteDatabase)localObject1, new String[] { "session_id", "session_data", "session_mp", "session_orientation", "session_creation_time" }, "session_id=?", new String[] { String.valueOf(paramLong) }, null, null, null);
    localObject1 = null;
    if (((Cursor)localObject2).moveToFirst()) {
      localObject1 = new SessionWrapper(((Cursor)localObject2).getLong(0), Uri.parse(((Cursor)localObject2).getString(1)), ((Cursor)localObject2).getInt(2), ((Cursor)localObject2).getInt(3), ((Cursor)localObject2).getLong(4));
    }
    IOUtils.closeSilently((Cursor)localObject2);
    return localObject1;
  }
  
  public long load(String paramString, int paramInt1, int paramInt2)
  {
    logger.info("load(uri: %s, megapixels: %d, orientation: %d)", new Object[] { paramString, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("session_data", paramString);
    localContentValues.put("session_mp", Integer.valueOf(paramInt1));
    localContentValues.put("session_orientation", Integer.valueOf(paramInt2));
    try
    {
      localSQLiteDatabase.beginTransaction();
      long l = localSQLiteDatabase.insert("sessions", null, localContentValues);
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      logger.verbose("result: %d", new Object[] { Long.valueOf(l) });
      purgeDatabase();
      printDatabaseStats();
      return l;
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public void onConfigure(SQLiteDatabase paramSQLiteDatabase)
  {
    if (!paramSQLiteDatabase.isReadOnly())
    {
      paramSQLiteDatabase.execSQL("PRAGMA foreign_keys=ON;");
      paramSQLiteDatabase.execSQL("PRAGMA encoding=\"UTF-8\";");
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    logger.info("onCreate");
    String str1 = String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL DEFAULT (strftime('%%s', datetime(current_timestamp))))", new Object[] { "sessions", "session_id", "session_data", "session_mp", "session_orientation", "session_creation_time" });
    String str2 = String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s BLOB, %s BLOB, FOREIGN KEY(%s) REFERENCES %s(%s) ON DELETE CASCADE)", new Object[] { "actions", "action_id", "action_session_id", "action_bitmap_ptr", "action_action", "action_recipe", "action_session_id", "sessions", "session_id" });
    paramSQLiteDatabase.execSQL(str1);
    paramSQLiteDatabase.execSQL(str2);
  }
  
  public void onOpen(SQLiteDatabase paramSQLiteDatabase)
  {
    super.onOpen(paramSQLiteDatabase);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    logger.info("onUpgrade from %d to %d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
  }
  
  public long push(long paramLong1, long paramLong2, MoaActionList paramMoaActionList)
  {
    logger.info("push(session:%d, bitmap: 0x%x)", new Object[] { Long.valueOf(paramLong1), Long.valueOf(paramLong2) });
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    String str = "";
    if (paramMoaActionList != null) {}
    try
    {
      str = JSONWriter.encode(paramMoaActionList, new MoaMetadata());
      paramMoaActionList = new ContentValues();
      paramMoaActionList.put("action_session_id", Long.valueOf(paramLong1));
      paramMoaActionList.put("action_bitmap_ptr", Long.valueOf(paramLong2));
      paramMoaActionList.put("action_action", str);
      paramMoaActionList.putNull("action_recipe");
      paramLong2 = localSQLiteDatabase.insert("actions", null, paramMoaActionList);
      logger.verbose("result: %d", new Object[] { Long.valueOf(paramLong2) });
      printSessionStats(paramLong1);
      return paramLong2;
    }
    catch (JSONException paramMoaActionList)
    {
      for (;;)
      {
        paramMoaActionList.printStackTrace();
        str = "";
      }
    }
  }
  
  public static final class ActionWrapper
  {
    public final String actions;
    public final long bitmapPtr;
    public final long id;
    public final long sessionId;
    
    public ActionWrapper(long paramLong1, long paramLong2, long paramLong3, byte[] paramArrayOfByte)
    {
      id = paramLong1;
      sessionId = paramLong2;
      bitmapPtr = paramLong3;
      actions = new String(paramArrayOfByte);
    }
    
    public String toString()
    {
      return String.format(Locale.US, "ActionWrapper{id: %d, session_id: %d, bitmap_ptr: %d, actions: %s}", new Object[] { Long.valueOf(id), Long.valueOf(sessionId), Long.valueOf(bitmapPtr), actions });
    }
  }
  
  public static final class SessionWrapper
  {
    public final long creationTime;
    public final Uri data;
    public final long id;
    public final int megapixels;
    public final int orientation;
    
    public SessionWrapper(long paramLong1, Uri paramUri, int paramInt1, int paramInt2, long paramLong2)
    {
      id = paramLong1;
      data = paramUri;
      megapixels = paramInt1;
      orientation = paramInt2;
      creationTime = paramLong2;
    }
    
    public String toString()
    {
      return String.format(Locale.US, "SessionWrapper{id: %d, data: %s, mp: %d, orientation: %d, time: %d", new Object[] { Long.valueOf(id), data, Integer.valueOf(megapixels), Integer.valueOf(orientation), Long.valueOf(creationTime) });
    }
  }
}
