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
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.http.impl.client.DefaultHttpClient;

class zzby
  implements zzau
{
  private static final String zzMg = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL,'%s' INTEGER NOT NULL);", new Object[] { "gtm_hits", "hit_id", "hit_time", "hit_url", "hit_first_send_time" });
  private final Context mContext;
  private final zzb zzaQM;
  private volatile zzac zzaQN;
  private final zzav zzaQO;
  private final String zzaQP;
  private long zzaQQ;
  private final int zzaQR;
  private zzlm zzpO;
  
  zzby(zzav paramZzav, Context paramContext)
  {
    this(paramZzav, paramContext, "gtm_urls.db", 2000);
  }
  
  zzby(zzav paramZzav, Context paramContext, String paramString, int paramInt)
  {
    mContext = paramContext.getApplicationContext();
    zzaQP = paramString;
    zzaQO = paramZzav;
    zzpO = zzlo.zzpN();
    zzaQM = new zzb(mContext, zzaQP);
    zzaQN = new zzcx(new DefaultHttpClient(), mContext, new zza());
    zzaQQ = 0L;
    zzaQR = paramInt;
  }
  
  private void zzAr()
  {
    int i = zzAs() - zzaQR + 1;
    if (i > 0)
    {
      List localList = zzjj(i);
      zzbg.v("Store full, deleting " + localList.size() + " hits to make room.");
      zzf((String[])localList.toArray(new String[0]));
    }
  }
  
  private void zzc(long paramLong1, long paramLong2)
  {
    SQLiteDatabase localSQLiteDatabase = zzeG("Error opening database for getNumStoredHits.");
    if (localSQLiteDatabase == null) {
      return;
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("hit_first_send_time", Long.valueOf(paramLong2));
    try
    {
      localSQLiteDatabase.update("gtm_hits", localContentValues, "hit_id=?", new String[] { String.valueOf(paramLong1) });
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbg.zzaE("Error setting HIT_FIRST_DISPATCH_TIME for hitId: " + paramLong1);
      zzq(paramLong1);
    }
  }
  
  private SQLiteDatabase zzeG(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = zzaQM.getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbg.zzaE(paramString);
    }
    return null;
  }
  
  private void zzh(long paramLong, String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = zzeG("Error opening database for putHit");
    if (localSQLiteDatabase == null) {
      return;
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("hit_time", Long.valueOf(paramLong));
    localContentValues.put("hit_url", paramString);
    localContentValues.put("hit_first_send_time", Integer.valueOf(0));
    try
    {
      localSQLiteDatabase.insert("gtm_hits", null, localContentValues);
      zzaQO.zzas(false);
      return;
    }
    catch (SQLiteException paramString)
    {
      zzbg.zzaE("Error storing hit");
    }
  }
  
  private void zzq(long paramLong)
  {
    zzf(new String[] { String.valueOf(paramLong) });
  }
  
  public void dispatch()
  {
    zzbg.v("GTM Dispatch running...");
    if (!zzaQN.zzzX()) {}
    do
    {
      return;
      List localList = zzjk(40);
      if (localList.isEmpty())
      {
        zzbg.v("...nothing to dispatch");
        zzaQO.zzas(true);
        return;
      }
      zzaQN.zzr(localList);
    } while (zzAt() <= 0);
    zzcu.zzAP().dispatch();
  }
  
  int zzAs()
  {
    Object localObject3 = null;
    Object localObject1 = null;
    int i = 0;
    int j = 0;
    Object localObject5 = zzeG("Error opening database for getNumStoredHits.");
    if (localObject5 == null) {}
    for (;;)
    {
      return j;
      try
      {
        localObject5 = ((SQLiteDatabase)localObject5).rawQuery("SELECT COUNT(*) from gtm_hits", null);
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
        zzbg.zzaE("Error getting numStoredHits");
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
  
  /* Error */
  int zzAt()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: ldc -87
    //   6: invokespecial 173	com/google/android/gms/tagmanager/zzby:zzeG	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   9: astore_3
    //   10: aload_3
    //   11: ifnonnull +5 -> 16
    //   14: iconst_0
    //   15: ireturn
    //   16: aload_3
    //   17: ldc 35
    //   19: iconst_2
    //   20: anewarray 45	java/lang/String
    //   23: dup
    //   24: iconst_0
    //   25: ldc 37
    //   27: aastore
    //   28: dup
    //   29: iconst_1
    //   30: ldc 43
    //   32: aastore
    //   33: ldc_w 290
    //   36: aconst_null
    //   37: aconst_null
    //   38: aconst_null
    //   39: aconst_null
    //   40: invokevirtual 294	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   43: astore_3
    //   44: aload_3
    //   45: invokeinterface 297 1 0
    //   50: istore_2
    //   51: iload_2
    //   52: istore_1
    //   53: aload_3
    //   54: ifnull +11 -> 65
    //   57: aload_3
    //   58: invokeinterface 286 1 0
    //   63: iload_2
    //   64: istore_1
    //   65: iload_1
    //   66: ireturn
    //   67: astore_3
    //   68: aconst_null
    //   69: astore_3
    //   70: ldc_w 299
    //   73: invokestatic 205	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   76: aload_3
    //   77: ifnull +56 -> 133
    //   80: aload_3
    //   81: invokeinterface 286 1 0
    //   86: iconst_0
    //   87: istore_1
    //   88: goto -23 -> 65
    //   91: astore_3
    //   92: aload 4
    //   94: ifnull +10 -> 104
    //   97: aload 4
    //   99: invokeinterface 286 1 0
    //   104: aload_3
    //   105: athrow
    //   106: astore 5
    //   108: aload_3
    //   109: astore 4
    //   111: aload 5
    //   113: astore_3
    //   114: goto -22 -> 92
    //   117: astore 5
    //   119: aload_3
    //   120: astore 4
    //   122: aload 5
    //   124: astore_3
    //   125: goto -33 -> 92
    //   128: astore 4
    //   130: goto -60 -> 70
    //   133: iconst_0
    //   134: istore_1
    //   135: goto -70 -> 65
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	138	0	this	zzby
    //   52	83	1	i	int
    //   50	14	2	j	int
    //   9	49	3	localObject1	Object
    //   67	1	3	localSQLiteException1	SQLiteException
    //   69	12	3	localObject2	Object
    //   91	18	3	localObject3	Object
    //   113	12	3	localObject4	Object
    //   1	120	4	localObject5	Object
    //   128	1	4	localSQLiteException2	SQLiteException
    //   106	6	5	localObject6	Object
    //   117	6	5	localObject7	Object
    // Exception table:
    //   from	to	target	type
    //   16	44	67	android/database/sqlite/SQLiteException
    //   16	44	91	finally
    //   44	51	106	finally
    //   70	76	117	finally
    //   44	51	128	android/database/sqlite/SQLiteException
  }
  
  void zzf(String[] paramArrayOfString)
  {
    boolean bool = true;
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0)) {}
    SQLiteDatabase localSQLiteDatabase;
    do
    {
      return;
      localSQLiteDatabase = zzeG("Error opening database for deleteHits.");
    } while (localSQLiteDatabase == null);
    String str = String.format("HIT_ID in (%s)", new Object[] { TextUtils.join(",", Collections.nCopies(paramArrayOfString.length, "?")) });
    for (;;)
    {
      try
      {
        localSQLiteDatabase.delete("gtm_hits", str, paramArrayOfString);
        paramArrayOfString = zzaQO;
        if (zzAs() == 0)
        {
          paramArrayOfString.zzas(bool);
          return;
        }
      }
      catch (SQLiteException paramArrayOfString)
      {
        zzbg.zzaE("Error deleting hits");
        return;
      }
      bool = false;
    }
  }
  
  public void zzg(long paramLong, String paramString)
  {
    zziG();
    zzAr();
    zzh(paramLong, paramString);
  }
  
  int zziG()
  {
    boolean bool = true;
    long l = zzpO.currentTimeMillis();
    if (l <= zzaQQ + 86400000L) {}
    do
    {
      return 0;
      zzaQQ = l;
      localObject = zzeG("Error opening database for deleteStaleHits.");
    } while (localObject == null);
    int i = ((SQLiteDatabase)localObject).delete("gtm_hits", "HIT_TIME < ?", new String[] { Long.toString(zzpO.currentTimeMillis() - 2592000000L) });
    Object localObject = zzaQO;
    if (zzAs() == 0) {}
    for (;;)
    {
      ((zzav)localObject).zzas(bool);
      return i;
      bool = false;
    }
  }
  
  /* Error */
  List<String> zzjj(int paramInt)
  {
    // Byte code:
    //   0: new 351	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 352	java/util/ArrayList:<init>	()V
    //   7: astore 6
    //   9: iload_1
    //   10: ifgt +12 -> 22
    //   13: ldc_w 354
    //   16: invokestatic 205	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   19: aload 6
    //   21: areturn
    //   22: aload_0
    //   23: ldc_w 356
    //   26: invokespecial 173	com/google/android/gms/tagmanager/zzby:zzeG	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   29: astore_3
    //   30: aload_3
    //   31: ifnonnull +6 -> 37
    //   34: aload 6
    //   36: areturn
    //   37: ldc_w 358
    //   40: iconst_1
    //   41: anewarray 4	java/lang/Object
    //   44: dup
    //   45: iconst_0
    //   46: ldc 37
    //   48: aastore
    //   49: invokestatic 49	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   52: astore 4
    //   54: iload_1
    //   55: invokestatic 361	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   58: astore 5
    //   60: aload_3
    //   61: ldc 35
    //   63: iconst_1
    //   64: anewarray 45	java/lang/String
    //   67: dup
    //   68: iconst_0
    //   69: ldc 37
    //   71: aastore
    //   72: aconst_null
    //   73: aconst_null
    //   74: aconst_null
    //   75: aconst_null
    //   76: aload 4
    //   78: aload 5
    //   80: invokevirtual 364	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   83: astore 4
    //   85: aload 4
    //   87: astore_3
    //   88: aload 4
    //   90: invokeinterface 279 1 0
    //   95: ifeq +40 -> 135
    //   98: aload 4
    //   100: astore_3
    //   101: aload 6
    //   103: aload 4
    //   105: iconst_0
    //   106: invokeinterface 283 2 0
    //   111: invokestatic 191	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   114: invokeinterface 368 2 0
    //   119: pop
    //   120: aload 4
    //   122: astore_3
    //   123: aload 4
    //   125: invokeinterface 371 1 0
    //   130: istore_2
    //   131: iload_2
    //   132: ifne -34 -> 98
    //   135: aload 4
    //   137: ifnull +10 -> 147
    //   140: aload 4
    //   142: invokeinterface 286 1 0
    //   147: aload 6
    //   149: areturn
    //   150: astore 5
    //   152: aconst_null
    //   153: astore 4
    //   155: aload 4
    //   157: astore_3
    //   158: new 114	java/lang/StringBuilder
    //   161: dup
    //   162: invokespecial 115	java/lang/StringBuilder:<init>	()V
    //   165: ldc_w 373
    //   168: invokevirtual 121	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   171: aload 5
    //   173: invokevirtual 376	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   176: invokevirtual 121	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   182: invokestatic 205	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   185: aload 4
    //   187: ifnull -40 -> 147
    //   190: aload 4
    //   192: invokeinterface 286 1 0
    //   197: goto -50 -> 147
    //   200: astore 4
    //   202: aconst_null
    //   203: astore_3
    //   204: aload_3
    //   205: ifnull +9 -> 214
    //   208: aload_3
    //   209: invokeinterface 286 1 0
    //   214: aload 4
    //   216: athrow
    //   217: astore 4
    //   219: goto -15 -> 204
    //   222: astore 5
    //   224: goto -69 -> 155
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	227	0	this	zzby
    //   0	227	1	paramInt	int
    //   130	2	2	bool	boolean
    //   29	180	3	localObject1	Object
    //   52	139	4	localObject2	Object
    //   200	15	4	localObject3	Object
    //   217	1	4	localObject4	Object
    //   58	21	5	str	String
    //   150	22	5	localSQLiteException1	SQLiteException
    //   222	1	5	localSQLiteException2	SQLiteException
    //   7	141	6	localArrayList	java.util.ArrayList
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
  
  /* Error */
  public List<zzaq> zzjk(int paramInt)
  {
    // Byte code:
    //   0: new 351	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 352	java/util/ArrayList:<init>	()V
    //   7: astore 5
    //   9: aload_0
    //   10: ldc_w 380
    //   13: invokespecial 173	com/google/android/gms/tagmanager/zzby:zzeG	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   16: astore 8
    //   18: aload 8
    //   20: ifnonnull +10 -> 30
    //   23: aload 5
    //   25: astore 6
    //   27: aload 6
    //   29: areturn
    //   30: aconst_null
    //   31: astore 4
    //   33: ldc_w 358
    //   36: iconst_1
    //   37: anewarray 4	java/lang/Object
    //   40: dup
    //   41: iconst_0
    //   42: ldc 37
    //   44: aastore
    //   45: invokestatic 49	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   48: astore 6
    //   50: iload_1
    //   51: invokestatic 361	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   54: astore 7
    //   56: aload 8
    //   58: ldc 35
    //   60: iconst_3
    //   61: anewarray 45	java/lang/String
    //   64: dup
    //   65: iconst_0
    //   66: ldc 37
    //   68: aastore
    //   69: dup
    //   70: iconst_1
    //   71: ldc 39
    //   73: aastore
    //   74: dup
    //   75: iconst_2
    //   76: ldc 43
    //   78: aastore
    //   79: aconst_null
    //   80: aconst_null
    //   81: aconst_null
    //   82: aconst_null
    //   83: aload 6
    //   85: aload 7
    //   87: invokevirtual 364	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   90: astore 6
    //   92: aload 6
    //   94: astore 4
    //   96: new 351	java/util/ArrayList
    //   99: dup
    //   100: invokespecial 352	java/util/ArrayList:<init>	()V
    //   103: astore 7
    //   105: aload 4
    //   107: invokeinterface 279 1 0
    //   112: ifeq +54 -> 166
    //   115: aload 7
    //   117: new 382	com/google/android/gms/tagmanager/zzaq
    //   120: dup
    //   121: aload 4
    //   123: iconst_0
    //   124: invokeinterface 283 2 0
    //   129: aload 4
    //   131: iconst_1
    //   132: invokeinterface 283 2 0
    //   137: aload 4
    //   139: iconst_2
    //   140: invokeinterface 283 2 0
    //   145: invokespecial 385	com/google/android/gms/tagmanager/zzaq:<init>	(JJJ)V
    //   148: invokeinterface 368 2 0
    //   153: pop
    //   154: aload 4
    //   156: invokeinterface 371 1 0
    //   161: istore_3
    //   162: iload_3
    //   163: ifne -48 -> 115
    //   166: aload 4
    //   168: ifnull +10 -> 178
    //   171: aload 4
    //   173: invokeinterface 286 1 0
    //   178: aload 4
    //   180: astore 5
    //   182: ldc_w 358
    //   185: iconst_1
    //   186: anewarray 4	java/lang/Object
    //   189: dup
    //   190: iconst_0
    //   191: ldc 37
    //   193: aastore
    //   194: invokestatic 49	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   197: astore 6
    //   199: aload 4
    //   201: astore 5
    //   203: iload_1
    //   204: invokestatic 361	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   207: astore 9
    //   209: aload 4
    //   211: astore 5
    //   213: aload 8
    //   215: ldc 35
    //   217: iconst_2
    //   218: anewarray 45	java/lang/String
    //   221: dup
    //   222: iconst_0
    //   223: ldc 37
    //   225: aastore
    //   226: dup
    //   227: iconst_1
    //   228: ldc 41
    //   230: aastore
    //   231: aconst_null
    //   232: aconst_null
    //   233: aconst_null
    //   234: aconst_null
    //   235: aload 6
    //   237: aload 9
    //   239: invokevirtual 364	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   242: astore 6
    //   244: aload 6
    //   246: invokeinterface 279 1 0
    //   251: ifeq +53 -> 304
    //   254: iconst_0
    //   255: istore_1
    //   256: aload 6
    //   258: checkcast 387	android/database/sqlite/SQLiteCursor
    //   261: invokevirtual 391	android/database/sqlite/SQLiteCursor:getWindow	()Landroid/database/CursorWindow;
    //   264: invokevirtual 396	android/database/CursorWindow:getNumRows	()I
    //   267: ifle +136 -> 403
    //   270: aload 7
    //   272: iload_1
    //   273: invokeinterface 400 2 0
    //   278: checkcast 382	com/google/android/gms/tagmanager/zzaq
    //   281: aload 6
    //   283: iconst_1
    //   284: invokeinterface 403 2 0
    //   289: invokevirtual 406	com/google/android/gms/tagmanager/zzaq:zzeK	(Ljava/lang/String;)V
    //   292: aload 6
    //   294: invokeinterface 371 1 0
    //   299: istore_3
    //   300: iload_3
    //   301: ifne +375 -> 676
    //   304: aload 6
    //   306: ifnull +10 -> 316
    //   309: aload 6
    //   311: invokeinterface 286 1 0
    //   316: aload 7
    //   318: areturn
    //   319: astore 6
    //   321: aconst_null
    //   322: astore 7
    //   324: aload 5
    //   326: astore 4
    //   328: aload 7
    //   330: astore 5
    //   332: new 114	java/lang/StringBuilder
    //   335: dup
    //   336: invokespecial 115	java/lang/StringBuilder:<init>	()V
    //   339: ldc_w 373
    //   342: invokevirtual 121	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   345: aload 6
    //   347: invokevirtual 376	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   350: invokevirtual 121	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   353: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   356: invokestatic 205	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   359: aload 4
    //   361: astore 6
    //   363: aload 5
    //   365: ifnull -338 -> 27
    //   368: aload 5
    //   370: invokeinterface 286 1 0
    //   375: aload 4
    //   377: areturn
    //   378: astore 6
    //   380: aload 4
    //   382: astore 5
    //   384: aload 6
    //   386: astore 4
    //   388: aload 5
    //   390: ifnull +10 -> 400
    //   393: aload 5
    //   395: invokeinterface 286 1 0
    //   400: aload 4
    //   402: athrow
    //   403: ldc_w 408
    //   406: iconst_1
    //   407: anewarray 4	java/lang/Object
    //   410: dup
    //   411: iconst_0
    //   412: aload 7
    //   414: iload_1
    //   415: invokeinterface 400 2 0
    //   420: checkcast 382	com/google/android/gms/tagmanager/zzaq
    //   423: invokevirtual 411	com/google/android/gms/tagmanager/zzaq:zzAe	()J
    //   426: invokestatic 182	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   429: aastore
    //   430: invokestatic 49	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   433: invokestatic 205	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   436: goto -144 -> 292
    //   439: astore 5
    //   441: aload 6
    //   443: astore 4
    //   445: aload 5
    //   447: astore 6
    //   449: aload 4
    //   451: astore 5
    //   453: new 114	java/lang/StringBuilder
    //   456: dup
    //   457: invokespecial 115	java/lang/StringBuilder:<init>	()V
    //   460: ldc_w 413
    //   463: invokevirtual 121	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   466: aload 6
    //   468: invokevirtual 376	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   471: invokevirtual 121	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   474: invokevirtual 135	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   477: invokestatic 205	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   480: aload 4
    //   482: astore 5
    //   484: new 351	java/util/ArrayList
    //   487: dup
    //   488: invokespecial 352	java/util/ArrayList:<init>	()V
    //   491: astore 6
    //   493: iconst_0
    //   494: istore_1
    //   495: aload 4
    //   497: astore 5
    //   499: aload 7
    //   501: invokeinterface 417 1 0
    //   506: astore 7
    //   508: aload 4
    //   510: astore 5
    //   512: aload 7
    //   514: invokeinterface 422 1 0
    //   519: ifeq +42 -> 561
    //   522: aload 4
    //   524: astore 5
    //   526: aload 7
    //   528: invokeinterface 426 1 0
    //   533: checkcast 382	com/google/android/gms/tagmanager/zzaq
    //   536: astore 8
    //   538: aload 4
    //   540: astore 5
    //   542: aload 8
    //   544: invokevirtual 429	com/google/android/gms/tagmanager/zzaq:zzAg	()Ljava/lang/String;
    //   547: invokestatic 432	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   550: istore_3
    //   551: iload_1
    //   552: istore_2
    //   553: iload_3
    //   554: ifeq +24 -> 578
    //   557: iload_1
    //   558: ifeq +18 -> 576
    //   561: aload 4
    //   563: ifnull +10 -> 573
    //   566: aload 4
    //   568: invokeinterface 286 1 0
    //   573: aload 6
    //   575: areturn
    //   576: iconst_1
    //   577: istore_2
    //   578: aload 4
    //   580: astore 5
    //   582: aload 6
    //   584: aload 8
    //   586: invokeinterface 368 2 0
    //   591: pop
    //   592: iload_2
    //   593: istore_1
    //   594: goto -86 -> 508
    //   597: astore 4
    //   599: aload 5
    //   601: ifnull +10 -> 611
    //   604: aload 5
    //   606: invokeinterface 286 1 0
    //   611: aload 4
    //   613: athrow
    //   614: astore 4
    //   616: aload 6
    //   618: astore 5
    //   620: goto -21 -> 599
    //   623: astore 6
    //   625: goto -176 -> 449
    //   628: astore 6
    //   630: aload 4
    //   632: astore 5
    //   634: aload 6
    //   636: astore 4
    //   638: goto -250 -> 388
    //   641: astore 4
    //   643: goto -255 -> 388
    //   646: astore 6
    //   648: aload 4
    //   650: astore 7
    //   652: aload 5
    //   654: astore 4
    //   656: aload 7
    //   658: astore 5
    //   660: goto -328 -> 332
    //   663: astore 6
    //   665: aload 4
    //   667: astore 5
    //   669: aload 7
    //   671: astore 4
    //   673: goto -341 -> 332
    //   676: iload_1
    //   677: iconst_1
    //   678: iadd
    //   679: istore_1
    //   680: goto -424 -> 256
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	683	0	this	zzby
    //   0	683	1	paramInt	int
    //   552	41	2	i	int
    //   161	393	3	bool	boolean
    //   31	548	4	localObject1	Object
    //   597	15	4	localObject2	Object
    //   614	17	4	localObject3	Object
    //   636	1	4	localObject4	Object
    //   641	8	4	localObject5	Object
    //   654	18	4	localObject6	Object
    //   7	387	5	localObject7	Object
    //   439	7	5	localSQLiteException1	SQLiteException
    //   451	217	5	localObject8	Object
    //   25	285	6	localObject9	Object
    //   319	27	6	localSQLiteException2	SQLiteException
    //   361	1	6	localObject10	Object
    //   378	64	6	localObject11	Object
    //   447	170	6	localObject12	Object
    //   623	1	6	localSQLiteException3	SQLiteException
    //   628	7	6	localObject13	Object
    //   646	1	6	localSQLiteException4	SQLiteException
    //   663	1	6	localSQLiteException5	SQLiteException
    //   54	616	7	localObject14	Object
    //   16	569	8	localObject15	Object
    //   207	31	9	str	String
    // Exception table:
    //   from	to	target	type
    //   33	92	319	android/database/sqlite/SQLiteException
    //   33	92	378	finally
    //   244	254	439	android/database/sqlite/SQLiteException
    //   256	292	439	android/database/sqlite/SQLiteException
    //   292	300	439	android/database/sqlite/SQLiteException
    //   403	436	439	android/database/sqlite/SQLiteException
    //   182	199	597	finally
    //   203	209	597	finally
    //   213	244	597	finally
    //   453	480	597	finally
    //   484	493	597	finally
    //   499	508	597	finally
    //   512	522	597	finally
    //   526	538	597	finally
    //   542	551	597	finally
    //   582	592	597	finally
    //   244	254	614	finally
    //   256	292	614	finally
    //   292	300	614	finally
    //   403	436	614	finally
    //   182	199	623	android/database/sqlite/SQLiteException
    //   203	209	623	android/database/sqlite/SQLiteException
    //   213	244	623	android/database/sqlite/SQLiteException
    //   96	105	628	finally
    //   105	115	628	finally
    //   115	162	628	finally
    //   332	359	641	finally
    //   96	105	646	android/database/sqlite/SQLiteException
    //   105	115	663	android/database/sqlite/SQLiteException
    //   115	162	663	android/database/sqlite/SQLiteException
  }
  
  class zza
    implements zzcx.zza
  {
    zza() {}
    
    public void zza(zzaq paramZzaq)
    {
      zzby.zza(zzby.this, paramZzaq.zzAe());
    }
    
    public void zzb(zzaq paramZzaq)
    {
      zzby.zza(zzby.this, paramZzaq.zzAe());
      zzbg.v("Permanent failure dispatching hitId: " + paramZzaq.zzAe());
    }
    
    public void zzc(zzaq paramZzaq)
    {
      long l = paramZzaq.zzAf();
      if (l == 0L) {
        zzby.zza(zzby.this, paramZzaq.zzAe(), zzby.zza(zzby.this).currentTimeMillis());
      }
      while (l + 14400000L >= zzby.zza(zzby.this).currentTimeMillis()) {
        return;
      }
      zzby.zza(zzby.this, paramZzaq.zzAe());
      zzbg.v("Giving up on failed hitId: " + paramZzaq.zzAe());
    }
  }
  
  class zzb
    extends SQLiteOpenHelper
  {
    private boolean zzaQT;
    private long zzaQU = 0L;
    
    zzb(Context paramContext, String paramString)
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
      //   4: ldc 29
      //   6: iconst_1
      //   7: anewarray 31	java/lang/String
      //   10: dup
      //   11: iconst_0
      //   12: ldc 33
      //   14: aastore
      //   15: ldc 35
      //   17: iconst_1
      //   18: anewarray 31	java/lang/String
      //   21: dup
      //   22: iconst_0
      //   23: aload_1
      //   24: aastore
      //   25: aconst_null
      //   26: aconst_null
      //   27: aconst_null
      //   28: invokevirtual 41	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   31: astore_2
      //   32: aload_2
      //   33: invokeinterface 47 1 0
      //   38: istore_3
      //   39: aload_2
      //   40: ifnull +9 -> 49
      //   43: aload_2
      //   44: invokeinterface 51 1 0
      //   49: iload_3
      //   50: ireturn
      //   51: astore_2
      //   52: aconst_null
      //   53: astore_2
      //   54: new 53	java/lang/StringBuilder
      //   57: dup
      //   58: invokespecial 55	java/lang/StringBuilder:<init>	()V
      //   61: ldc 57
      //   63: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   66: aload_1
      //   67: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   70: invokevirtual 65	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   73: invokestatic 71	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
      //   76: aload_2
      //   77: ifnull +9 -> 86
      //   80: aload_2
      //   81: invokeinterface 51 1 0
      //   86: iconst_0
      //   87: ireturn
      //   88: astore_1
      //   89: aload 4
      //   91: astore_2
      //   92: aload_2
      //   93: ifnull +9 -> 102
      //   96: aload_2
      //   97: invokeinterface 51 1 0
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
      //   0	117	0	this	zzb
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
      paramSQLiteDatabase = paramSQLiteDatabase.rawQuery("SELECT * FROM gtm_hits WHERE 0", null);
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
        if ((!localHashSet.remove("hit_id")) || (!localHashSet.remove("hit_url")) || (!localHashSet.remove("hit_time")) || (!localHashSet.remove("hit_first_send_time"))) {
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
      if ((zzaQT) && (zzaQU + 3600000L > zzby.zza(zzby.this).currentTimeMillis())) {
        throw new SQLiteException("Database creation failed");
      }
      Object localObject1 = null;
      zzaQT = true;
      zzaQU = zzby.zza(zzby.this).currentTimeMillis();
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
          zzby.zzc(zzby.this).getDatabasePath(zzby.zzb(zzby.this)).delete();
        }
      }
      localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = super.getWritableDatabase();
      }
      zzaQT = false;
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
        if (!zza("gtm_hits", paramSQLiteDatabase))
        {
          paramSQLiteDatabase.execSQL(zzby.zzAu());
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
}
