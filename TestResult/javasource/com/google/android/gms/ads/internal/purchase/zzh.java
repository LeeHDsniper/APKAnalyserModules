package com.google.android.gms.ads.internal.purchase;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzgk;
import java.util.Locale;

@zzgk
public class zzh
{
  private static final String zzCj = String.format(Locale.US, "CREATE TABLE IF NOT EXISTS %s ( %s INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER)", new Object[] { "InAppPurchase", "purchase_id", "product_id", "developer_payload", "record_time" });
  private static zzh zzCl;
  private static final Object zzpc = new Object();
  private final zza zzCk;
  
  zzh(Context paramContext)
  {
    zzCk = new zza(paramContext, "google_inapp_purchase.db");
  }
  
  public static zzh zzx(Context paramContext)
  {
    synchronized (zzpc)
    {
      if (zzCl == null) {
        zzCl = new zzh(paramContext);
      }
      paramContext = zzCl;
      return paramContext;
    }
  }
  
  public int getRecordCount()
  {
    localObject4 = null;
    Object localObject1 = null;
    Object localObject5;
    synchronized (zzpc)
    {
      localObject5 = getWritableDatabase();
      if (localObject5 == null) {
        return 0;
      }
    }
    try
    {
      localObject5 = ((SQLiteDatabase)localObject5).rawQuery("select count(*) from InAppPurchase", null);
      localObject1 = localObject5;
      localObject4 = localObject5;
      if (((Cursor)localObject5).moveToFirst())
      {
        localObject1 = localObject5;
        localObject4 = localObject5;
        int i = ((Cursor)localObject5).getInt(0);
        if (localObject5 != null) {
          ((Cursor)localObject5).close();
        }
        return i;
        localObject2 = finally;
        throw localObject2;
      }
      if (localObject5 != null) {
        ((Cursor)localObject5).close();
      }
    }
    catch (SQLiteException localSQLiteException)
    {
      for (;;)
      {
        localObject4 = localObject2;
        zzb.zzaE("Error getting record count" + localSQLiteException.getMessage());
        if (localObject2 != null) {
          localObject2.close();
        }
      }
    }
    finally
    {
      if (localObject4 == null) {
        break label163;
      }
      localObject4.close();
    }
    return 0;
  }
  
