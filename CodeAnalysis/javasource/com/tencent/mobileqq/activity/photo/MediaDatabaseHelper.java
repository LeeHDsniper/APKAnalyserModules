package com.tencent.mobileqq.activity.photo;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

public class MediaDatabaseHelper
  extends SQLiteOpenHelper
{
  private static MediaDatabaseHelper jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper = null;
  private SQLiteDatabase jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase;
  private String jdField_a_of_type_JavaLangString = "MediaDatabaseHelper";
  private AtomicInteger jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private MediaDatabaseHelper(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt)
  {
    super(paramContext, paramString, paramCursorFactory, paramInt);
  }
  
  public static MediaDatabaseHelper a(Context paramContext)
  {
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper == null) {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper = new MediaDatabaseHelper(paramContext, "media_scanner_database", null, 2);
      }
      paramContext = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper;
      return paramContext;
    }
    finally {}
  }
  
  private void a(SQLiteDatabase paramSQLiteDatabase)
  {
    try
    {
      paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS content_table (id            integer PRIMARY KEY autoincrement,name         varchar (128),path           varchar (512),filesize       integer,modifieddate   integer,folderpath           varchar (512),md5           varchar(128),duration      integer,mimetype  varchar (50));");
      paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS folder_table (id            integer PRIMARY KEY autoincrement,folderpath         varchar (512),modifieddate   integer);");
      return;
    }
    catch (Exception paramSQLiteDatabase)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d(jdField_a_of_type_JavaLangString, 2, "createDatabase error=" + paramSQLiteDatabase.getMessage());
    }
  }
  
  /* Error */
  public int a()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   4: ldc 86
    //   6: iconst_1
    //   7: anewarray 88	java/lang/String
    //   10: dup
    //   11: iconst_0
    //   12: ldc 90
    //   14: aastore
    //   15: aconst_null
    //   16: aconst_null
    //   17: aconst_null
    //   18: aconst_null
    //   19: aconst_null
    //   20: invokevirtual 94	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   23: astore_3
    //   24: aload_3
    //   25: astore_2
    //   26: aload_3
    //   27: invokeinterface 99 1 0
    //   32: istore_1
    //   33: aload_3
    //   34: ifnull +9 -> 43
    //   37: aload_3
    //   38: invokeinterface 102 1 0
    //   43: aload_0
    //   44: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   47: iload_1
    //   48: ireturn
    //   49: astore 4
    //   51: aconst_null
    //   52: astore_3
    //   53: aload_3
    //   54: astore_2
    //   55: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   58: ifeq +36 -> 94
    //   61: aload_3
    //   62: astore_2
    //   63: aload_0
    //   64: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   67: iconst_2
    //   68: new 60	java/lang/StringBuilder
    //   71: dup
    //   72: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   75: ldc 106
    //   77: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: aload 4
    //   82: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   85: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   88: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   91: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   94: aload_3
    //   95: ifnull +9 -> 104
    //   98: aload_3
    //   99: invokeinterface 102 1 0
    //   104: aload_0
    //   105: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   108: iconst_0
    //   109: ireturn
    //   110: astore_3
    //   111: aconst_null
    //   112: astore_2
    //   113: aload_2
    //   114: ifnull +9 -> 123
    //   117: aload_2
    //   118: invokeinterface 102 1 0
    //   123: aload_0
    //   124: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   127: aload_3
    //   128: athrow
    //   129: astore_3
    //   130: goto -17 -> 113
    //   133: astore 4
    //   135: goto -82 -> 53
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	138	0	this	MediaDatabaseHelper
    //   32	16	1	i	int
    //   25	93	2	localCursor1	android.database.Cursor
    //   23	76	3	localCursor2	android.database.Cursor
    //   110	18	3	localObject1	Object
    //   129	1	3	localObject2	Object
    //   49	32	4	localException1	Exception
    //   133	1	4	localException2	Exception
    // Exception table:
    //   from	to	target	type
    //   0	24	49	java/lang/Exception
    //   0	24	110	finally
    //   26	33	129	finally
    //   55	61	129	finally
    //   63	94	129	finally
    //   26	33	133	java/lang/Exception
  }
  
  /* Error */
  public MediaScannerFolderInfo a(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   4: ldc 109
    //   6: getstatic 115	com/tencent/mobileqq/activity/photo/MediaDBValues:b	[Ljava/lang/String;
    //   9: ldc 117
    //   11: iconst_1
    //   12: anewarray 88	java/lang/String
    //   15: dup
    //   16: iconst_0
    //   17: aload_1
    //   18: aastore
    //   19: aconst_null
    //   20: aconst_null
    //   21: aconst_null
    //   22: invokevirtual 94	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   25: astore_1
    //   26: aload_1
    //   27: invokeinterface 99 1 0
    //   32: ifle +182 -> 214
    //   35: aload_1
    //   36: invokeinterface 120 1 0
    //   41: pop
    //   42: new 122	com/tencent/mobileqq/activity/photo/MediaScannerFolderInfo
    //   45: dup
    //   46: invokespecial 123	com/tencent/mobileqq/activity/photo/MediaScannerFolderInfo:<init>	()V
    //   49: astore_2
    //   50: aload_2
    //   51: aload_1
    //   52: aload_1
    //   53: ldc 90
    //   55: invokeinterface 127 2 0
    //   60: invokeinterface 131 2 0
    //   65: putfield 134	com/tencent/mobileqq/activity/photo/MediaScannerFolderInfo:jdField_a_of_type_Int	I
    //   68: aload_2
    //   69: aload_1
    //   70: aload_1
    //   71: ldc -120
    //   73: invokeinterface 127 2 0
    //   78: invokeinterface 140 2 0
    //   83: putfield 141	com/tencent/mobileqq/activity/photo/MediaScannerFolderInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   86: aload_2
    //   87: aload_1
    //   88: aload_1
    //   89: ldc -113
    //   91: invokeinterface 127 2 0
    //   96: invokeinterface 147 2 0
    //   101: putfield 150	com/tencent/mobileqq/activity/photo/MediaScannerFolderInfo:jdField_a_of_type_Long	J
    //   104: aload_1
    //   105: ifnull +9 -> 114
    //   108: aload_1
    //   109: invokeinterface 102 1 0
    //   114: aload_0
    //   115: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   118: aload_2
    //   119: areturn
    //   120: astore_3
    //   121: aconst_null
    //   122: astore_1
    //   123: aconst_null
    //   124: astore_2
    //   125: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   128: ifeq +33 -> 161
    //   131: aload_0
    //   132: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   135: iconst_2
    //   136: new 60	java/lang/StringBuilder
    //   139: dup
    //   140: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   143: ldc -104
    //   145: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   148: aload_3
    //   149: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   152: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   155: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   158: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   161: aload_1
    //   162: ifnull +9 -> 171
    //   165: aload_1
    //   166: invokeinterface 102 1 0
    //   171: aload_0
    //   172: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   175: aload_2
    //   176: areturn
    //   177: astore_2
    //   178: aconst_null
    //   179: astore_1
    //   180: aload_1
    //   181: ifnull +9 -> 190
    //   184: aload_1
    //   185: invokeinterface 102 1 0
    //   190: aload_0
    //   191: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   194: aload_2
    //   195: athrow
    //   196: astore_2
    //   197: goto -17 -> 180
    //   200: astore_2
    //   201: goto -21 -> 180
    //   204: astore_3
    //   205: aconst_null
    //   206: astore_2
    //   207: goto -82 -> 125
    //   210: astore_3
    //   211: goto -86 -> 125
    //   214: aconst_null
    //   215: astore_2
    //   216: goto -112 -> 104
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	219	0	this	MediaDatabaseHelper
    //   0	219	1	paramString	String
    //   49	127	2	localMediaScannerFolderInfo	MediaScannerFolderInfo
    //   177	18	2	localObject1	Object
    //   196	1	2	localObject2	Object
    //   200	1	2	localObject3	Object
    //   206	10	2	localObject4	Object
    //   120	29	3	localException1	Exception
    //   204	1	3	localException2	Exception
    //   210	1	3	localException3	Exception
    // Exception table:
    //   from	to	target	type
    //   0	26	120	java/lang/Exception
    //   0	26	177	finally
    //   26	50	196	finally
    //   50	104	196	finally
    //   125	161	200	finally
    //   26	50	204	java/lang/Exception
    //   50	104	210	java/lang/Exception
  }
  
  /* Error */
  public java.util.ArrayList a(String paramString)
  {
    // Byte code:
    //   0: new 155	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 156	java/util/ArrayList:<init>	()V
    //   7: astore 4
    //   9: aload_0
    //   10: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   13: ldc 86
    //   15: getstatic 158	com/tencent/mobileqq/activity/photo/MediaDBValues:a	[Ljava/lang/String;
    //   18: ldc -96
    //   20: iconst_1
    //   21: anewarray 88	java/lang/String
    //   24: dup
    //   25: iconst_0
    //   26: ldc -94
    //   28: aastore
    //   29: aconst_null
    //   30: aconst_null
    //   31: ldc -92
    //   33: aload_1
    //   34: invokevirtual 167	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   37: astore_2
    //   38: aload_2
    //   39: astore_1
    //   40: aload_2
    //   41: invokeinterface 120 1 0
    //   46: ifeq +263 -> 309
    //   49: aload_2
    //   50: astore_1
    //   51: new 169	com/tencent/mobileqq/activity/photo/MediaScannerInfo
    //   54: dup
    //   55: invokespecial 170	com/tencent/mobileqq/activity/photo/MediaScannerInfo:<init>	()V
    //   58: astore_3
    //   59: aload_2
    //   60: astore_1
    //   61: aload_3
    //   62: aload_2
    //   63: aload_2
    //   64: ldc 90
    //   66: invokeinterface 127 2 0
    //   71: invokeinterface 131 2 0
    //   76: putfield 171	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_Int	I
    //   79: aload_2
    //   80: astore_1
    //   81: aload_3
    //   82: aload_2
    //   83: aload_2
    //   84: ldc -83
    //   86: invokeinterface 127 2 0
    //   91: invokeinterface 140 2 0
    //   96: putfield 174	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   99: aload_2
    //   100: astore_1
    //   101: aload_3
    //   102: aload_2
    //   103: aload_2
    //   104: ldc -80
    //   106: invokeinterface 127 2 0
    //   111: invokeinterface 140 2 0
    //   116: putfield 179	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   119: aload_2
    //   120: astore_1
    //   121: aload_3
    //   122: aload_2
    //   123: aload_2
    //   124: ldc -75
    //   126: invokeinterface 127 2 0
    //   131: invokeinterface 147 2 0
    //   136: putfield 182	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_Long	J
    //   139: aload_2
    //   140: astore_1
    //   141: aload_3
    //   142: aload_2
    //   143: aload_2
    //   144: ldc -113
    //   146: invokeinterface 127 2 0
    //   151: invokeinterface 147 2 0
    //   156: putfield 184	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_b_of_type_Long	J
    //   159: aload_2
    //   160: astore_1
    //   161: aload_3
    //   162: aload_2
    //   163: aload_2
    //   164: ldc -70
    //   166: invokeinterface 127 2 0
    //   171: invokeinterface 147 2 0
    //   176: putfield 188	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_c_of_type_Long	J
    //   179: aload_2
    //   180: astore_1
    //   181: aload_3
    //   182: aload_2
    //   183: aload_2
    //   184: ldc -66
    //   186: invokeinterface 127 2 0
    //   191: invokeinterface 140 2 0
    //   196: putfield 192	com/tencent/mobileqq/activity/photo/MediaScannerInfo:d	Ljava/lang/String;
    //   199: aload_2
    //   200: astore_1
    //   201: aload_3
    //   202: aload_2
    //   203: aload_2
    //   204: ldc -120
    //   206: invokeinterface 127 2 0
    //   211: invokeinterface 140 2 0
    //   216: putfield 194	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   219: aload_2
    //   220: astore_1
    //   221: aload_3
    //   222: aload_2
    //   223: aload_2
    //   224: ldc -60
    //   226: invokeinterface 127 2 0
    //   231: invokeinterface 140 2 0
    //   236: putfield 199	com/tencent/mobileqq/activity/photo/MediaScannerInfo:e	Ljava/lang/String;
    //   239: aload_2
    //   240: astore_1
    //   241: aload 4
    //   243: aload_3
    //   244: invokevirtual 203	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   247: pop
    //   248: goto -210 -> 38
    //   251: astore_3
    //   252: aload_2
    //   253: astore_1
    //   254: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   257: ifeq +35 -> 292
    //   260: aload_2
    //   261: astore_1
    //   262: aload_0
    //   263: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   266: iconst_2
    //   267: new 60	java/lang/StringBuilder
    //   270: dup
    //   271: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   274: ldc -51
    //   276: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   279: aload_3
    //   280: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   283: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   286: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   289: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   292: aload_2
    //   293: ifnull +9 -> 302
    //   296: aload_2
    //   297: invokeinterface 102 1 0
    //   302: aload_0
    //   303: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   306: aload 4
    //   308: areturn
    //   309: aload_2
    //   310: ifnull +9 -> 319
    //   313: aload_2
    //   314: invokeinterface 102 1 0
    //   319: aload_0
    //   320: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   323: aload 4
    //   325: areturn
    //   326: astore_2
    //   327: aconst_null
    //   328: astore_1
    //   329: aload_1
    //   330: ifnull +9 -> 339
    //   333: aload_1
    //   334: invokeinterface 102 1 0
    //   339: aload_0
    //   340: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   343: aload_2
    //   344: athrow
    //   345: astore_2
    //   346: goto -17 -> 329
    //   349: astore_3
    //   350: aconst_null
    //   351: astore_2
    //   352: goto -100 -> 252
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	355	0	this	MediaDatabaseHelper
    //   0	355	1	paramString	String
    //   37	277	2	localCursor	android.database.Cursor
    //   326	18	2	localObject1	Object
    //   345	1	2	localObject2	Object
    //   351	1	2	localObject3	Object
    //   58	186	3	localMediaScannerInfo	MediaScannerInfo
    //   251	29	3	localException1	Exception
    //   349	1	3	localException2	Exception
    //   7	317	4	localArrayList	java.util.ArrayList
    // Exception table:
    //   from	to	target	type
    //   40	49	251	java/lang/Exception
    //   51	59	251	java/lang/Exception
    //   61	79	251	java/lang/Exception
    //   81	99	251	java/lang/Exception
    //   101	119	251	java/lang/Exception
    //   121	139	251	java/lang/Exception
    //   141	159	251	java/lang/Exception
    //   161	179	251	java/lang/Exception
    //   181	199	251	java/lang/Exception
    //   201	219	251	java/lang/Exception
    //   221	239	251	java/lang/Exception
    //   241	248	251	java/lang/Exception
    //   9	38	326	finally
    //   40	49	345	finally
    //   51	59	345	finally
    //   61	79	345	finally
    //   81	99	345	finally
    //   101	119	345	finally
    //   121	139	345	finally
    //   141	159	345	finally
    //   161	179	345	finally
    //   181	199	345	finally
    //   201	219	345	finally
    //   221	239	345	finally
    //   241	248	345	finally
    //   254	260	345	finally
    //   262	292	345	finally
    //   9	38	349	java/lang/Exception
  }
  
  /* Error */
  public HashSet a()
  {
    // Byte code:
    //   0: new 208	java/util/HashSet
    //   3: dup
    //   4: invokespecial 209	java/util/HashSet:<init>	()V
    //   7: astore 4
    //   9: aload_0
    //   10: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   13: ldc 86
    //   15: iconst_1
    //   16: anewarray 88	java/lang/String
    //   19: dup
    //   20: iconst_0
    //   21: ldc -80
    //   23: aastore
    //   24: aconst_null
    //   25: aconst_null
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: invokevirtual 94	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore_2
    //   33: aload_2
    //   34: astore_1
    //   35: aload_2
    //   36: invokeinterface 120 1 0
    //   41: ifeq +86 -> 127
    //   44: aload_2
    //   45: astore_1
    //   46: aload 4
    //   48: aload_2
    //   49: aload_2
    //   50: ldc -80
    //   52: invokeinterface 127 2 0
    //   57: invokeinterface 140 2 0
    //   62: invokevirtual 210	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   65: pop
    //   66: goto -33 -> 33
    //   69: astore_3
    //   70: aload_2
    //   71: astore_1
    //   72: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   75: ifeq +35 -> 110
    //   78: aload_2
    //   79: astore_1
    //   80: aload_0
    //   81: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   84: iconst_2
    //   85: new 60	java/lang/StringBuilder
    //   88: dup
    //   89: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   92: ldc -44
    //   94: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: aload_3
    //   98: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   101: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   107: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   110: aload_2
    //   111: ifnull +9 -> 120
    //   114: aload_2
    //   115: invokeinterface 102 1 0
    //   120: aload_0
    //   121: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   124: aload 4
    //   126: areturn
    //   127: aload_2
    //   128: ifnull +9 -> 137
    //   131: aload_2
    //   132: invokeinterface 102 1 0
    //   137: aload_0
    //   138: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   141: aload 4
    //   143: areturn
    //   144: astore_2
    //   145: aconst_null
    //   146: astore_1
    //   147: aload_1
    //   148: ifnull +9 -> 157
    //   151: aload_1
    //   152: invokeinterface 102 1 0
    //   157: aload_0
    //   158: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   161: aload_2
    //   162: athrow
    //   163: astore_2
    //   164: goto -17 -> 147
    //   167: astore_3
    //   168: aconst_null
    //   169: astore_2
    //   170: goto -100 -> 70
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	173	0	this	MediaDatabaseHelper
    //   34	118	1	localCursor1	android.database.Cursor
    //   32	100	2	localCursor2	android.database.Cursor
    //   144	18	2	localObject1	Object
    //   163	1	2	localObject2	Object
    //   169	1	2	localObject3	Object
    //   69	29	3	localException1	Exception
    //   167	1	3	localException2	Exception
    //   7	135	4	localHashSet	HashSet
    // Exception table:
    //   from	to	target	type
    //   35	44	69	java/lang/Exception
    //   46	66	69	java/lang/Exception
    //   9	33	144	finally
    //   35	44	163	finally
    //   46	66	163	finally
    //   72	78	163	finally
    //   80	110	163	finally
    //   9	33	167	java/lang/Exception
  }
  
  /* Error */
  public HashSet a(String paramString)
  {
    // Byte code:
    //   0: new 208	java/util/HashSet
    //   3: dup
    //   4: invokespecial 209	java/util/HashSet:<init>	()V
    //   7: astore 4
    //   9: aload_0
    //   10: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   13: ldc 86
    //   15: iconst_1
    //   16: anewarray 88	java/lang/String
    //   19: dup
    //   20: iconst_0
    //   21: ldc -80
    //   23: aastore
    //   24: ldc 117
    //   26: iconst_1
    //   27: anewarray 88	java/lang/String
    //   30: dup
    //   31: iconst_0
    //   32: aload_1
    //   33: aastore
    //   34: aconst_null
    //   35: aconst_null
    //   36: aconst_null
    //   37: invokevirtual 94	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   40: astore_2
    //   41: aload_2
    //   42: astore_1
    //   43: aload_2
    //   44: invokeinterface 120 1 0
    //   49: ifeq +86 -> 135
    //   52: aload_2
    //   53: astore_1
    //   54: aload 4
    //   56: aload_2
    //   57: aload_2
    //   58: ldc -80
    //   60: invokeinterface 127 2 0
    //   65: invokeinterface 140 2 0
    //   70: invokevirtual 210	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   73: pop
    //   74: goto -33 -> 41
    //   77: astore_3
    //   78: aload_2
    //   79: astore_1
    //   80: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   83: ifeq +35 -> 118
    //   86: aload_2
    //   87: astore_1
    //   88: aload_0
    //   89: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   92: iconst_2
    //   93: new 60	java/lang/StringBuilder
    //   96: dup
    //   97: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   100: ldc -41
    //   102: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: aload_3
    //   106: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   109: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   112: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   115: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   118: aload_2
    //   119: ifnull +9 -> 128
    //   122: aload_2
    //   123: invokeinterface 102 1 0
    //   128: aload_0
    //   129: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   132: aload 4
    //   134: areturn
    //   135: aload_2
    //   136: ifnull +9 -> 145
    //   139: aload_2
    //   140: invokeinterface 102 1 0
    //   145: aload_0
    //   146: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   149: aload 4
    //   151: areturn
    //   152: astore_2
    //   153: aconst_null
    //   154: astore_1
    //   155: aload_1
    //   156: ifnull +9 -> 165
    //   159: aload_1
    //   160: invokeinterface 102 1 0
    //   165: aload_0
    //   166: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   169: aload_2
    //   170: athrow
    //   171: astore_2
    //   172: goto -17 -> 155
    //   175: astore_3
    //   176: aconst_null
    //   177: astore_2
    //   178: goto -100 -> 78
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	181	0	this	MediaDatabaseHelper
    //   0	181	1	paramString	String
    //   40	100	2	localCursor	android.database.Cursor
    //   152	18	2	localObject1	Object
    //   171	1	2	localObject2	Object
    //   177	1	2	localObject3	Object
    //   77	29	3	localException1	Exception
    //   175	1	3	localException2	Exception
    //   7	143	4	localHashSet	HashSet
    // Exception table:
    //   from	to	target	type
    //   43	52	77	java/lang/Exception
    //   54	74	77	java/lang/Exception
    //   9	41	152	finally
    //   43	52	171	finally
    //   54	74	171	finally
    //   80	86	171	finally
    //   88	118	171	finally
    //   9	41	175	java/lang/Exception
  }
  
  public void a()
  {
    try
    {
      if ((jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.decrementAndGet() == 0) && (jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase != null)) {
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.close();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void a(MediaScannerFolderInfo paramMediaScannerFolderInfo)
  {
    if (paramMediaScannerFolderInfo == null) {
      return;
    }
    try
    {
      SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("modifieddate", Long.valueOf(jdField_a_of_type_Long));
      localSQLiteDatabase.update("folder_table", localContentValues, "folderpath=?", new String[] { jdField_a_of_type_JavaLangString });
      return;
    }
    catch (Exception paramMediaScannerFolderInfo)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "updateMediaScnnerFolderInfo() ERROR Exception:" + paramMediaScannerFolderInfo.getMessage());
      }
      return;
    }
    finally
    {
      a();
    }
  }
  
  public void a(MediaScannerInfo paramMediaScannerInfo)
  {
    if (paramMediaScannerInfo == null) {
      return;
    }
    try
    {
      SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("name", jdField_a_of_type_JavaLangString);
      localContentValues.put("path", jdField_c_of_type_JavaLangString);
      localContentValues.put("filesize", Long.valueOf(jdField_a_of_type_Long));
      localContentValues.put("modifieddate", Long.valueOf(jdField_b_of_type_Long));
      localContentValues.put("duration", Long.valueOf(jdField_c_of_type_Long));
      localContentValues.put("mimetype", d);
      localContentValues.put("folderpath", jdField_b_of_type_JavaLangString);
      localContentValues.put("md5", e);
      localSQLiteDatabase.insert("content_table", null, localContentValues);
      return;
    }
    catch (Exception paramMediaScannerInfo)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "insertMediaScannerInfoByList() ERROR Exception:" + paramMediaScannerInfo.getMessage());
      }
      return;
    }
    finally
    {
      a();
    }
  }
  
  public void a(String paramString, long paramLong)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("duration", Long.valueOf(paramLong));
      localSQLiteDatabase.update("content_table", localContentValues, "path=?", new String[] { paramString });
      return;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "updateMediaScnnerFolderInfo() ERROR Exception:" + paramString.getMessage());
      }
      return;
    }
    finally
    {
      a();
    }
  }
  
  /* Error */
  public void a(java.util.ArrayList paramArrayList)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +4 -> 5
    //   4: return
    //   5: aload_0
    //   6: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   9: astore_2
    //   10: aload_2
    //   11: invokevirtual 258	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   14: aload_1
    //   15: invokevirtual 262	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   18: astore_1
    //   19: aload_1
    //   20: invokeinterface 267 1 0
    //   25: ifeq +124 -> 149
    //   28: aload_2
    //   29: ldc 86
    //   31: ldc_w 269
    //   34: iconst_1
    //   35: anewarray 88	java/lang/String
    //   38: dup
    //   39: iconst_0
    //   40: aload_1
    //   41: invokeinterface 273 1 0
    //   46: checkcast 169	com/tencent/mobileqq/activity/photo/MediaScannerInfo
    //   49: getfield 171	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_Int	I
    //   52: invokestatic 275	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   55: aastore
    //   56: invokevirtual 279	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   59: pop
    //   60: goto -41 -> 19
    //   63: astore_1
    //   64: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   67: ifeq +34 -> 101
    //   70: aload_0
    //   71: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   74: iconst_2
    //   75: new 60	java/lang/StringBuilder
    //   78: dup
    //   79: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   82: ldc_w 281
    //   85: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   88: aload_1
    //   89: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   92: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   95: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   98: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   101: aload_2
    //   102: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   105: aload_0
    //   106: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   109: return
    //   110: astore_1
    //   111: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   114: ifeq -110 -> 4
    //   117: aload_0
    //   118: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   121: iconst_2
    //   122: new 60	java/lang/StringBuilder
    //   125: dup
    //   126: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   129: ldc_w 286
    //   132: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: aload_1
    //   136: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   139: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   145: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   148: return
    //   149: aload_2
    //   150: invokevirtual 289	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   153: aload_2
    //   154: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   157: aload_0
    //   158: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   161: return
    //   162: astore_1
    //   163: aload_2
    //   164: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   167: aload_0
    //   168: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   171: aload_1
    //   172: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	173	0	this	MediaDatabaseHelper
    //   0	173	1	paramArrayList	java.util.ArrayList
    //   9	155	2	localSQLiteDatabase	SQLiteDatabase
    // Exception table:
    //   from	to	target	type
    //   14	19	63	java/lang/Exception
    //   19	60	63	java/lang/Exception
    //   149	153	63	java/lang/Exception
    //   5	14	110	java/lang/Exception
    //   101	109	110	java/lang/Exception
    //   153	161	110	java/lang/Exception
    //   163	173	110	java/lang/Exception
    //   14	19	162	finally
    //   19	60	162	finally
    //   64	101	162	finally
    //   149	153	162	finally
  }
  
  public void a(HashSet paramHashSet)
  {
    if (paramHashSet == null) {}
    SQLiteDatabase localSQLiteDatabase;
    for (;;)
    {
      return;
      try
      {
        localSQLiteDatabase = getReadableDatabase();
        localSQLiteDatabase.beginTransaction();
        paramHashSet = paramHashSet.iterator();
        while (paramHashSet.hasNext())
        {
          String str = (String)paramHashSet.next();
          String[] arrayOfString = new String[1];
          arrayOfString[0] = str;
          localSQLiteDatabase.delete("content_table", "folderpath=?", arrayOfString);
          localSQLiteDatabase.delete("folder_table", "folderpath=?", arrayOfString);
        }
        if (!QLog.isColorLevel()) {}
      }
      catch (Exception paramHashSet) {}
    }
    QLog.d(jdField_a_of_type_JavaLangString, 2, "getReadableDatabase ERROR Exception:" + paramHashSet.getMessage());
    return;
    try
    {
      localSQLiteDatabase.setTransactionSuccessful();
      return;
    }
    catch (Exception paramHashSet)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "deleteMediaScannerInfoByFolderPathSet() ERROR Exception:" + paramHashSet.getMessage());
      }
      return;
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
      a();
    }
  }
  
  /* Error */
  public java.util.ArrayList b(String paramString)
  {
    // Byte code:
    //   0: new 155	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 156	java/util/ArrayList:<init>	()V
    //   7: astore 4
    //   9: aload_0
    //   10: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   13: ldc 86
    //   15: getstatic 158	com/tencent/mobileqq/activity/photo/MediaDBValues:a	[Ljava/lang/String;
    //   18: aconst_null
    //   19: aconst_null
    //   20: aconst_null
    //   21: aconst_null
    //   22: ldc -92
    //   24: aload_1
    //   25: invokevirtual 167	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   28: astore_2
    //   29: aload_2
    //   30: astore_1
    //   31: aload_2
    //   32: invokeinterface 120 1 0
    //   37: ifeq +264 -> 301
    //   40: aload_2
    //   41: astore_1
    //   42: new 169	com/tencent/mobileqq/activity/photo/MediaScannerInfo
    //   45: dup
    //   46: invokespecial 170	com/tencent/mobileqq/activity/photo/MediaScannerInfo:<init>	()V
    //   49: astore_3
    //   50: aload_2
    //   51: astore_1
    //   52: aload_3
    //   53: aload_2
    //   54: aload_2
    //   55: ldc 90
    //   57: invokeinterface 127 2 0
    //   62: invokeinterface 131 2 0
    //   67: putfield 171	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_Int	I
    //   70: aload_2
    //   71: astore_1
    //   72: aload_3
    //   73: aload_2
    //   74: aload_2
    //   75: ldc -83
    //   77: invokeinterface 127 2 0
    //   82: invokeinterface 140 2 0
    //   87: putfield 174	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   90: aload_2
    //   91: astore_1
    //   92: aload_3
    //   93: aload_2
    //   94: aload_2
    //   95: ldc -80
    //   97: invokeinterface 127 2 0
    //   102: invokeinterface 140 2 0
    //   107: putfield 179	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   110: aload_2
    //   111: astore_1
    //   112: aload_3
    //   113: aload_2
    //   114: aload_2
    //   115: ldc -75
    //   117: invokeinterface 127 2 0
    //   122: invokeinterface 147 2 0
    //   127: putfield 182	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_Long	J
    //   130: aload_2
    //   131: astore_1
    //   132: aload_3
    //   133: aload_2
    //   134: aload_2
    //   135: ldc -113
    //   137: invokeinterface 127 2 0
    //   142: invokeinterface 147 2 0
    //   147: putfield 184	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_b_of_type_Long	J
    //   150: aload_2
    //   151: astore_1
    //   152: aload_3
    //   153: aload_2
    //   154: aload_2
    //   155: ldc -70
    //   157: invokeinterface 127 2 0
    //   162: invokeinterface 147 2 0
    //   167: putfield 188	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_c_of_type_Long	J
    //   170: aload_2
    //   171: astore_1
    //   172: aload_3
    //   173: aload_2
    //   174: aload_2
    //   175: ldc -66
    //   177: invokeinterface 127 2 0
    //   182: invokeinterface 140 2 0
    //   187: putfield 192	com/tencent/mobileqq/activity/photo/MediaScannerInfo:d	Ljava/lang/String;
    //   190: aload_2
    //   191: astore_1
    //   192: aload_3
    //   193: aload_2
    //   194: aload_2
    //   195: ldc -120
    //   197: invokeinterface 127 2 0
    //   202: invokeinterface 140 2 0
    //   207: putfield 194	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   210: aload_2
    //   211: astore_1
    //   212: aload_3
    //   213: aload_2
    //   214: aload_2
    //   215: ldc -60
    //   217: invokeinterface 127 2 0
    //   222: invokeinterface 140 2 0
    //   227: putfield 199	com/tencent/mobileqq/activity/photo/MediaScannerInfo:e	Ljava/lang/String;
    //   230: aload_2
    //   231: astore_1
    //   232: aload 4
    //   234: aload_3
    //   235: invokevirtual 203	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   238: pop
    //   239: goto -210 -> 29
    //   242: astore_3
    //   243: aload_2
    //   244: astore_1
    //   245: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   248: ifeq +36 -> 284
    //   251: aload_2
    //   252: astore_1
    //   253: aload_0
    //   254: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   257: iconst_2
    //   258: new 60	java/lang/StringBuilder
    //   261: dup
    //   262: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   265: ldc_w 295
    //   268: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   271: aload_3
    //   272: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   275: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   278: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   281: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   284: aload_2
    //   285: ifnull +9 -> 294
    //   288: aload_2
    //   289: invokeinterface 102 1 0
    //   294: aload_0
    //   295: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   298: aload 4
    //   300: areturn
    //   301: aload_2
    //   302: ifnull +9 -> 311
    //   305: aload_2
    //   306: invokeinterface 102 1 0
    //   311: aload_0
    //   312: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   315: aload 4
    //   317: areturn
    //   318: astore_2
    //   319: aconst_null
    //   320: astore_1
    //   321: aload_1
    //   322: ifnull +9 -> 331
    //   325: aload_1
    //   326: invokeinterface 102 1 0
    //   331: aload_0
    //   332: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   335: aload_2
    //   336: athrow
    //   337: astore_2
    //   338: goto -17 -> 321
    //   341: astore_3
    //   342: aconst_null
    //   343: astore_2
    //   344: goto -101 -> 243
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	347	0	this	MediaDatabaseHelper
    //   0	347	1	paramString	String
    //   28	278	2	localCursor	android.database.Cursor
    //   318	18	2	localObject1	Object
    //   337	1	2	localObject2	Object
    //   343	1	2	localObject3	Object
    //   49	186	3	localMediaScannerInfo	MediaScannerInfo
    //   242	30	3	localException1	Exception
    //   341	1	3	localException2	Exception
    //   7	309	4	localArrayList	java.util.ArrayList
    // Exception table:
    //   from	to	target	type
    //   31	40	242	java/lang/Exception
    //   42	50	242	java/lang/Exception
    //   52	70	242	java/lang/Exception
    //   72	90	242	java/lang/Exception
    //   92	110	242	java/lang/Exception
    //   112	130	242	java/lang/Exception
    //   132	150	242	java/lang/Exception
    //   152	170	242	java/lang/Exception
    //   172	190	242	java/lang/Exception
    //   192	210	242	java/lang/Exception
    //   212	230	242	java/lang/Exception
    //   232	239	242	java/lang/Exception
    //   9	29	318	finally
    //   31	40	337	finally
    //   42	50	337	finally
    //   52	70	337	finally
    //   72	90	337	finally
    //   92	110	337	finally
    //   112	130	337	finally
    //   132	150	337	finally
    //   152	170	337	finally
    //   172	190	337	finally
    //   192	210	337	finally
    //   212	230	337	finally
    //   232	239	337	finally
    //   245	251	337	finally
    //   253	284	337	finally
    //   9	29	341	java/lang/Exception
  }
  
  /* Error */
  public HashSet b()
  {
    // Byte code:
    //   0: new 208	java/util/HashSet
    //   3: dup
    //   4: invokespecial 209	java/util/HashSet:<init>	()V
    //   7: astore 4
    //   9: aload_0
    //   10: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   13: ldc 86
    //   15: iconst_1
    //   16: anewarray 88	java/lang/String
    //   19: dup
    //   20: iconst_0
    //   21: ldc -60
    //   23: aastore
    //   24: aconst_null
    //   25: aconst_null
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: invokevirtual 94	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore_2
    //   33: aload_2
    //   34: astore_1
    //   35: aload_2
    //   36: invokeinterface 120 1 0
    //   41: ifeq +87 -> 128
    //   44: aload_2
    //   45: astore_1
    //   46: aload 4
    //   48: aload_2
    //   49: aload_2
    //   50: ldc -60
    //   52: invokeinterface 127 2 0
    //   57: invokeinterface 140 2 0
    //   62: invokevirtual 210	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   65: pop
    //   66: goto -33 -> 33
    //   69: astore_3
    //   70: aload_2
    //   71: astore_1
    //   72: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   75: ifeq +36 -> 111
    //   78: aload_2
    //   79: astore_1
    //   80: aload_0
    //   81: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   84: iconst_2
    //   85: new 60	java/lang/StringBuilder
    //   88: dup
    //   89: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   92: ldc_w 297
    //   95: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: aload_3
    //   99: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   102: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   108: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   111: aload_2
    //   112: ifnull +9 -> 121
    //   115: aload_2
    //   116: invokeinterface 102 1 0
    //   121: aload_0
    //   122: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   125: aload 4
    //   127: areturn
    //   128: aload_2
    //   129: ifnull +9 -> 138
    //   132: aload_2
    //   133: invokeinterface 102 1 0
    //   138: aload_0
    //   139: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   142: aload 4
    //   144: areturn
    //   145: astore_2
    //   146: aconst_null
    //   147: astore_1
    //   148: aload_1
    //   149: ifnull +9 -> 158
    //   152: aload_1
    //   153: invokeinterface 102 1 0
    //   158: aload_0
    //   159: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   162: aload_2
    //   163: athrow
    //   164: astore_2
    //   165: goto -17 -> 148
    //   168: astore_3
    //   169: aconst_null
    //   170: astore_2
    //   171: goto -101 -> 70
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	174	0	this	MediaDatabaseHelper
    //   34	119	1	localCursor1	android.database.Cursor
    //   32	101	2	localCursor2	android.database.Cursor
    //   145	18	2	localObject1	Object
    //   164	1	2	localObject2	Object
    //   170	1	2	localObject3	Object
    //   69	30	3	localException1	Exception
    //   168	1	3	localException2	Exception
    //   7	136	4	localHashSet	HashSet
    // Exception table:
    //   from	to	target	type
    //   35	44	69	java/lang/Exception
    //   46	66	69	java/lang/Exception
    //   9	33	145	finally
    //   35	44	164	finally
    //   46	66	164	finally
    //   72	78	164	finally
    //   80	111	164	finally
    //   9	33	168	java/lang/Exception
  }
  
  public void b(MediaScannerFolderInfo paramMediaScannerFolderInfo)
  {
    if (paramMediaScannerFolderInfo == null) {
      return;
    }
    try
    {
      SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("folderpath", jdField_a_of_type_JavaLangString);
      localContentValues.put("modifieddate", Long.valueOf(jdField_a_of_type_Long));
      localSQLiteDatabase.insert("folder_table", null, localContentValues);
      return;
    }
    catch (Exception paramMediaScannerFolderInfo)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "insertMediaScnnerFolderInfo() ERROR Exception:" + paramMediaScannerFolderInfo.getMessage());
      }
      return;
    }
    finally
    {
      a();
    }
  }
  
  /* Error */
  public void b(java.util.ArrayList paramArrayList)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +4 -> 5
    //   4: return
    //   5: aload_0
    //   6: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   9: astore_2
    //   10: aload_2
    //   11: invokevirtual 258	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   14: aload_1
    //   15: invokevirtual 262	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   18: astore_1
    //   19: aload_1
    //   20: invokeinterface 267 1 0
    //   25: ifeq +217 -> 242
    //   28: aload_1
    //   29: invokeinterface 273 1 0
    //   34: checkcast 169	com/tencent/mobileqq/activity/photo/MediaScannerInfo
    //   37: astore_3
    //   38: new 224	android/content/ContentValues
    //   41: dup
    //   42: invokespecial 225	android/content/ContentValues:<init>	()V
    //   45: astore 4
    //   47: aload 4
    //   49: ldc -83
    //   51: aload_3
    //   52: getfield 174	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   55: invokevirtual 245	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   58: aload 4
    //   60: ldc -80
    //   62: aload_3
    //   63: getfield 179	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   66: invokevirtual 245	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   69: aload 4
    //   71: ldc -75
    //   73: aload_3
    //   74: getfield 182	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_a_of_type_Long	J
    //   77: invokestatic 231	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   80: invokevirtual 235	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   83: aload 4
    //   85: ldc -113
    //   87: aload_3
    //   88: getfield 184	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_b_of_type_Long	J
    //   91: invokestatic 231	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   94: invokevirtual 235	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   97: aload 4
    //   99: ldc -70
    //   101: aload_3
    //   102: getfield 188	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_c_of_type_Long	J
    //   105: invokestatic 231	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   108: invokevirtual 235	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   111: aload 4
    //   113: ldc -66
    //   115: aload_3
    //   116: getfield 192	com/tencent/mobileqq/activity/photo/MediaScannerInfo:d	Ljava/lang/String;
    //   119: invokevirtual 245	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   122: aload 4
    //   124: ldc -120
    //   126: aload_3
    //   127: getfield 194	com/tencent/mobileqq/activity/photo/MediaScannerInfo:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   130: invokevirtual 245	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   133: aload 4
    //   135: ldc -60
    //   137: aload_3
    //   138: getfield 199	com/tencent/mobileqq/activity/photo/MediaScannerInfo:e	Ljava/lang/String;
    //   141: invokevirtual 245	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   144: aload_2
    //   145: ldc 86
    //   147: aconst_null
    //   148: aload 4
    //   150: invokevirtual 249	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   153: pop2
    //   154: goto -135 -> 19
    //   157: astore_1
    //   158: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   161: ifeq +33 -> 194
    //   164: aload_0
    //   165: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   168: iconst_2
    //   169: new 60	java/lang/StringBuilder
    //   172: dup
    //   173: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   176: ldc -5
    //   178: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   181: aload_1
    //   182: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   185: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   188: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   191: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   194: aload_2
    //   195: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   198: aload_0
    //   199: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   202: return
    //   203: astore_1
    //   204: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   207: ifeq -203 -> 4
    //   210: aload_0
    //   211: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   214: iconst_2
    //   215: new 60	java/lang/StringBuilder
    //   218: dup
    //   219: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   222: ldc_w 286
    //   225: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: aload_1
    //   229: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   232: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   238: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   241: return
    //   242: aload_2
    //   243: invokevirtual 289	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   246: aload_2
    //   247: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   250: aload_0
    //   251: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   254: return
    //   255: astore_1
    //   256: aload_2
    //   257: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   260: aload_0
    //   261: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   264: aload_1
    //   265: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	266	0	this	MediaDatabaseHelper
    //   0	266	1	paramArrayList	java.util.ArrayList
    //   9	248	2	localSQLiteDatabase	SQLiteDatabase
    //   37	101	3	localMediaScannerInfo	MediaScannerInfo
    //   45	104	4	localContentValues	ContentValues
    // Exception table:
    //   from	to	target	type
    //   14	19	157	java/lang/Exception
    //   19	154	157	java/lang/Exception
    //   242	246	157	java/lang/Exception
    //   5	14	203	java/lang/Exception
    //   194	202	203	java/lang/Exception
    //   246	254	203	java/lang/Exception
    //   256	266	203	java/lang/Exception
    //   14	19	255	finally
    //   19	154	255	finally
    //   158	194	255	finally
    //   242	246	255	finally
  }
  
  /* Error */
  public void b(HashSet paramHashSet)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +4 -> 5
    //   4: return
    //   5: aload_0
    //   6: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   9: astore_2
    //   10: aload_2
    //   11: invokevirtual 258	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   14: aload_1
    //   15: invokevirtual 291	java/util/HashSet:iterator	()Ljava/util/Iterator;
    //   18: astore_1
    //   19: aload_1
    //   20: invokeinterface 267 1 0
    //   25: ifeq +116 -> 141
    //   28: aload_2
    //   29: ldc 86
    //   31: ldc -2
    //   33: iconst_1
    //   34: anewarray 88	java/lang/String
    //   37: dup
    //   38: iconst_0
    //   39: aload_1
    //   40: invokeinterface 273 1 0
    //   45: checkcast 88	java/lang/String
    //   48: aastore
    //   49: invokevirtual 279	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   52: pop
    //   53: goto -34 -> 19
    //   56: astore_1
    //   57: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   60: ifeq +33 -> 93
    //   63: aload_0
    //   64: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   67: iconst_2
    //   68: new 60	java/lang/StringBuilder
    //   71: dup
    //   72: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   75: ldc -5
    //   77: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: aload_1
    //   81: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   84: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   90: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   93: aload_2
    //   94: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   97: aload_0
    //   98: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   101: return
    //   102: astore_1
    //   103: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   106: ifeq -102 -> 4
    //   109: aload_0
    //   110: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   113: iconst_2
    //   114: new 60	java/lang/StringBuilder
    //   117: dup
    //   118: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   121: ldc_w 286
    //   124: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: aload_1
    //   128: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   131: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   134: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   137: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   140: return
    //   141: aload_2
    //   142: invokevirtual 289	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   145: aload_2
    //   146: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   149: aload_0
    //   150: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   153: return
    //   154: astore_1
    //   155: aload_2
    //   156: invokevirtual 284	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   159: aload_0
    //   160: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   163: aload_1
    //   164: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	165	0	this	MediaDatabaseHelper
    //   0	165	1	paramHashSet	HashSet
    //   9	147	2	localSQLiteDatabase	SQLiteDatabase
    // Exception table:
    //   from	to	target	type
    //   14	19	56	java/lang/Exception
    //   19	53	56	java/lang/Exception
    //   141	145	56	java/lang/Exception
    //   5	14	102	java/lang/Exception
    //   93	101	102	java/lang/Exception
    //   145	153	102	java/lang/Exception
    //   155	165	102	java/lang/Exception
    //   14	19	154	finally
    //   19	53	154	finally
    //   57	93	154	finally
    //   141	145	154	finally
  }
  
  /* Error */
  public HashSet c()
  {
    // Byte code:
    //   0: new 208	java/util/HashSet
    //   3: dup
    //   4: invokespecial 209	java/util/HashSet:<init>	()V
    //   7: astore 4
    //   9: aload_0
    //   10: invokevirtual 84	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   13: ldc 109
    //   15: iconst_1
    //   16: anewarray 88	java/lang/String
    //   19: dup
    //   20: iconst_0
    //   21: ldc -120
    //   23: aastore
    //   24: aconst_null
    //   25: aconst_null
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: invokevirtual 94	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore_2
    //   33: aload_2
    //   34: astore_1
    //   35: aload_2
    //   36: invokeinterface 120 1 0
    //   41: ifeq +87 -> 128
    //   44: aload_2
    //   45: astore_1
    //   46: aload 4
    //   48: aload_2
    //   49: aload_2
    //   50: ldc -120
    //   52: invokeinterface 127 2 0
    //   57: invokeinterface 140 2 0
    //   62: invokevirtual 210	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   65: pop
    //   66: goto -33 -> 33
    //   69: astore_3
    //   70: aload_2
    //   71: astore_1
    //   72: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   75: ifeq +36 -> 111
    //   78: aload_2
    //   79: astore_1
    //   80: aload_0
    //   81: getfield 28	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   84: iconst_2
    //   85: new 60	java/lang/StringBuilder
    //   88: dup
    //   89: invokespecial 62	java/lang/StringBuilder:<init>	()V
    //   92: ldc_w 297
    //   95: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: aload_3
    //   99: invokevirtual 72	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   102: invokevirtual 68	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   108: invokestatic 79	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   111: aload_2
    //   112: ifnull +9 -> 121
    //   115: aload_2
    //   116: invokeinterface 102 1 0
    //   121: aload_0
    //   122: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   125: aload 4
    //   127: areturn
    //   128: aload_2
    //   129: ifnull +9 -> 138
    //   132: aload_2
    //   133: invokeinterface 102 1 0
    //   138: aload_0
    //   139: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   142: aload 4
    //   144: areturn
    //   145: astore_2
    //   146: aconst_null
    //   147: astore_1
    //   148: aload_1
    //   149: ifnull +9 -> 158
    //   152: aload_1
    //   153: invokeinterface 102 1 0
    //   158: aload_0
    //   159: invokevirtual 104	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()V
    //   162: aload_2
    //   163: athrow
    //   164: astore_2
    //   165: goto -17 -> 148
    //   168: astore_3
    //   169: aconst_null
    //   170: astore_2
    //   171: goto -101 -> 70
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	174	0	this	MediaDatabaseHelper
    //   34	119	1	localCursor1	android.database.Cursor
    //   32	101	2	localCursor2	android.database.Cursor
    //   145	18	2	localObject1	Object
    //   164	1	2	localObject2	Object
    //   170	1	2	localObject3	Object
    //   69	30	3	localException1	Exception
    //   168	1	3	localException2	Exception
    //   7	136	4	localHashSet	HashSet
    // Exception table:
    //   from	to	target	type
    //   35	44	69	java/lang/Exception
    //   46	66	69	java/lang/Exception
    //   9	33	145	finally
    //   35	44	164	finally
    //   46	66	164	finally
    //   72	78	164	finally
    //   80	111	164	finally
    //   9	33	168	java/lang/Exception
  }
  
  public SQLiteDatabase getReadableDatabase()
  {
    try
    {
      if ((jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.incrementAndGet() == 1) || (jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase == null)) {
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = super.getReadableDatabase();
      }
      SQLiteDatabase localSQLiteDatabase = jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase;
      return localSQLiteDatabase;
    }
    finally {}
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onCreate");
    }
    a(paramSQLiteDatabase);
  }
  
  public void onDowngrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onDowngrade oldVersion=" + paramInt1 + ", newVersion=" + paramInt2);
    }
    if (paramInt1 == paramInt2) {}
    do
    {
      return;
      try
      {
        paramSQLiteDatabase.execSQL("drop table if exists folder_table");
        paramSQLiteDatabase.execSQL("drop table if exists content_table");
        a(paramSQLiteDatabase);
        return;
      }
      catch (Exception paramSQLiteDatabase) {}
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "onDowngrade error=" + paramSQLiteDatabase.getMessage());
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onUpgrade oldVersion=" + paramInt1 + ", newVersion=" + paramInt2);
    }
    if (paramInt1 == paramInt2) {}
    do
    {
      return;
      try
      {
        paramSQLiteDatabase.execSQL("drop table if exists folder_table");
        paramSQLiteDatabase.execSQL("drop table if exists content_table");
        a(paramSQLiteDatabase);
        return;
      }
      catch (Exception paramSQLiteDatabase) {}
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "onUpgrade error=" + paramSQLiteDatabase.getMessage());
  }
}
