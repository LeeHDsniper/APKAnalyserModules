package com.adobe.creativesdk.aviary.internal.receipt;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.nio.charset.Charset;
import org.json.JSONObject;

class ReceiptProvider
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("ReceiptProvider");
  private static ReceiptProvider sInstance;
  private SQLiteDatabase mDb;
  
  public ReceiptProvider(Context paramContext)
  {
    try
    {
      mDb = new DatabaseHelper(paramContext).getWritableDatabase();
      return;
    }
    catch (SQLiteException paramContext)
    {
      paramContext.printStackTrace();
      logger.error("cannot open the database!!!!");
    }
  }
  
  /* Error */
  public static ReceiptProvider getInstance(Context paramContext)
  {
    // Byte code:
    //   0: getstatic 55	com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    //   3: ifnonnull +32 -> 35
    //   6: ldc 2
    //   8: monitorenter
    //   9: getstatic 55	com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    //   12: ifnonnull +20 -> 32
    //   15: ldc 2
    //   17: monitorenter
    //   18: new 2	com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider
    //   21: dup
    //   22: aload_0
    //   23: invokespecial 56	com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider:<init>	(Landroid/content/Context;)V
    //   26: putstatic 55	com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    //   29: ldc 2
    //   31: monitorexit
    //   32: ldc 2
    //   34: monitorexit
    //   35: getstatic 55	com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    //   38: areturn
    //   39: astore_0
    //   40: ldc 2
    //   42: monitorexit
    //   43: aload_0
    //   44: athrow
    //   45: astore_0
    //   46: ldc 2
    //   48: monitorexit
    //   49: aload_0
    //   50: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	51	0	paramContext	Context
    // Exception table:
    //   from	to	target	type
    //   18	32	39	finally
    //   40	43	39	finally
    //   9	18	45	finally
    //   32	35	45	finally
    //   43	45	45	finally
    //   46	49	45	finally
  }
  
  public long addContent(JSONObject paramJSONObject)
  {
    if (mDb == null) {
      return -1L;
    }
    logger.info("addContent: %s", new Object[] { paramJSONObject });
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("r_json", paramJSONObject.toString().getBytes(Charset.forName("UTF-8")));
    localContentValues.put("r_item_type", Integer.valueOf(10));
    localContentValues.put("r_fail_count", Integer.valueOf(0));
    return mDb.insert("receipts_table", null, localContentValues);
  }
  
  public long addTicket(JSONObject paramJSONObject, boolean paramBoolean)
  {
    int i = 1;
    if (mDb == null) {
      return -1L;
    }
    logger.info("addTicket: %s", new Object[] { paramJSONObject });
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("r_json", paramJSONObject.toString().getBytes(Charset.forName("UTF-8")));
    if (paramBoolean) {}
    for (;;)
    {
      localContentValues.put("r_item_type", Integer.valueOf(i));
      localContentValues.put("r_fail_count", Integer.valueOf(0));
      return mDb.insert("receipts_table", null, localContentValues);
      i = 2;
    }
  }
  
  int deleteReceipt(long paramLong)
  {
    if (mDb == null) {
      return 0;
    }
    return mDb.delete("receipts_table", "r_id=?", new String[] { String.valueOf(paramLong) });
  }
  
  Cursor getAccountContent()
  {
    if (mDb == null) {
      return null;
    }
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("receipts_table");
    return localSQLiteQueryBuilder.query(mDb, null, "r_item_type=?", new String[] { String.valueOf(10) }, null, null, "r_id DESC");
  }
  
  public Cursor getReceipts()
  {
    if (mDb == null) {
      return null;
    }
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("receipts_table");
    return localSQLiteQueryBuilder.query(mDb, null, "r_item_type=? OR r_item_type=?", new String[] { String.valueOf(1), String.valueOf(2) }, null, null, "r_id DESC");
  }
  
  long updateReceipt(long paramLong, ContentValues paramContentValues)
  {
    if (mDb == null) {
      return -1L;
    }
    return mDb.update("receipts_table", paramContentValues, "r_id=?", new String[] { String.valueOf(paramLong) });
  }
  
  private static final class DatabaseHelper
    extends SQLiteOpenHelper
  {
    public DatabaseHelper(Context paramContext)
    {
      super("receipts", null, 3);
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      ReceiptProvider.logger.info("onCreate");
      paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS receipts_table( r_id INTEGER PRIMARY KEY AUTOINCREMENT, r_json BLOB NOT NULL, r_item_type INTEGER NOT NULL DEFAULT 0, r_fail_count INTEGER NOT NULL DEFAULT 0 )");
    }
    
    public void onOpen(SQLiteDatabase paramSQLiteDatabase)
    {
      super.onOpen(paramSQLiteDatabase);
      ReceiptProvider.logger.info("onOpen");
      if (!paramSQLiteDatabase.isReadOnly())
      {
        ReceiptProvider.logger.info("onConfigure");
        paramSQLiteDatabase.execSQL("PRAGMA foreign_keys = ON;");
        paramSQLiteDatabase.execSQL("PRAGMA encoding=\"UTF-8\";");
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      ReceiptProvider.logger.info("onUpgrade");
      if (paramInt1 < 3)
      {
        paramSQLiteDatabase.execSQL("DROP TABLE if exists uploads_table");
        paramSQLiteDatabase.execSQL("ALTER TABLE receipts_table ADD COLUMN r_item_type INTEGER NOT NULL DEFAULT 0");
        paramSQLiteDatabase.execSQL("ALTER TABLE receipts_table ADD COLUMN r_fail_count INTEGER NOT NULL DEFAULT 0");
      }
    }
  }
}
