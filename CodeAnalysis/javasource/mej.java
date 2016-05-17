import VACDReport.ReportHeader;
import VACDReport.ReportItem;
import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.Base64Util;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import org.json.JSONObject;

class mej
  extends SQLiteOpenHelper
{
  private static final int jdField_a_of_type_Int = 6;
  private static final long jdField_a_of_type_Long = 30000L;
  private static final String jdField_a_of_type_JavaLangString = "VACDReport";
  private static final int jdField_b_of_type_Int = 1;
  private static final String jdField_b_of_type_JavaLangString = "VACDReport.db";
  private static final int jdField_c_of_type_Int = 0;
  private static final String jdField_c_of_type_JavaLangString = "ReportItem";
  private static final String d = "createTime";
  private static final String e = "seqno";
  private static final String f = "content";
  private static final String g = "type";
  private static final String h = "skey";
  private static final String i = "sendTime";
  private static final String j = "ReportRecord";
  private SQLiteDatabase jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase;
  
  public mej(Context paramContext)
  {
    super(paramContext, "VACDReport.db", null, 6);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  private ReportHeader a(long paramLong)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore_3
    //   5: aload_0
    //   6: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   9: ldc 63
    //   11: iconst_2
    //   12: anewarray 65	java/lang/String
    //   15: dup
    //   16: iconst_0
    //   17: lload_1
    //   18: invokestatic 69	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   21: aastore
    //   22: dup
    //   23: iconst_1
    //   24: iconst_1
    //   25: invokestatic 72	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   28: aastore
    //   29: invokevirtual 78	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore 4
    //   34: aload 4
    //   36: ifnull +219 -> 255
    //   39: aload 4
    //   41: invokeinterface 84 1 0
    //   46: ifle +209 -> 255
    //   49: aload 4
    //   51: invokeinterface 88 1 0
    //   56: pop
    //   57: aload_0
    //   58: aload 4
    //   60: aload 4
    //   62: ldc 30
    //   64: invokeinterface 92 2 0
    //   69: invokeinterface 95 2 0
    //   74: invokespecial 98	mej:a	(Ljava/lang/String;)LVACDReport/ReportHeader;
    //   77: astore_3
    //   78: aload_3
    //   79: ifnonnull +47 -> 126
    //   82: aload_0
    //   83: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   86: ldc 21
    //   88: ldc 100
    //   90: iconst_1
    //   91: anewarray 65	java/lang/String
    //   94: dup
    //   95: iconst_0
    //   96: lload_1
    //   97: invokestatic 69	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   100: aastore
    //   101: invokevirtual 104	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   104: pop
    //   105: aload_3
    //   106: astore 5
    //   108: aload 4
    //   110: ifnull +13 -> 123
    //   113: aload 4
    //   115: invokeinterface 108 1 0
    //   120: aload_3
    //   121: astore 5
    //   123: aload 5
    //   125: areturn
    //   126: aload_3
    //   127: aload 4
    //   129: aload 4
    //   131: ldc 36
    //   133: invokeinterface 92 2 0
    //   138: invokeinterface 95 2 0
    //   143: putfield 113	VACDReport/ReportHeader:sKey	Ljava/lang/String;
    //   146: goto -41 -> 105
    //   149: astore 5
    //   151: aconst_null
    //   152: astore 6
    //   154: aload_3
    //   155: astore 4
    //   157: aload 6
    //   159: astore_3
    //   160: aload 4
    //   162: astore 6
    //   164: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   167: ifeq +36 -> 203
    //   170: aload 4
    //   172: astore 6
    //   174: ldc 13
    //   176: iconst_2
    //   177: new 120	java/lang/StringBuilder
    //   180: dup
    //   181: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   184: ldc 124
    //   186: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   189: aload 5
    //   191: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   194: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   197: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   200: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   203: aload_3
    //   204: astore 5
    //   206: aload 4
    //   208: ifnull -85 -> 123
    //   211: aload 4
    //   213: invokeinterface 108 1 0
    //   218: aload_3
    //   219: areturn
    //   220: astore_3
    //   221: aload 6
    //   223: ifnull +10 -> 233
    //   226: aload 6
    //   228: invokeinterface 108 1 0
    //   233: aload_3
    //   234: athrow
    //   235: astore_3
    //   236: aload 4
    //   238: astore 6
    //   240: goto -19 -> 221
    //   243: astore 5
    //   245: aconst_null
    //   246: astore_3
    //   247: goto -87 -> 160
    //   250: astore 5
    //   252: goto -92 -> 160
    //   255: aconst_null
    //   256: astore_3
    //   257: goto -152 -> 105
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	260	0	this	mej
    //   0	260	1	paramLong	long
    //   4	215	3	localObject1	Object
    //   220	14	3	localObject2	Object
    //   235	1	3	localObject3	Object
    //   246	11	3	localObject4	Object
    //   32	205	4	localObject5	Object
    //   106	18	5	localObject6	Object
    //   149	41	5	localException1	Exception
    //   204	1	5	localObject7	Object
    //   243	1	5	localException2	Exception
    //   250	1	5	localException3	Exception
    //   1	238	6	localObject8	Object
    // Exception table:
    //   from	to	target	type
    //   5	34	149	java/lang/Exception
    //   5	34	220	finally
    //   164	170	220	finally
    //   174	203	220	finally
    //   39	78	235	finally
    //   82	105	235	finally
    //   126	146	235	finally
    //   39	78	243	java/lang/Exception
    //   82	105	250	java/lang/Exception
    //   126	146	250	java/lang/Exception
  }
  
  private ReportHeader a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    paramString = new String(Base64Util.decode(paramString.getBytes(), 0));
    try
    {
      paramString = new JSONObject(paramString);
      ReportHeader localReportHeader = new ReportHeader();
      platform = paramString.optString("platform");
      version = paramString.optString("version");
      seqno = paramString.optLong("seqno");
      sAction = paramString.optString("sAction");
      sModule = paramString.optString("sModule");
      uin = paramString.optLong("uin");
      iNetType = paramString.optInt("iNetType");
      result = paramString.optInt("result");
      createTime = paramString.optLong("createTime");
      serverTime = paramString.optLong("serverTime");
      return localReportHeader;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  private ReportItem a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    paramString = new String(Base64Util.decode(paramString.getBytes(), 0));
    try
    {
      paramString = new JSONObject(paramString);
      ReportItem localReportItem = new ReportItem();
      step = paramString.optString("step");
      createTime = paramString.optLong("createTime");
      params = paramString.optString("params");
      result = paramString.optInt("result");
      failReason = paramString.optString("failReason");
      return localReportItem;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  private SQLiteDatabase a()
  {
    if ((a == null) || (!a.isOpen())) {
      a = getWritableDatabase();
    }
    return a;
  }
  
  private String a(ReportHeader paramReportHeader)
  {
    if (paramReportHeader == null) {}
    do
    {
      return null;
      try
      {
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("platform", platform);
        localJSONObject.put("version", version);
        localJSONObject.put("uin", uin);
        localJSONObject.put("seqno", seqno);
        localJSONObject.put("sModule", sModule);
        localJSONObject.put("sAction", sAction);
        localJSONObject.put("iNetType", iNetType);
        localJSONObject.put("result", result);
        localJSONObject.put("createTime", createTime);
        localJSONObject.put("serverTime", serverTime);
        paramReportHeader = new String(Base64Util.encode(localJSONObject.toString().getBytes(), 0));
        return paramReportHeader;
      }
      catch (Exception paramReportHeader) {}
    } while (!QLog.isColorLevel());
    QLog.e("VACDReport", 2, "convertHeaderToString exception:  " + paramReportHeader.toString());
    return null;
  }
  
  private String a(ReportItem paramReportItem)
  {
    if (paramReportItem == null) {
      return null;
    }
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("step", step);
      localJSONObject.put("createTime", createTime);
      localJSONObject.put("params", params);
      localJSONObject.put("result", result);
      localJSONObject.put("failReason", failReason);
      paramReportItem = new String(Base64Util.encode(localJSONObject.toString().getBytes(), 0));
      return paramReportItem;
    }
    catch (Exception paramReportItem) {}
    return null;
  }
  
  private void a(SQLiteDatabase paramSQLiteDatabase)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(" CREATE TABLE IF NOT EXISTS ").append("ReportRecord");
    localStringBuilder.append(" (");
    localStringBuilder.append("seqno").append(" INTEGER(16) NOT NULL, ");
    localStringBuilder.append("sendTime").append(" INTEGER(16) DEFAULT 0, PRIMARY KEY(");
    localStringBuilder.append("seqno").append("))");
    paramSQLiteDatabase.execSQL(localStringBuilder.toString());
  }
  
  /* Error */
  private void a(java.util.HashSet paramHashSet)
  {
    // Byte code:
    //   0: invokestatic 274	android/os/SystemClock:uptimeMillis	()J
    //   3: lstore_2
    //   4: invokestatic 277	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   7: ifeq +29 -> 36
    //   10: ldc 13
    //   12: iconst_4
    //   13: new 120	java/lang/StringBuilder
    //   16: dup
    //   17: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   20: ldc_w 279
    //   23: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   26: lload_2
    //   27: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   30: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   33: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   36: aload_0
    //   37: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   40: invokevirtual 285	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   43: new 287	android/content/ContentValues
    //   46: dup
    //   47: invokespecial 288	android/content/ContentValues:<init>	()V
    //   50: astore 4
    //   52: aload_1
    //   53: invokevirtual 294	java/util/HashSet:iterator	()Ljava/util/Iterator;
    //   56: astore_1
    //   57: aload_1
    //   58: invokeinterface 299 1 0
    //   63: ifeq +69 -> 132
    //   66: aload_1
    //   67: invokeinterface 303 1 0
    //   72: checkcast 305	java/lang/Long
    //   75: astore 5
    //   77: aload 4
    //   79: invokevirtual 308	android/content/ContentValues:clear	()V
    //   82: aload 4
    //   84: ldc 39
    //   86: lload_2
    //   87: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   90: invokevirtual 314	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   93: aload_0
    //   94: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   97: ldc 42
    //   99: aload 4
    //   101: ldc_w 316
    //   104: iconst_1
    //   105: anewarray 65	java/lang/String
    //   108: dup
    //   109: iconst_0
    //   110: aload 5
    //   112: invokestatic 319	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   115: aastore
    //   116: invokevirtual 323	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   119: pop
    //   120: goto -63 -> 57
    //   123: astore_1
    //   124: aload_0
    //   125: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   128: invokevirtual 326	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   131: return
    //   132: aload_0
    //   133: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   136: invokevirtual 329	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   139: aload_0
    //   140: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   143: invokevirtual 326	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   146: return
    //   147: astore_1
    //   148: aload_0
    //   149: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   152: invokevirtual 326	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   155: aload_1
    //   156: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	157	0	this	mej
    //   0	157	1	paramHashSet	java.util.HashSet
    //   3	84	2	l	long
    //   50	50	4	localContentValues	ContentValues
    //   75	36	5	localLong	Long
    // Exception table:
    //   from	to	target	type
    //   36	57	123	java/lang/Exception
    //   57	120	123	java/lang/Exception
    //   132	139	123	java/lang/Exception
    //   36	57	147	finally
    //   57	120	147	finally
    //   132	139	147	finally
  }
  
  private void b(SQLiteDatabase paramSQLiteDatabase)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(" CREATE TABLE IF NOT EXISTS ").append("ReportItem");
    localStringBuilder.append(" (");
    localStringBuilder.append("seqno").append(" INTEGER(16) NOT NULL, ");
    localStringBuilder.append("createTime").append(" INTEGER(16) NOT NULL, ");
    localStringBuilder.append("skey").append(" VARCHAR(16), ");
    localStringBuilder.append("type").append(" INTEGER DEFAULT 0, ");
    localStringBuilder.append("content").append(" VARCHAR(255))");
    paramSQLiteDatabase.execSQL(localStringBuilder.toString());
  }
  
  /* Error */
  public VACDReport.ReportInfo a(long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: lload_1
    //   2: invokespecial 338	mej:a	(J)LVACDReport/ReportHeader;
    //   5: astore 4
    //   7: aload 4
    //   9: ifnonnull +5 -> 14
    //   12: aconst_null
    //   13: areturn
    //   14: new 340	VACDReport/ReportInfo
    //   17: dup
    //   18: invokespecial 341	VACDReport/ReportInfo:<init>	()V
    //   21: astore 7
    //   23: aload 7
    //   25: aload 4
    //   27: putfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   30: aload 7
    //   32: new 347	VACDReport/ReportBody
    //   35: dup
    //   36: invokespecial 348	VACDReport/ReportBody:<init>	()V
    //   39: putfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   42: aload 7
    //   44: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   47: aload 4
    //   49: getfield 113	VACDReport/ReportHeader:sKey	Ljava/lang/String;
    //   52: putfield 353	VACDReport/ReportBody:sKey	Ljava/lang/String;
    //   55: aload 7
    //   57: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   60: aload 4
    //   62: getfield 208	VACDReport/ReportHeader:serverTime	J
    //   65: putfield 356	VACDReport/ReportBody:startTime	J
    //   68: aload 7
    //   70: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   73: new 358	java/util/ArrayList
    //   76: dup
    //   77: bipush 32
    //   79: invokespecial 361	java/util/ArrayList:<init>	(I)V
    //   82: putfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   85: aload_0
    //   86: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   89: ldc_w 367
    //   92: iconst_2
    //   93: anewarray 65	java/lang/String
    //   96: dup
    //   97: iconst_0
    //   98: lload_1
    //   99: invokestatic 69	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   102: aastore
    //   103: dup
    //   104: iconst_1
    //   105: iconst_0
    //   106: invokestatic 72	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   109: aastore
    //   110: invokevirtual 78	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   113: astore 5
    //   115: aload 5
    //   117: ifnull +371 -> 488
    //   120: aload 5
    //   122: astore 4
    //   124: aload 5
    //   126: invokeinterface 84 1 0
    //   131: ifle +357 -> 488
    //   134: aload 5
    //   136: astore 4
    //   138: aload 5
    //   140: ldc 30
    //   142: invokeinterface 92 2 0
    //   147: istore_3
    //   148: aload 5
    //   150: astore 4
    //   152: aload 7
    //   154: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   157: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   160: astore 6
    //   162: aload 5
    //   164: astore 4
    //   166: aload 5
    //   168: invokeinterface 88 1 0
    //   173: pop
    //   174: aload 5
    //   176: astore 4
    //   178: aload 5
    //   180: invokeinterface 370 1 0
    //   185: ifne +235 -> 420
    //   188: aload 5
    //   190: astore 4
    //   192: aload_0
    //   193: aload 5
    //   195: iload_3
    //   196: invokeinterface 95 2 0
    //   201: invokespecial 372	mej:a	(Ljava/lang/String;)LVACDReport/ReportItem;
    //   204: astore 8
    //   206: aload 8
    //   208: ifnull +136 -> 344
    //   211: aload 5
    //   213: astore 4
    //   215: aload 8
    //   217: getfield 375	VACDReport/ReportItem:costTime	J
    //   220: lconst_0
    //   221: lcmp
    //   222: ifne +54 -> 276
    //   225: aload 5
    //   227: astore 4
    //   229: aload 6
    //   231: invokeinterface 380 1 0
    //   236: ifle +40 -> 276
    //   239: aload 5
    //   241: astore 4
    //   243: aload 8
    //   245: aload 8
    //   247: getfield 217	VACDReport/ReportItem:createTime	J
    //   250: aload 6
    //   252: aload 6
    //   254: invokeinterface 380 1 0
    //   259: iconst_1
    //   260: isub
    //   261: invokeinterface 384 2 0
    //   266: checkcast 211	VACDReport/ReportItem
    //   269: getfield 217	VACDReport/ReportItem:createTime	J
    //   272: lsub
    //   273: putfield 375	VACDReport/ReportItem:costTime	J
    //   276: aload 5
    //   278: astore 4
    //   280: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   283: ifeq +47 -> 330
    //   286: aload 5
    //   288: astore 4
    //   290: ldc 13
    //   292: iconst_2
    //   293: new 120	java/lang/StringBuilder
    //   296: dup
    //   297: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   300: ldc_w 386
    //   303: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   306: lload_1
    //   307: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   310: ldc_w 388
    //   313: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   316: aload 8
    //   318: invokevirtual 389	VACDReport/ReportItem:toString	()Ljava/lang/String;
    //   321: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   324: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   327: invokestatic 391	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   330: aload 5
    //   332: astore 4
    //   334: aload 6
    //   336: aload 8
    //   338: invokeinterface 395 2 0
    //   343: pop
    //   344: aload 5
    //   346: astore 4
    //   348: aload 5
    //   350: invokeinterface 398 1 0
    //   355: pop
    //   356: goto -182 -> 174
    //   359: astore 6
    //   361: aload 5
    //   363: astore 4
    //   365: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   368: ifeq +37 -> 405
    //   371: aload 5
    //   373: astore 4
    //   375: ldc 13
    //   377: iconst_2
    //   378: new 120	java/lang/StringBuilder
    //   381: dup
    //   382: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   385: ldc_w 400
    //   388: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   391: aload 6
    //   393: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   396: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   399: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   402: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   405: aload 5
    //   407: ifnull +10 -> 417
    //   410: aload 5
    //   412: invokeinterface 108 1 0
    //   417: aload 7
    //   419: areturn
    //   420: aload 5
    //   422: astore 4
    //   424: aload 6
    //   426: aload 6
    //   428: invokeinterface 380 1 0
    //   433: iconst_1
    //   434: isub
    //   435: invokeinterface 384 2 0
    //   440: checkcast 211	VACDReport/ReportItem
    //   443: astore 6
    //   445: aload 5
    //   447: astore 4
    //   449: aload 7
    //   451: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   454: aload 6
    //   456: getfield 217	VACDReport/ReportItem:createTime	J
    //   459: aload 7
    //   461: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   464: getfield 204	VACDReport/ReportHeader:createTime	J
    //   467: lsub
    //   468: putfield 403	VACDReport/ReportBody:totalTime	J
    //   471: aload 5
    //   473: astore 4
    //   475: aload 7
    //   477: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   480: aload 6
    //   482: getfield 222	VACDReport/ReportItem:result	I
    //   485: putfield 202	VACDReport/ReportHeader:result	I
    //   488: aload 5
    //   490: ifnull -73 -> 417
    //   493: aload 5
    //   495: invokeinterface 108 1 0
    //   500: goto -83 -> 417
    //   503: astore 4
    //   505: aconst_null
    //   506: astore 6
    //   508: aload 4
    //   510: astore 5
    //   512: aload 6
    //   514: ifnull +10 -> 524
    //   517: aload 6
    //   519: invokeinterface 108 1 0
    //   524: aload 5
    //   526: athrow
    //   527: astore 5
    //   529: aload 4
    //   531: astore 6
    //   533: goto -21 -> 512
    //   536: astore 6
    //   538: aconst_null
    //   539: astore 5
    //   541: goto -180 -> 361
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	544	0	this	mej
    //   0	544	1	paramLong	long
    //   147	49	3	k	int
    //   5	469	4	localObject1	Object
    //   503	27	4	localObject2	Object
    //   113	412	5	localObject3	Object
    //   527	1	5	localObject4	Object
    //   539	1	5	localObject5	Object
    //   160	175	6	localArrayList	java.util.ArrayList
    //   359	68	6	localException1	Exception
    //   443	89	6	localObject6	Object
    //   536	1	6	localException2	Exception
    //   21	455	7	localReportInfo	VACDReport.ReportInfo
    //   204	133	8	localReportItem	ReportItem
    // Exception table:
    //   from	to	target	type
    //   124	134	359	java/lang/Exception
    //   138	148	359	java/lang/Exception
    //   152	162	359	java/lang/Exception
    //   166	174	359	java/lang/Exception
    //   178	188	359	java/lang/Exception
    //   192	206	359	java/lang/Exception
    //   215	225	359	java/lang/Exception
    //   229	239	359	java/lang/Exception
    //   243	276	359	java/lang/Exception
    //   280	286	359	java/lang/Exception
    //   290	330	359	java/lang/Exception
    //   334	344	359	java/lang/Exception
    //   348	356	359	java/lang/Exception
    //   424	445	359	java/lang/Exception
    //   449	471	359	java/lang/Exception
    //   475	488	359	java/lang/Exception
    //   85	115	503	finally
    //   124	134	527	finally
    //   138	148	527	finally
    //   152	162	527	finally
    //   166	174	527	finally
    //   178	188	527	finally
    //   192	206	527	finally
    //   215	225	527	finally
    //   229	239	527	finally
    //   243	276	527	finally
    //   280	286	527	finally
    //   290	330	527	finally
    //   334	344	527	finally
    //   348	356	527	finally
    //   365	371	527	finally
    //   375	405	527	finally
    //   424	445	527	finally
    //   449	471	527	finally
    //   475	488	527	finally
    //   85	115	536	java/lang/Exception
  }
  
  /* Error */
  public java.util.Map a()
  {
    // Byte code:
    //   0: invokestatic 409	java/lang/System:currentTimeMillis	()J
    //   3: lstore 12
    //   5: new 411	java/util/HashMap
    //   8: dup
    //   9: bipush 10
    //   11: invokespecial 412	java/util/HashMap:<init>	(I)V
    //   14: astore 17
    //   16: new 290	java/util/HashSet
    //   19: dup
    //   20: bipush 10
    //   22: invokespecial 413	java/util/HashSet:<init>	(I)V
    //   25: astore 18
    //   27: aconst_null
    //   28: astore 14
    //   30: aload_0
    //   31: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   34: ldc_w 415
    //   37: iconst_1
    //   38: anewarray 65	java/lang/String
    //   41: dup
    //   42: iconst_0
    //   43: invokestatic 274	android/os/SystemClock:uptimeMillis	()J
    //   46: ldc2_w 9
    //   49: lsub
    //   50: invokestatic 69	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   53: aastore
    //   54: invokevirtual 78	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   57: astore 15
    //   59: aload 15
    //   61: astore 14
    //   63: aload 14
    //   65: ifnull +311 -> 376
    //   68: aload 14
    //   70: invokeinterface 84 1 0
    //   75: ifle +301 -> 376
    //   78: aload 14
    //   80: ldc 27
    //   82: invokeinterface 92 2 0
    //   87: istore_1
    //   88: aload 14
    //   90: ldc 30
    //   92: invokeinterface 92 2 0
    //   97: istore_2
    //   98: aload 14
    //   100: ldc 33
    //   102: invokeinterface 92 2 0
    //   107: istore_3
    //   108: aload 14
    //   110: ldc 36
    //   112: invokeinterface 92 2 0
    //   117: istore 4
    //   119: lconst_0
    //   120: lstore 6
    //   122: aload 14
    //   124: invokeinterface 88 1 0
    //   129: pop
    //   130: aload 14
    //   132: invokeinterface 370 1 0
    //   137: ifne +239 -> 376
    //   140: aload 14
    //   142: iload_1
    //   143: invokeinterface 419 2 0
    //   148: lstore 10
    //   150: lload 6
    //   152: lstore 8
    //   154: lload 6
    //   156: lload 10
    //   158: lcmp
    //   159: ifeq +203 -> 362
    //   162: aload 17
    //   164: lload 6
    //   166: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   169: invokeinterface 424 2 0
    //   174: ifeq +1173 -> 1347
    //   177: aload 17
    //   179: lload 6
    //   181: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   184: invokeinterface 427 2 0
    //   189: checkcast 340	VACDReport/ReportInfo
    //   192: astore 15
    //   194: aload 15
    //   196: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   199: aload 15
    //   201: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   204: getfield 113	VACDReport/ReportHeader:sKey	Ljava/lang/String;
    //   207: putfield 353	VACDReport/ReportBody:sKey	Ljava/lang/String;
    //   210: aload 15
    //   212: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   215: aload 15
    //   217: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   220: getfield 208	VACDReport/ReportHeader:serverTime	J
    //   223: putfield 356	VACDReport/ReportBody:startTime	J
    //   226: aload 15
    //   228: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   231: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   234: aload 15
    //   236: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   239: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   242: invokevirtual 428	java/util/ArrayList:size	()I
    //   245: iconst_1
    //   246: isub
    //   247: invokevirtual 429	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   250: checkcast 211	VACDReport/ReportItem
    //   253: astore 16
    //   255: aload 15
    //   257: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   260: aload 16
    //   262: getfield 217	VACDReport/ReportItem:createTime	J
    //   265: aload 15
    //   267: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   270: getfield 204	VACDReport/ReportHeader:createTime	J
    //   273: lsub
    //   274: putfield 403	VACDReport/ReportBody:totalTime	J
    //   277: aload 16
    //   279: getfield 222	VACDReport/ReportItem:result	I
    //   282: ldc_w 430
    //   285: if_icmpne +24 -> 309
    //   288: aload 15
    //   290: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   293: astore 16
    //   295: aload 16
    //   297: aload 16
    //   299: getfield 403	VACDReport/ReportBody:totalTime	J
    //   302: ldc2_w 431
    //   305: lsub
    //   306: putfield 403	VACDReport/ReportBody:totalTime	J
    //   309: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   312: ifeq +1035 -> 1347
    //   315: ldc 13
    //   317: iconst_2
    //   318: new 120	java/lang/StringBuilder
    //   321: dup
    //   322: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   325: ldc_w 386
    //   328: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   331: lload 6
    //   333: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   336: ldc_w 434
    //   339: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   342: aload 15
    //   344: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   347: invokevirtual 435	VACDReport/ReportBody:toString	()Ljava/lang/String;
    //   350: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   353: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   356: invokestatic 391	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   359: goto +988 -> 1347
    //   362: aload 18
    //   364: invokevirtual 436	java/util/HashSet:size	()I
    //   367: istore 5
    //   369: iload 5
    //   371: bipush 10
    //   373: if_icmple +85 -> 458
    //   376: aload 14
    //   378: ifnull +10 -> 388
    //   381: aload 14
    //   383: invokeinterface 108 1 0
    //   388: invokestatic 277	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   391: ifeq +50 -> 441
    //   394: ldc 13
    //   396: iconst_4
    //   397: new 120	java/lang/StringBuilder
    //   400: dup
    //   401: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   404: ldc_w 438
    //   407: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   410: invokestatic 409	java/lang/System:currentTimeMillis	()J
    //   413: lload 12
    //   415: lsub
    //   416: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   419: ldc_w 440
    //   422: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   425: aload 17
    //   427: invokeinterface 441 1 0
    //   432: invokevirtual 444	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   435: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   438: invokestatic 391	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   441: aload 18
    //   443: invokevirtual 446	java/util/HashSet:isEmpty	()Z
    //   446: ifne +9 -> 455
    //   449: aload_0
    //   450: aload 18
    //   452: invokespecial 448	mej:a	(Ljava/util/HashSet;)V
    //   455: aload 17
    //   457: areturn
    //   458: aload 14
    //   460: iload_3
    //   461: invokeinterface 452 2 0
    //   466: istore 5
    //   468: aload 14
    //   470: iload_2
    //   471: invokeinterface 95 2 0
    //   476: astore 19
    //   478: aload 17
    //   480: lload 10
    //   482: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   485: invokeinterface 427 2 0
    //   490: checkcast 340	VACDReport/ReportInfo
    //   493: astore 16
    //   495: iconst_1
    //   496: iload 5
    //   498: if_icmpne +482 -> 980
    //   501: aload_0
    //   502: aload 19
    //   504: invokespecial 98	mej:a	(Ljava/lang/String;)LVACDReport/ReportHeader;
    //   507: astore 19
    //   509: aload 19
    //   511: ifnonnull +145 -> 656
    //   514: invokestatic 277	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   517: ifeq +30 -> 547
    //   520: ldc 13
    //   522: iconst_4
    //   523: new 120	java/lang/StringBuilder
    //   526: dup
    //   527: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   530: ldc_w 454
    //   533: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   536: lload 10
    //   538: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   541: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   544: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   547: aload 14
    //   549: invokeinterface 398 1 0
    //   554: pop
    //   555: lload 8
    //   557: lstore 6
    //   559: goto -429 -> 130
    //   562: astore 15
    //   564: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   567: ifeq +33 -> 600
    //   570: ldc 13
    //   572: iconst_2
    //   573: new 120	java/lang/StringBuilder
    //   576: dup
    //   577: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   580: ldc_w 456
    //   583: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   586: aload 15
    //   588: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   591: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   594: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   597: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   600: aload 14
    //   602: ifnull -214 -> 388
    //   605: aload 14
    //   607: invokeinterface 108 1 0
    //   612: goto -224 -> 388
    //   615: astore 14
    //   617: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   620: ifeq -232 -> 388
    //   623: ldc 13
    //   625: iconst_2
    //   626: new 120	java/lang/StringBuilder
    //   629: dup
    //   630: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   633: ldc_w 458
    //   636: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   639: aload 14
    //   641: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   644: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   647: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   650: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   653: goto -265 -> 388
    //   656: aload 16
    //   658: astore 15
    //   660: aload 16
    //   662: ifnonnull +38 -> 700
    //   665: new 340	VACDReport/ReportInfo
    //   668: dup
    //   669: invokespecial 341	VACDReport/ReportInfo:<init>	()V
    //   672: astore 15
    //   674: aload 17
    //   676: lload 10
    //   678: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   681: aload 15
    //   683: invokeinterface 461 3 0
    //   688: pop
    //   689: aload 18
    //   691: lload 10
    //   693: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   696: invokevirtual 462	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   699: pop
    //   700: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   703: ifeq +33 -> 736
    //   706: ldc 13
    //   708: iconst_2
    //   709: new 120	java/lang/StringBuilder
    //   712: dup
    //   713: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   716: ldc_w 464
    //   719: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   722: aload 19
    //   724: invokevirtual 465	VACDReport/ReportHeader:toString	()Ljava/lang/String;
    //   727: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   730: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   733: invokestatic 391	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   736: aload 15
    //   738: aload 19
    //   740: putfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   743: aload 15
    //   745: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   748: aload 14
    //   750: iload 4
    //   752: invokeinterface 95 2 0
    //   757: putfield 113	VACDReport/ReportHeader:sKey	Ljava/lang/String;
    //   760: aload 14
    //   762: invokeinterface 468 1 0
    //   767: ifeq -220 -> 547
    //   770: aload 17
    //   772: lload 8
    //   774: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   777: invokeinterface 427 2 0
    //   782: checkcast 340	VACDReport/ReportInfo
    //   785: astore 15
    //   787: aload 15
    //   789: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   792: aload 15
    //   794: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   797: getfield 113	VACDReport/ReportHeader:sKey	Ljava/lang/String;
    //   800: putfield 353	VACDReport/ReportBody:sKey	Ljava/lang/String;
    //   803: aload 15
    //   805: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   808: aload 15
    //   810: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   813: getfield 208	VACDReport/ReportHeader:serverTime	J
    //   816: putfield 356	VACDReport/ReportBody:startTime	J
    //   819: aload 15
    //   821: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   824: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   827: aload 15
    //   829: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   832: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   835: invokevirtual 428	java/util/ArrayList:size	()I
    //   838: iconst_1
    //   839: isub
    //   840: invokevirtual 429	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   843: checkcast 211	VACDReport/ReportItem
    //   846: astore 16
    //   848: aload 15
    //   850: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   853: aload 16
    //   855: getfield 217	VACDReport/ReportItem:createTime	J
    //   858: aload 15
    //   860: getfield 345	VACDReport/ReportInfo:header	LVACDReport/ReportHeader;
    //   863: getfield 204	VACDReport/ReportHeader:createTime	J
    //   866: lsub
    //   867: putfield 403	VACDReport/ReportBody:totalTime	J
    //   870: aload 16
    //   872: getfield 222	VACDReport/ReportItem:result	I
    //   875: ldc_w 430
    //   878: if_icmpne +24 -> 902
    //   881: aload 15
    //   883: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   886: astore 16
    //   888: aload 16
    //   890: aload 16
    //   892: getfield 403	VACDReport/ReportBody:totalTime	J
    //   895: ldc2_w 431
    //   898: lsub
    //   899: putfield 403	VACDReport/ReportBody:totalTime	J
    //   902: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   905: ifeq -358 -> 547
    //   908: ldc 13
    //   910: iconst_2
    //   911: new 120	java/lang/StringBuilder
    //   914: dup
    //   915: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   918: ldc_w 386
    //   921: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   924: lload 8
    //   926: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   929: ldc_w 434
    //   932: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   935: aload 15
    //   937: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   940: invokevirtual 435	VACDReport/ReportBody:toString	()Ljava/lang/String;
    //   943: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   946: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   949: invokestatic 391	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   952: goto -405 -> 547
    //   955: astore 16
    //   957: aload 14
    //   959: astore 15
    //   961: aload 16
    //   963: astore 14
    //   965: aload 15
    //   967: ifnull +10 -> 977
    //   970: aload 15
    //   972: invokeinterface 108 1 0
    //   977: aload 14
    //   979: athrow
    //   980: iload 5
    //   982: ifne -222 -> 760
    //   985: aload 16
    //   987: ifnonnull +39 -> 1026
    //   990: invokestatic 277	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   993: ifeq -446 -> 547
    //   996: ldc 13
    //   998: iconst_4
    //   999: new 120	java/lang/StringBuilder
    //   1002: dup
    //   1003: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   1006: ldc_w 470
    //   1009: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1012: lload 10
    //   1014: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1017: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1020: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1023: goto -476 -> 547
    //   1026: aload 16
    //   1028: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   1031: ifnonnull +32 -> 1063
    //   1034: aload 16
    //   1036: new 347	VACDReport/ReportBody
    //   1039: dup
    //   1040: invokespecial 348	VACDReport/ReportBody:<init>	()V
    //   1043: putfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   1046: aload 16
    //   1048: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   1051: new 358	java/util/ArrayList
    //   1054: dup
    //   1055: bipush 32
    //   1057: invokespecial 361	java/util/ArrayList:<init>	(I)V
    //   1060: putfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   1063: aload_0
    //   1064: aload 19
    //   1066: invokespecial 372	mej:a	(Ljava/lang/String;)LVACDReport/ReportItem;
    //   1069: astore 15
    //   1071: aload 15
    //   1073: ifnonnull +39 -> 1112
    //   1076: invokestatic 277	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   1079: ifeq -532 -> 547
    //   1082: ldc 13
    //   1084: iconst_4
    //   1085: new 120	java/lang/StringBuilder
    //   1088: dup
    //   1089: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   1092: ldc_w 472
    //   1095: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1098: aload 19
    //   1100: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1103: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1106: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1109: goto -562 -> 547
    //   1112: aload 16
    //   1114: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   1117: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   1120: invokevirtual 428	java/util/ArrayList:size	()I
    //   1123: istore 5
    //   1125: iload 5
    //   1127: ifle +103 -> 1230
    //   1130: aload 16
    //   1132: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   1135: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   1138: iload 5
    //   1140: iconst_1
    //   1141: isub
    //   1142: invokevirtual 429	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   1145: checkcast 211	VACDReport/ReportItem
    //   1148: astore 19
    //   1150: aload 15
    //   1152: aload 15
    //   1154: getfield 217	VACDReport/ReportItem:createTime	J
    //   1157: aload 19
    //   1159: getfield 217	VACDReport/ReportItem:createTime	J
    //   1162: lsub
    //   1163: putfield 375	VACDReport/ReportItem:costTime	J
    //   1166: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1169: ifeq +44 -> 1213
    //   1172: ldc 13
    //   1174: iconst_2
    //   1175: new 120	java/lang/StringBuilder
    //   1178: dup
    //   1179: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   1182: ldc_w 386
    //   1185: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1188: lload 10
    //   1190: invokevirtual 282	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1193: ldc_w 388
    //   1196: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1199: aload 15
    //   1201: invokevirtual 389	VACDReport/ReportItem:toString	()Ljava/lang/String;
    //   1204: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1207: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1210: invokestatic 391	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1213: aload 16
    //   1215: getfield 352	VACDReport/ReportInfo:body	LVACDReport/ReportBody;
    //   1218: getfield 365	VACDReport/ReportBody:reportItems	Ljava/util/ArrayList;
    //   1221: aload 15
    //   1223: invokevirtual 473	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   1226: pop
    //   1227: goto -467 -> 760
    //   1230: aload 15
    //   1232: lconst_0
    //   1233: putfield 375	VACDReport/ReportItem:costTime	J
    //   1236: goto -70 -> 1166
    //   1239: astore 14
    //   1241: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1244: ifeq -856 -> 388
    //   1247: ldc 13
    //   1249: iconst_2
    //   1250: new 120	java/lang/StringBuilder
    //   1253: dup
    //   1254: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   1257: ldc_w 458
    //   1260: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1263: aload 14
    //   1265: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   1268: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1271: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1274: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1277: goto -889 -> 388
    //   1280: astore 15
    //   1282: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1285: ifeq -308 -> 977
    //   1288: ldc 13
    //   1290: iconst_2
    //   1291: new 120	java/lang/StringBuilder
    //   1294: dup
    //   1295: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   1298: ldc_w 458
    //   1301: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1304: aload 15
    //   1306: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   1309: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1312: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1315: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1318: goto -341 -> 977
    //   1321: astore 14
    //   1323: aconst_null
    //   1324: astore 15
    //   1326: goto -361 -> 965
    //   1329: astore 16
    //   1331: aload 14
    //   1333: astore 15
    //   1335: aload 16
    //   1337: astore 14
    //   1339: goto -374 -> 965
    //   1342: astore 15
    //   1344: goto -780 -> 564
    //   1347: lload 10
    //   1349: lstore 8
    //   1351: goto -989 -> 362
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1354	0	this	mej
    //   87	56	1	k	int
    //   97	374	2	m	int
    //   107	354	3	n	int
    //   117	634	4	i1	int
    //   367	775	5	i2	int
    //   120	438	6	l1	long
    //   152	1198	8	l2	long
    //   148	1200	10	l3	long
    //   3	411	12	l4	long
    //   28	578	14	localObject1	Object
    //   615	343	14	localException1	Exception
    //   963	15	14	localObject2	Object
    //   1239	25	14	localException2	Exception
    //   1321	11	14	localObject3	Object
    //   1337	1	14	localObject4	Object
    //   57	286	15	localObject5	Object
    //   562	25	15	localException3	Exception
    //   658	573	15	localObject6	Object
    //   1280	25	15	localException4	Exception
    //   1324	10	15	localObject7	Object
    //   1342	1	15	localException5	Exception
    //   253	638	16	localObject8	Object
    //   955	259	16	localObject9	Object
    //   1329	7	16	localObject10	Object
    //   14	757	17	localHashMap	java.util.HashMap
    //   25	665	18	localHashSet	java.util.HashSet
    //   476	682	19	localObject11	Object
    // Exception table:
    //   from	to	target	type
    //   68	119	562	java/lang/Exception
    //   122	130	562	java/lang/Exception
    //   130	150	562	java/lang/Exception
    //   162	309	562	java/lang/Exception
    //   309	359	562	java/lang/Exception
    //   362	369	562	java/lang/Exception
    //   458	495	562	java/lang/Exception
    //   501	509	562	java/lang/Exception
    //   514	547	562	java/lang/Exception
    //   547	555	562	java/lang/Exception
    //   665	700	562	java/lang/Exception
    //   700	736	562	java/lang/Exception
    //   736	760	562	java/lang/Exception
    //   760	902	562	java/lang/Exception
    //   902	952	562	java/lang/Exception
    //   990	1023	562	java/lang/Exception
    //   1026	1063	562	java/lang/Exception
    //   1063	1071	562	java/lang/Exception
    //   1076	1109	562	java/lang/Exception
    //   1112	1125	562	java/lang/Exception
    //   1130	1166	562	java/lang/Exception
    //   1166	1213	562	java/lang/Exception
    //   1213	1227	562	java/lang/Exception
    //   1230	1236	562	java/lang/Exception
    //   605	612	615	java/lang/Exception
    //   68	119	955	finally
    //   122	130	955	finally
    //   130	150	955	finally
    //   162	309	955	finally
    //   309	359	955	finally
    //   362	369	955	finally
    //   458	495	955	finally
    //   501	509	955	finally
    //   514	547	955	finally
    //   547	555	955	finally
    //   665	700	955	finally
    //   700	736	955	finally
    //   736	760	955	finally
    //   760	902	955	finally
    //   902	952	955	finally
    //   990	1023	955	finally
    //   1026	1063	955	finally
    //   1063	1071	955	finally
    //   1076	1109	955	finally
    //   1112	1125	955	finally
    //   1130	1166	955	finally
    //   1166	1213	955	finally
    //   1213	1227	955	finally
    //   1230	1236	955	finally
    //   381	388	1239	java/lang/Exception
    //   970	977	1280	java/lang/Exception
    //   30	59	1321	finally
    //   564	600	1329	finally
    //   30	59	1342	java/lang/Exception
  }
  
  public void a(long paramLong)
  {
    if (paramLong <= 0L) {
      return;
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("seqno", Long.valueOf(paramLong));
    a().insertOrThrow("ReportRecord", null, localContentValues);
  }
  
  public void a(long paramLong, ReportItem paramReportItem)
  {
    if (paramReportItem == null) {}
    do
    {
      return;
      try
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("seqno", Long.valueOf(paramLong));
        localContentValues.put("content", a(paramReportItem));
        localContentValues.put("createTime", Long.valueOf(createTime));
        localContentValues.put("type", Integer.valueOf(0));
        a().insertOrThrow("ReportItem", null, localContentValues);
        return;
      }
      catch (Exception paramReportItem) {}
    } while (!QLog.isColorLevel());
    QLog.e("VACDReport", 2, "saveReportItem exception:  " + paramReportItem.toString());
  }
  
  public void a(long paramLong, String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    do
    {
      return;
      try
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("skey", paramString);
        a().update("ReportItem", localContentValues, " seqno= ? AND type = ? ", new String[] { String.valueOf(paramLong), String.valueOf(1) });
        return;
      }
      catch (Exception paramString) {}
    } while (!QLog.isColorLevel());
    QLog.e("VACDReport", 2, "updateSkey exception:  " + paramString.toString());
  }
  
  /* Error */
  public void a(long paramLong, List paramList)
  {
    // Byte code:
    //   0: aload_3
    //   1: ifnull +12 -> 13
    //   4: aload_3
    //   5: invokeinterface 501 1 0
    //   10: ifeq +4 -> 14
    //   13: return
    //   14: aload_0
    //   15: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   18: invokevirtual 285	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   21: new 287	android/content/ContentValues
    //   24: dup
    //   25: invokespecial 288	android/content/ContentValues:<init>	()V
    //   28: astore 4
    //   30: aload_3
    //   31: invokeinterface 502 1 0
    //   36: astore_3
    //   37: aload_3
    //   38: invokeinterface 299 1 0
    //   43: ifeq +134 -> 177
    //   46: aload_3
    //   47: invokeinterface 303 1 0
    //   52: checkcast 211	VACDReport/ReportItem
    //   55: astore 5
    //   57: aload 5
    //   59: ifnull -22 -> 37
    //   62: aload 4
    //   64: invokevirtual 308	android/content/ContentValues:clear	()V
    //   67: aload 4
    //   69: ldc 27
    //   71: lload_1
    //   72: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   75: invokevirtual 314	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   78: aload 4
    //   80: ldc 30
    //   82: aload_0
    //   83: aload 5
    //   85: invokespecial 481	mej:a	(LVACDReport/ReportItem;)Ljava/lang/String;
    //   88: invokevirtual 484	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   91: aload 4
    //   93: ldc 24
    //   95: aload 5
    //   97: getfield 217	VACDReport/ReportItem:createTime	J
    //   100: invokestatic 311	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   103: invokevirtual 314	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   106: aload 4
    //   108: ldc 33
    //   110: iconst_0
    //   111: invokestatic 489	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   114: invokevirtual 492	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   117: aload_0
    //   118: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   121: ldc 21
    //   123: aconst_null
    //   124: aload 4
    //   126: invokevirtual 478	android/database/sqlite/SQLiteDatabase:insertOrThrow	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   129: pop2
    //   130: goto -93 -> 37
    //   133: astore_3
    //   134: invokestatic 118	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   137: ifeq +32 -> 169
    //   140: ldc 13
    //   142: iconst_4
    //   143: new 120	java/lang/StringBuilder
    //   146: dup
    //   147: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   150: ldc_w 504
    //   153: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: aload_3
    //   157: invokevirtual 132	java/lang/Exception:toString	()Ljava/lang/String;
    //   160: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   163: invokevirtual 133	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   166: invokestatic 136	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   169: aload_0
    //   170: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   173: invokevirtual 326	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   176: return
    //   177: aload_0
    //   178: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   181: invokevirtual 329	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   184: aload_0
    //   185: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   188: invokevirtual 326	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   191: return
    //   192: astore_3
    //   193: aload_0
    //   194: invokespecial 61	mej:a	()Landroid/database/sqlite/SQLiteDatabase;
    //   197: invokevirtual 326	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   200: aload_3
    //   201: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	202	0	this	mej
    //   0	202	1	paramLong	long
    //   0	202	3	paramList	List
    //   28	97	4	localContentValues	ContentValues
    //   55	41	5	localReportItem	ReportItem
    // Exception table:
    //   from	to	target	type
    //   14	37	133	java/lang/Exception
    //   37	57	133	java/lang/Exception
    //   62	130	133	java/lang/Exception
    //   177	184	133	java/lang/Exception
    //   14	37	192	finally
    //   37	57	192	finally
    //   62	130	192	finally
    //   134	169	192	finally
    //   177	184	192	finally
  }
  
  public void a(String paramString, ReportHeader paramReportHeader)
  {
    if (paramReportHeader == null) {}
    do
    {
      return;
      try
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("seqno", Long.valueOf(seqno));
        localContentValues.put("content", a(paramReportHeader));
        localContentValues.put("type", Integer.valueOf(1));
        if (!TextUtils.isEmpty(paramString)) {
          localContentValues.put("skey", paramString);
        }
        localContentValues.put("createTime", Integer.valueOf(0));
        a().insertOrThrow("ReportItem", null, localContentValues);
        return;
      }
      catch (Exception paramString) {}
    } while (!QLog.isColorLevel());
    QLog.e("VACDReport", 2, "saveReportHeader exception:  " + paramString.toString());
  }
  
  public void a(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return;
    }
    a().beginTransaction();
    try
    {
      int m = paramList.size();
      StringBuilder localStringBuilder = new StringBuilder(m * 14);
      int k = 0;
      while (k < m)
      {
        long l = ((Long)paramList.get(k)).longValue();
        localStringBuilder.append(l);
        if (k < m - 1) {
          localStringBuilder.append(",");
        }
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(l);
        a().delete("ReportItem", " seqno=? ", arrayOfString);
        a().delete("ReportRecord", " seqno=? ", arrayOfString);
        k += 1;
      }
      if (QLog.isColorLevel()) {
        QLog.d("VACDReport", 2, "batchDeleteReportInfos seqno array= " + localStringBuilder.toString());
      }
      a().setTransactionSuccessful();
      return;
    }
    catch (Exception paramList)
    {
      if (QLog.isColorLevel()) {
        QLog.e("VACDReport", 2, "batchDeleteReportInfos exception: " + paramList.toString());
      }
      return;
    }
    finally
    {
      a().endTransaction();
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    b(paramSQLiteDatabase);
    a(paramSQLiteDatabase);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (paramInt1 < paramInt2)
    {
      switch (paramInt1)
      {
      }
      for (;;)
      {
        paramInt1 += 1;
        break;
        try
        {
          paramSQLiteDatabase.execSQL("ALTER TABLE VACDReport ADD sendTime INTEGER(16) DEFAULT 0");
        }
        catch (Exception localException1) {}
        continue;
        try
        {
          paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS VACDReport");
          b(paramSQLiteDatabase);
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("VACDReport", 2, "VACDReport table is not exists");
            }
          }
        }
        try
        {
          paramSQLiteDatabase.execSQL("ALTER TABLE ReportItem ADD COLUMN status INTEGER DEFAULT 1");
        }
        catch (Exception localException3) {}
        if (QLog.isColorLevel())
        {
          QLog.e("VACDReport", 2, " TABLE ReportItem add column status is exception=" + localException3.toString());
          continue;
          try
          {
            paramSQLiteDatabase.execSQL("ALTER TABLE ReportItem ADD COLUMN send_time INTEGER(16) DEFAULT 9");
          }
          catch (Exception localException4) {}
          if (QLog.isColorLevel())
          {
            QLog.e("VACDReport", 2, " TABLE ReportItem add column send_time is exception=" + localException4.toString());
            continue;
            try
            {
              a(paramSQLiteDatabase);
            }
            catch (Exception localException5) {}
            if (QLog.isColorLevel()) {
              QLog.e("VACDReport", 2, "createReportRecordTable exception=" + localException5.toString());
            }
          }
        }
      }
    }
  }
}
