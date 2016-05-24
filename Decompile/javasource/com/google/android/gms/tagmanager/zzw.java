package com.google.android.gms.tagmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlo;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

class zzw
  implements DataLayer.zzc
{
  private static final String zzaPJ = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' STRING NOT NULL, '%s' BLOB NOT NULL, '%s' INTEGER NOT NULL);", new Object[] { "datalayer", "ID", "key", "value", "expires" });
  private final Context mContext;
  private final Executor zzaPK;
  private zza zzaPL;
  private int zzaPM;
  private zzlm zzpO;
  
  public zzw(Context paramContext)
  {
    this(paramContext, zzlo.zzpN(), "google_tagmanager.db", 2000, Executors.newSingleThreadExecutor());
  }
  
  zzw(Context paramContext, zzlm paramZzlm, String paramString, int paramInt, Executor paramExecutor)
  {
    mContext = paramContext;
    zzpO = paramZzlm;
    zzaPM = paramInt;
    zzaPK = paramExecutor;
    zzaPL = new zza(mContext, paramString);
  }
  
  /* Error */
  private byte[] zzC(Object paramObject)
  {
    // Byte code:
    //   0: new 93	java/io/ByteArrayOutputStream
    //   3: dup
    //   4: invokespecial 94	java/io/ByteArrayOutputStream:<init>	()V
    //   7: astore_3
    //   8: new 96	java/io/ObjectOutputStream
    //   11: dup
    //   12: aload_3
    //   13: invokespecial 99	java/io/ObjectOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   16: astore_2
    //   17: aload_2
    //   18: aload_1
    //   19: invokevirtual 103	java/io/ObjectOutputStream:writeObject	(Ljava/lang/Object;)V
    //   22: aload_3
    //   23: invokevirtual 107	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   26: astore_1
    //   27: aload_2
    //   28: ifnull +7 -> 35
    //   31: aload_2
    //   32: invokevirtual 110	java/io/ObjectOutputStream:close	()V
    //   35: aload_3
    //   36: invokevirtual 111	java/io/ByteArrayOutputStream:close	()V
    //   39: aload_1
    //   40: areturn
    //   41: astore_1
    //   42: aconst_null
    //   43: astore_2
    //   44: aload_2
    //   45: ifnull +7 -> 52
    //   48: aload_2
    //   49: invokevirtual 110	java/io/ObjectOutputStream:close	()V
    //   52: aload_3
    //   53: invokevirtual 111	java/io/ByteArrayOutputStream:close	()V
    //   56: aconst_null
    //   57: areturn
    //   58: astore_1
    //   59: aconst_null
    //   60: areturn
    //   61: astore_1
    //   62: aconst_null
    //   63: astore_2
    //   64: aload_2
    //   65: ifnull +7 -> 72
    //   68: aload_2
    //   69: invokevirtual 110	java/io/ObjectOutputStream:close	()V
    //   72: aload_3
    //   73: invokevirtual 111	java/io/ByteArrayOutputStream:close	()V
    //   76: aload_1
    //   77: athrow
    //   78: astore_2
    //   79: goto -3 -> 76
    //   82: astore_1
    //   83: goto -19 -> 64
    //   86: astore_1
    //   87: goto -43 -> 44
    //   90: astore_2
    //   91: aload_1
    //   92: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	93	0	this	zzw
    //   0	93	1	paramObject	Object
    //   16	53	2	localObjectOutputStream	java.io.ObjectOutputStream
    //   78	1	2	localIOException1	java.io.IOException
    //   90	1	2	localIOException2	java.io.IOException
    //   7	66	3	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    // Exception table:
    //   from	to	target	type
    //   8	17	41	java/io/IOException
    //   48	52	58	java/io/IOException
    //   52	56	58	java/io/IOException
    //   8	17	61	finally
    //   68	72	78	java/io/IOException
    //   72	76	78	java/io/IOException
    //   17	27	82	finally
    //   17	27	86	java/io/IOException
    //   31	35	90	java/io/IOException
    //   35	39	90	java/io/IOException
  }
  
  private void zzS(long paramLong)
  {
    SQLiteDatabase localSQLiteDatabase = zzeG("Error opening database for deleteOlderThan.");
    if (localSQLiteDatabase == null) {
      return;
    }
    try
    {
      int i = localSQLiteDatabase.delete("datalayer", "expires <= ?", new String[] { Long.toString(paramLong) });
      zzbg.v("Deleted " + i + " expired items");
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbg.zzaE("Error deleting old entries.");
    }
  }
  
  /* Error */
  private void zzb(List<zzb> paramList, long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 78	com/google/android/gms/tagmanager/zzw:zzpO	Lcom/google/android/gms/internal/zzlm;
    //   6: invokeinterface 183 1 0
    //   11: lstore 4
    //   13: aload_0
    //   14: lload 4
    //   16: invokespecial 185	com/google/android/gms/tagmanager/zzw:zzS	(J)V
    //   19: aload_0
    //   20: aload_1
    //   21: invokeinterface 191 1 0
    //   26: invokespecial 195	com/google/android/gms/tagmanager/zzw:zzjd	(I)V
    //   29: aload_0
    //   30: aload_1
    //   31: lload 4
    //   33: lload_2
    //   34: ladd
    //   35: invokespecial 198	com/google/android/gms/tagmanager/zzw:zzc	(Ljava/util/List;J)V
    //   38: aload_0
    //   39: invokespecial 201	com/google/android/gms/tagmanager/zzw:zzzV	()V
    //   42: aload_0
    //   43: monitorexit
    //   44: return
    //   45: astore_1
    //   46: aload_0
    //   47: invokespecial 201	com/google/android/gms/tagmanager/zzw:zzzV	()V
    //   50: aload_1
    //   51: athrow
    //   52: astore_1
    //   53: aload_0
    //   54: monitorexit
    //   55: aload_1
    //   56: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	57	0	this	zzw
    //   0	57	1	paramList	List<zzb>
    //   0	57	2	paramLong	long
    //   11	21	4	l	long
    // Exception table:
    //   from	to	target	type
    //   2	38	45	finally
    //   38	42	52	finally
    //   46	52	52	finally
  }
  
  private void zzc(List<zzb> paramList, long paramLong)
  {
    SQLiteDatabase localSQLiteDatabase = zzeG("Error opening database for writeEntryToDatabase.");
    if (localSQLiteDatabase == null) {}
    for (;;)
    {
      return;
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        zzb localZzb = (zzb)paramList.next();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("expires", Long.valueOf(paramLong));
        localContentValues.put("key", zztP);
        localContentValues.put("value", zzaPS);
        localSQLiteDatabase.insert("datalayer", null, localContentValues);
      }
    }
  }
  
  private void zze(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0)) {}
    SQLiteDatabase localSQLiteDatabase;
    do
    {
      return;
      localSQLiteDatabase = zzeG("Error opening database for deleteEntries.");
    } while (localSQLiteDatabase == null);
    String str = String.format("%s in (%s)", new Object[] { "ID", TextUtils.join(",", Collections.nCopies(paramArrayOfString.length, "?")) });
    try
    {
      localSQLiteDatabase.delete("datalayer", str, paramArrayOfString);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbg.zzaE("Error deleting entries " + Arrays.toString(paramArrayOfString));
    }
  }
  
  private void zzeF(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = zzeG("Error opening database for clearKeysWithPrefix.");
    if (localSQLiteDatabase == null) {
      return;
    }
    try
    {
      int i = localSQLiteDatabase.delete("datalayer", "key = ? OR key LIKE ?", new String[] { paramString, paramString + ".%" });
      zzbg.v("Cleared " + i + " items");
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbg.zzaE("Error deleting entries with key prefix: " + paramString + " (" + localSQLiteException + ").");
      return;
    }
    finally
    {
      zzzV();
    }
  }
  
  private SQLiteDatabase zzeG(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = zzaPL.getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbg.zzaE(paramString);
    }
    return null;
  }
  
  private void zzjd(int paramInt)
  {
    paramInt = zzzU() - zzaPM + paramInt;
    if (paramInt > 0)
    {
      List localList = zzje(paramInt);
      zzbg.zzaD("DataLayer store full, deleting " + localList.size() + " entries to make room.");
      zze((String[])localList.toArray(new String[0]));
    }
  }
  
  /* Error */
  private List<String> zzje(int paramInt)
  {
    // Byte code:
    //   0: new 323	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 324	java/util/ArrayList:<init>	()V
    //   7: astore 6
    //   9: iload_1
    //   10: ifgt +12 -> 22
    //   13: ldc_w 326
    //   16: invokestatic 163	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   19: aload 6
    //   21: areturn
    //   22: aload_0
    //   23: ldc_w 328
    //   26: invokespecial 121	com/google/android/gms/tagmanager/zzw:zzeG	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   29: astore_3
    //   30: aload_3
    //   31: ifnonnull +6 -> 37
    //   34: aload 6
    //   36: areturn
    //   37: ldc_w 330
    //   40: iconst_1
    //   41: anewarray 4	java/lang/Object
    //   44: dup
    //   45: iconst_0
    //   46: ldc 38
    //   48: aastore
    //   49: invokestatic 50	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   52: astore 4
    //   54: iload_1
    //   55: invokestatic 335	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   58: astore 5
    //   60: aload_3
    //   61: ldc 36
    //   63: iconst_1
    //   64: anewarray 46	java/lang/String
    //   67: dup
    //   68: iconst_0
    //   69: ldc 38
    //   71: aastore
    //   72: aconst_null
    //   73: aconst_null
    //   74: aconst_null
    //   75: aconst_null
    //   76: aload 4
    //   78: aload 5
    //   80: invokevirtual 339	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   83: astore 4
    //   85: aload 4
    //   87: astore_3
    //   88: aload 4
    //   90: invokeinterface 344 1 0
    //   95: ifeq +40 -> 135
    //   98: aload 4
    //   100: astore_3
    //   101: aload 6
    //   103: aload 4
    //   105: iconst_0
    //   106: invokeinterface 348 2 0
    //   111: invokestatic 350	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   114: invokeinterface 354 2 0
    //   119: pop
    //   120: aload 4
    //   122: astore_3
    //   123: aload 4
    //   125: invokeinterface 357 1 0
    //   130: istore_2
    //   131: iload_2
    //   132: ifne -34 -> 98
    //   135: aload 4
    //   137: ifnull +10 -> 147
    //   140: aload 4
    //   142: invokeinterface 358 1 0
    //   147: aload 6
    //   149: areturn
    //   150: astore 5
    //   152: aconst_null
    //   153: astore 4
    //   155: aload 4
    //   157: astore_3
    //   158: new 137	java/lang/StringBuilder
    //   161: dup
    //   162: invokespecial 138	java/lang/StringBuilder:<init>	()V
    //   165: ldc_w 360
    //   168: invokevirtual 144	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   171: aload 5
    //   173: invokevirtual 363	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   176: invokevirtual 144	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: invokevirtual 152	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   182: invokestatic 163	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   185: aload 4
    //   187: ifnull -40 -> 147
    //   190: aload 4
    //   192: invokeinterface 358 1 0
    //   197: goto -50 -> 147
    //   200: astore 4
    //   202: aconst_null
    //   203: astore_3
    //   204: aload_3
    //   205: ifnull +9 -> 214
    //   208: aload_3
    //   209: invokeinterface 358 1 0
    //   214: aload 4
    //   216: athrow
    //   217: astore 4
    //   219: goto -15 -> 204
    //   222: astore 5
    //   224: goto -69 -> 155
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	227	0	this	zzw
    //   0	227	1	paramInt	int
    //   130	2	2	bool	boolean
    //   29	180	3	localObject1	Object
    //   52	139	4	localObject2	Object
    //   200	15	4	localObject3	Object
    //   217	1	4	localObject4	Object
    //   58	21	5	str	String
    //   150	22	5	localSQLiteException1	SQLiteException
    //   222	1	5	localSQLiteException2	SQLiteException
    //   7	141	6	localArrayList	ArrayList
    // Exception table:
    //   from	to	target	type
    //   37	85	150	android/database/sqlite/SQLiteException
    //   37	85	200	finally
    //   88	98	217	finally
    //   101	120	217	finally
    //   123	131	217	finally
    //   158	185	217	finally
    //   88	98	222	android/database/sqlite/SQLiteException
    //   101	120	222	android/database/sqlite/SQLiteException
    //   123	131	222	android/database/sqlite/SQLiteException
  }
  
  private List<DataLayer.zza> zzp(List<zzb> paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      zzb localZzb = (zzb)paramList.next();
      localArrayList.add(new DataLayer.zza(zztP, zzq(zzaPS)));
    }
    return localArrayList;
  }
  
  /* Error */
  private Object zzq(byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: new 380	java/io/ByteArrayInputStream
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 383	java/io/ByteArrayInputStream:<init>	([B)V
    //   8: astore_3
    //   9: new 385	java/io/ObjectInputStream
    //   12: dup
    //   13: aload_3
    //   14: invokespecial 388	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   17: astore_1
    //   18: aload_1
    //   19: invokevirtual 391	java/io/ObjectInputStream:readObject	()Ljava/lang/Object;
    //   22: astore_2
    //   23: aload_1
    //   24: ifnull +7 -> 31
    //   27: aload_1
    //   28: invokevirtual 392	java/io/ObjectInputStream:close	()V
    //   31: aload_3
    //   32: invokevirtual 393	java/io/ByteArrayInputStream:close	()V
    //   35: aload_2
    //   36: areturn
    //   37: astore_1
    //   38: aconst_null
    //   39: astore_1
    //   40: aload_1
    //   41: ifnull +7 -> 48
    //   44: aload_1
    //   45: invokevirtual 392	java/io/ObjectInputStream:close	()V
    //   48: aload_3
    //   49: invokevirtual 393	java/io/ByteArrayInputStream:close	()V
    //   52: aconst_null
    //   53: areturn
    //   54: astore_1
    //   55: aconst_null
    //   56: areturn
    //   57: astore_1
    //   58: aconst_null
    //   59: astore_1
    //   60: aload_1
    //   61: ifnull +7 -> 68
    //   64: aload_1
    //   65: invokevirtual 392	java/io/ObjectInputStream:close	()V
    //   68: aload_3
    //   69: invokevirtual 393	java/io/ByteArrayInputStream:close	()V
    //   72: aconst_null
    //   73: areturn
    //   74: astore_1
    //   75: aconst_null
    //   76: areturn
    //   77: astore_2
    //   78: aconst_null
    //   79: astore_1
    //   80: aload_1
    //   81: ifnull +7 -> 88
    //   84: aload_1
    //   85: invokevirtual 392	java/io/ObjectInputStream:close	()V
    //   88: aload_3
    //   89: invokevirtual 393	java/io/ByteArrayInputStream:close	()V
    //   92: aload_2
    //   93: athrow
    //   94: astore_1
    //   95: goto -3 -> 92
    //   98: astore_2
    //   99: goto -19 -> 80
    //   102: astore_2
    //   103: goto -43 -> 60
    //   106: astore_2
    //   107: goto -67 -> 40
    //   110: astore_1
    //   111: aload_2
    //   112: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	113	0	this	zzw
    //   0	113	1	paramArrayOfByte	byte[]
    //   22	14	2	localObject1	Object
    //   77	16	2	localObject2	Object
    //   98	1	2	localObject3	Object
    //   102	1	2	localClassNotFoundException	ClassNotFoundException
    //   106	6	2	localIOException	java.io.IOException
    //   8	81	3	localByteArrayInputStream	java.io.ByteArrayInputStream
    // Exception table:
    //   from	to	target	type
    //   9	18	37	java/io/IOException
    //   44	48	54	java/io/IOException
    //   48	52	54	java/io/IOException
    //   9	18	57	java/lang/ClassNotFoundException
    //   64	68	74	java/io/IOException
    //   68	72	74	java/io/IOException
    //   9	18	77	finally
    //   84	88	94	java/io/IOException
    //   88	92	94	java/io/IOException
    //   18	23	98	finally
    //   18	23	102	java/lang/ClassNotFoundException
    //   18	23	106	java/io/IOException
    //   27	31	110	java/io/IOException
    //   31	35	110	java/io/IOException
  }
  
  private List<zzb> zzq(List<DataLayer.zza> paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      DataLayer.zza localZza = (DataLayer.zza)paramList.next();
      localArrayList.add(new zzb(zztP, zzC(zzID)));
    }
    return localArrayList;
  }
  
  private List<DataLayer.zza> zzzS()
  {
    try
    {
      zzS(zzpO.currentTimeMillis());
      List localList = zzp(zzzT());
      return localList;
    }
    finally
    {
      zzzV();
    }
  }
  
  private List<zzb> zzzT()
  {
    Object localObject = zzeG("Error opening database for loadSerialized.");
    ArrayList localArrayList = new ArrayList();
    if (localObject == null) {
      return localArrayList;
    }
    localObject = ((SQLiteDatabase)localObject).query("datalayer", new String[] { "key", "value" }, null, null, null, null, "ID", null);
    try
    {
      if (((Cursor)localObject).moveToNext()) {
        localArrayList.add(new zzb(((Cursor)localObject).getString(0), ((Cursor)localObject).getBlob(1)));
      }
      return localList;
    }
    finally
    {
      ((Cursor)localObject).close();
    }
  }
  
  private int zzzU()
  {
    Object localObject3 = null;
    Object localObject1 = null;
    int i = 0;
    int j = 0;
    Object localObject5 = zzeG("Error opening database for getNumStoredEntries.");
    if (localObject5 == null) {}
    for (;;)
    {
      return j;
      try
      {
        localObject5 = ((SQLiteDatabase)localObject5).rawQuery("SELECT COUNT(*) from datalayer", null);
        localObject1 = localObject5;
        localObject3 = localObject5;
        if (((Cursor)localObject5).moveToFirst())
        {
          localObject1 = localObject5;
          localObject3 = localObject5;
          long l = ((Cursor)localObject5).getLong(0);
          i = (int)l;
        }
        j = i;
        if (localObject5 == null) {
          continue;
        }
        ((Cursor)localObject5).close();
        return i;
      }
      catch (SQLiteException localSQLiteException)
      {
        localObject4 = localObject1;
        zzbg.zzaE("Error getting numStoredEntries");
        return 0;
      }
      finally
      {
        Object localObject4;
        if (localObject4 != null) {
          localObject4.close();
        }
      }
    }
  }
  
  private void zzzV()
  {
    try
    {
      zzaPL.close();
      return;
    }
    catch (SQLiteException localSQLiteException) {}
  }
  
  public void zza(final DataLayer.zzc.zza paramZza)
  {
    zzaPK.execute(new Runnable()
    {
      public void run()
      {
        paramZza.zzo(zzw.zza(zzw.this));
      }
    });
  }
  
  public void zza(final List<DataLayer.zza> paramList, final long paramLong)
  {
    paramList = zzq(paramList);
    zzaPK.execute(new Runnable()
    {
      public void run()
      {
        zzw.zza(zzw.this, paramList, paramLong);
      }
    });
  }
  
  public void zzeE(final String paramString)
  {
    zzaPK.execute(new Runnable()
    {
      public void run()
      {
        zzw.zza(zzw.this, paramString);
      }
    });
  }
  
  class zza
    extends SQLiteOpenHelper
  {
    zza(Context paramContext, String paramString)
    {
      super(paramString, null, 1);
    }
    
    /* Error */
    private boolean zza(String paramString, SQLiteDatabase paramSQLiteDatabase)
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore 4
      //   3: aload_2
      //   4: ldc 22
      //   6: iconst_1
      //   7: anewarray 24	java/lang/String
      //   10: dup
      //   11: iconst_0
      //   12: ldc 26
      //   14: aastore
      //   15: ldc 28
      //   17: iconst_1
      //   18: anewarray 24	java/lang/String
      //   21: dup
      //   22: iconst_0
      //   23: aload_1
      //   24: aastore
      //   25: aconst_null
      //   26: aconst_null
      //   27: aconst_null
      //   28: invokevirtual 34	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   31: astore_2
      //   32: aload_2
      //   33: invokeinterface 40 1 0
      //   38: istore_3
      //   39: aload_2
      //   40: ifnull +9 -> 49
      //   43: aload_2
      //   44: invokeinterface 44 1 0
      //   49: iload_3
      //   50: ireturn
      //   51: astore_2
      //   52: aconst_null
      //   53: astore_2
      //   54: new 46	java/lang/StringBuilder
      //   57: dup
      //   58: invokespecial 48	java/lang/StringBuilder:<init>	()V
      //   61: ldc 50
      //   63: invokevirtual 54	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   66: aload_1
      //   67: invokevirtual 54	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   70: invokevirtual 58	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   73: invokestatic 64	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
      //   76: aload_2
      //   77: ifnull +9 -> 86
      //   80: aload_2
      //   81: invokeinterface 44 1 0
      //   86: iconst_0
      //   87: ireturn
      //   88: astore_1
      //   89: aload 4
      //   91: astore_2
      //   92: aload_2
      //   93: ifnull +9 -> 102
      //   96: aload_2
      //   97: invokeinterface 44 1 0
      //   102: aload_1
      //   103: athrow
      //   104: astore_1
      //   105: goto -13 -> 92
      //   108: astore_1
      //   109: goto -17 -> 92
      //   112: astore 4
      //   114: goto -60 -> 54
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	117	0	this	zza
      //   0	117	1	paramString	String
      //   0	117	2	paramSQLiteDatabase	SQLiteDatabase
      //   38	12	3	bool	boolean
      //   1	89	4	localObject	Object
      //   112	1	4	localSQLiteException	SQLiteException
      // Exception table:
      //   from	to	target	type
      //   3	32	51	android/database/sqlite/SQLiteException
      //   3	32	88	finally
      //   32	39	104	finally
      //   54	76	108	finally
      //   32	39	112	android/database/sqlite/SQLiteException
    }
    
    private void zzc(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase = paramSQLiteDatabase.rawQuery("SELECT * FROM datalayer WHERE 0", null);
      HashSet localHashSet = new HashSet();
      try
      {
        String[] arrayOfString = paramSQLiteDatabase.getColumnNames();
        int i = 0;
        while (i < arrayOfString.length)
        {
          localHashSet.add(arrayOfString[i]);
          i += 1;
        }
        paramSQLiteDatabase.close();
        if ((!localHashSet.remove("key")) || (!localHashSet.remove("value")) || (!localHashSet.remove("ID")) || (!localHashSet.remove("expires"))) {
          throw new SQLiteException("Database column missing");
        }
      }
      finally
      {
        paramSQLiteDatabase.close();
      }
      if (!localObject.isEmpty()) {
        throw new SQLiteException("Database has extra columns");
      }
    }
    
    public SQLiteDatabase getWritableDatabase()
    {
      Object localObject1 = null;
      try
      {
        localObject2 = super.getWritableDatabase();
        localObject1 = localObject2;
      }
      catch (SQLiteException localSQLiteException)
      {
        for (;;)
        {
          Object localObject2;
          zzw.zzb(zzw.this).getDatabasePath("google_tagmanager.db").delete();
        }
      }
      localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = super.getWritableDatabase();
      }
      return localObject2;
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      zzal.zzbj(paramSQLiteDatabase.getPath());
    }
    
    public void onOpen(SQLiteDatabase paramSQLiteDatabase)
    {
      Cursor localCursor;
      if (Build.VERSION.SDK_INT < 15) {
        localCursor = paramSQLiteDatabase.rawQuery("PRAGMA journal_mode=memory", null);
      }
      try
      {
        localCursor.moveToFirst();
        localCursor.close();
        if (!zza("datalayer", paramSQLiteDatabase))
        {
          paramSQLiteDatabase.execSQL(zzw.zzzW());
          return;
        }
      }
      finally
      {
        localCursor.close();
      }
      zzc(paramSQLiteDatabase);
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2) {}
  }
  
  private static class zzb
  {
    final byte[] zzaPS;
    final String zztP;
    
    zzb(String paramString, byte[] paramArrayOfByte)
    {
      zztP = paramString;
      zzaPS = paramArrayOfByte;
    }
    
    public String toString()
    {
      return "KeyAndSerialized: key = " + zztP + " serialized hash = " + Arrays.hashCode(zzaPS);
    }
  }
}