  public SQLiteDatabase getWritableDatabase()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = zzCk.getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzb.zzaE("Error opening writable conversion tracking database");
    }
    return null;
  }
  
  public zzf zza(Cursor paramCursor)
  {
    if (paramCursor == null) {
      return null;
    }
    return new zzf(paramCursor.getLong(0), paramCursor.getString(1), paramCursor.getString(2));
  }
  
  public void zza(zzf paramZzf)
  {
    if (paramZzf == null) {
      return;
    }
    SQLiteDatabase localSQLiteDatabase;
    synchronized (zzpc)
    {
      localSQLiteDatabase = getWritableDatabase();
      if (localSQLiteDatabase == null) {
        return;
      }
    }
    localSQLiteDatabase.delete("InAppPurchase", String.format(Locale.US, "%s = %d", new Object[] { "purchase_id", Long.valueOf(zzCd) }), null);
  }
  
  public void zzb(zzf paramZzf)
  {
    if (paramZzf == null) {
      return;
    }
    SQLiteDatabase localSQLiteDatabase;
    synchronized (zzpc)
    {
      localSQLiteDatabase = getWritableDatabase();
      if (localSQLiteDatabase == null) {
        return;
      }
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("product_id", zzCf);
    localContentValues.put("developer_payload", zzCe);
    localContentValues.put("record_time", Long.valueOf(SystemClock.elapsedRealtime()));
    zzCd = localSQLiteDatabase.insert("InAppPurchase", null, localContentValues);
    if (getRecordCount() > 20000L) {
      zzfi();
    }
  }
  
  /* Error */
  public java.util.List<zzf> zzf(long paramLong)
  {
    // Byte code:
    //   0: getstatic 49	com/google/android/gms/ads/internal/purchase/zzh:zzpc	Ljava/lang/Object;
    //   3: astore 7
    //   5: aload 7
    //   7: monitorenter
    //   8: new 188	java/util/LinkedList
    //   11: dup
    //   12: invokespecial 189	java/util/LinkedList:<init>	()V
    //   15: astore 8
    //   17: lload_1
    //   18: lconst_0
    //   19: lcmp
    //   20: ifgt +9 -> 29
    //   23: aload 7
    //   25: monitorexit
    //   26: aload 8
    //   28: areturn
    //   29: aload_0
    //   30: invokevirtual 74	com/google/android/gms/ads/internal/purchase/zzh:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   33: astore 4
    //   35: aload 4
    //   37: ifnonnull +9 -> 46
    //   40: aload 7
    //   42: monitorexit
    //   43: aload 8
    //   45: areturn
    //   46: aload 4
    //   48: ldc 28
    //   50: aconst_null
    //   51: aconst_null
    //   52: aconst_null
    //   53: aconst_null
    //   54: aconst_null
    //   55: ldc -65
    //   57: lload_1
    //   58: invokestatic 194	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   61: invokevirtual 198	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   64: astore 5
    //   66: aload 5
    //   68: astore 4
    //   70: aload 5
    //   72: invokeinterface 88 1 0
    //   77: ifeq +37 -> 114
    //   80: aload 5
    //   82: astore 4
    //   84: aload 8
    //   86: aload_0
    //   87: aload 5
    //   89: invokevirtual 200	com/google/android/gms/ads/internal/purchase/zzh:zza	(Landroid/database/Cursor;)Lcom/google/android/gms/ads/internal/purchase/zzf;
    //   92: invokeinterface 206 2 0
    //   97: pop
    //   98: aload 5
    //   100: astore 4
    //   102: aload 5
    //   104: invokeinterface 209 1 0
    //   109: istore_3
    //   110: iload_3
    //   111: ifne -31 -> 80
    //   114: aload 5
    //   116: ifnull +10 -> 126
    //   119: aload 5
    //   121: invokeinterface 95 1 0
    //   126: aload 7
    //   128: monitorexit
    //   129: aload 8
    //   131: areturn
    //   132: astore 6
    //   134: aconst_null
    //   135: astore 5
    //   137: aload 5
    //   139: astore 4
    //   141: new 97	java/lang/StringBuilder
    //   144: dup
    //   145: invokespecial 98	java/lang/StringBuilder:<init>	()V
    //   148: ldc -45
    //   150: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   153: aload 6
    //   155: invokevirtual 107	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   158: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   161: invokevirtual 110	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   164: invokestatic 116	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   167: aload 5
    //   169: ifnull -43 -> 126
    //   172: aload 5
    //   174: invokeinterface 95 1 0
    //   179: goto -53 -> 126
    //   182: astore 4
    //   184: aload 7
    //   186: monitorexit
    //   187: aload 4
    //   189: athrow
    //   190: astore 5
    //   192: aconst_null
    //   193: astore 4
    //   195: aload 4
    //   197: ifnull +10 -> 207
    //   200: aload 4
    //   202: invokeinterface 95 1 0
    //   207: aload 5
    //   209: athrow
    //   210: astore 5
    //   212: goto -17 -> 195
    //   215: astore 6
    //   217: goto -80 -> 137
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	220	0	this	zzh
    //   0	220	1	paramLong	long
    //   109	2	3	bool	boolean
    //   33	107	4	localObject1	Object
    //   182	6	4	localObject2	Object
    //   193	8	4	localObject3	Object
    //   64	109	5	localCursor	Cursor
    //   190	18	5	localObject4	Object
    //   210	1	5	localObject5	Object
    //   132	22	6	localSQLiteException1	SQLiteException
    //   215	1	6	localSQLiteException2	SQLiteException
    //   3	182	7	localObject6	Object
    //   15	115	8	localLinkedList	java.util.LinkedList
    // Exception table:
    //   from	to	target	type
    //   46	66	132	android/database/sqlite/SQLiteException
    //   8	17	182	finally
    //   23	26	182	finally
    //   29	35	182	finally
    //   40	43	182	finally
    //   119	126	182	finally
    //   126	129	182	finally
    //   172	179	182	finally
    //   184	187	182	finally
    //   200	207	182	finally
    //   207	210	182	finally
    //   46	66	190	finally
    //   70	80	210	finally
    //   84	98	210	finally
    //   102	110	210	finally
    //   141	167	210	finally
    //   70	80	215	android/database/sqlite/SQLiteException
    //   84	98	215	android/database/sqlite/SQLiteException
    //   102	110	215	android/database/sqlite/SQLiteException
  }
  
  /* Error */
  public void zzfi()
  {
    // Byte code:
    //   0: getstatic 49	com/google/android/gms/ads/internal/purchase/zzh:zzpc	Ljava/lang/Object;
    //   3: astore 4
    //   5: aload 4
    //   7: monitorenter
    //   8: aload_0
    //   9: invokevirtual 74	com/google/android/gms/ads/internal/purchase/zzh:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   12: astore_1
    //   13: aload_1
    //   14: ifnonnull +7 -> 21
    //   17: aload 4
    //   19: monitorexit
    //   20: return
    //   21: aload_1
    //   22: ldc 28
    //   24: aconst_null
    //   25: aconst_null
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: ldc -65
    //   31: ldc -41
    //   33: invokevirtual 198	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   36: astore_2
    //   37: aload_2
    //   38: ifnull +25 -> 63
    //   41: aload_2
    //   42: astore_1
    //   43: aload_2
    //   44: invokeinterface 88 1 0
    //   49: ifeq +14 -> 63
    //   52: aload_2
    //   53: astore_1
    //   54: aload_0
    //   55: aload_0
    //   56: aload_2
    //   57: invokevirtual 200	com/google/android/gms/ads/internal/purchase/zzh:zza	(Landroid/database/Cursor;)Lcom/google/android/gms/ads/internal/purchase/zzf;
    //   60: invokevirtual 217	com/google/android/gms/ads/internal/purchase/zzh:zza	(Lcom/google/android/gms/ads/internal/purchase/zzf;)V
    //   63: aload_2
    //   64: ifnull +9 -> 73
    //   67: aload_2
    //   68: invokeinterface 95 1 0
    //   73: aload 4
    //   75: monitorexit
    //   76: return
    //   77: astore_1
    //   78: aload 4
    //   80: monitorexit
    //   81: aload_1
    //   82: athrow
    //   83: astore_3
    //   84: aconst_null
    //   85: astore_2
    //   86: aload_2
    //   87: astore_1
    //   88: new 97	java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial 98	java/lang/StringBuilder:<init>	()V
    //   95: ldc -37
    //   97: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: aload_3
    //   101: invokevirtual 107	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   104: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: invokevirtual 110	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   110: invokestatic 116	com/google/android/gms/ads/internal/util/client/zzb:zzaE	(Ljava/lang/String;)V
    //   113: aload_2
    //   114: ifnull -41 -> 73
    //   117: aload_2
    //   118: invokeinterface 95 1 0
    //   123: goto -50 -> 73
    //   126: aload_1
    //   127: ifnull +9 -> 136
    //   130: aload_1
    //   131: invokeinterface 95 1 0
    //   136: aload_2
    //   137: athrow
    //   138: astore_2
    //   139: goto -13 -> 126
    //   142: astore_3
    //   143: goto -57 -> 86
    //   146: astore_2
    //   147: aconst_null
    //   148: astore_1
    //   149: goto -23 -> 126
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	152	0	this	zzh
    //   12	42	1	localObject1	Object
    //   77	5	1	localObject2	Object
    //   87	62	1	localObject3	Object
    //   36	101	2	localCursor	Cursor
    //   138	1	2	localObject4	Object
    //   146	1	2	localObject5	Object
    //   83	18	3	localSQLiteException1	SQLiteException
    //   142	1	3	localSQLiteException2	SQLiteException
    //   3	76	4	localObject6	Object
    // Exception table:
    //   from	to	target	type
    //   8	13	77	finally
    //   17	20	77	finally
    //   67	73	77	finally
    //   73	76	77	finally
    //   78	81	77	finally
    //   117	123	77	finally
    //   130	136	77	finally
    //   136	138	77	finally
    //   21	37	83	android/database/sqlite/SQLiteException
    //   43	52	138	finally
    //   54	63	138	finally
    //   88	113	138	finally
    //   43	52	142	android/database/sqlite/SQLiteException
    //   54	63	142	android/database/sqlite/SQLiteException
    //   21	37	146	finally
  }
  
  public class zza
    extends SQLiteOpenHelper
  {
    public zza(Context paramContext, String paramString)
    {
      super(paramString, null, 4);
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(zzh.zzfj());
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      zzb.zzaD("Database updated from version " + paramInt1 + " to version " + paramInt2);
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS InAppPurchase");
      onCreate(paramSQLiteDatabase);
    }
  }
}
