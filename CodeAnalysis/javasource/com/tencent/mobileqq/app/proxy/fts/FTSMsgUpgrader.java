package com.tencent.mobileqq.app.proxy.fts;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.fts.FTSDatatbase;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class FTSMsgUpgrader
  implements FTSUpgrader
{
  public static final String a = "msg_upgrade_log";
  public static final String b = "UpgradeCursor";
  private static final String c = "Q.fts.FTSMsgUpgrader";
  private int jdField_a_of_type_Int;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private FTSMsgOperator jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSMsgOperator;
  private FTSSyncHandler jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler;
  private FTSDatatbase jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase;
  public boolean a;
  private int jdField_b_of_type_Int;
  private boolean jdField_b_of_type_Boolean;
  
  FTSMsgUpgrader(QQAppInterface paramQQAppInterface, FTSMsgOperator paramFTSMsgOperator)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSMsgOperator = paramFTSMsgOperator;
    jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase = jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSMsgOperator.jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase;
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler = jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSMsgOperator.jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler;
  }
  
  private long a(long paramLong1, String paramString, long paramLong2, SQLiteDatabase paramSQLiteDatabase)
  {
    if (paramLong1 != -1L)
    {
      paramString = new ContentValues();
      paramString.put("MAX_ID", Long.valueOf(paramLong2));
      return paramSQLiteDatabase.a("msg_upgrade_log", paramString, "id=?", new String[] { String.valueOf(paramLong1) });
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("tablename", paramString);
    localContentValues.put("MAX_ID", Long.valueOf(paramLong2));
    return paramSQLiteDatabase.a("msg_upgrade_log", null, localContentValues);
  }
  
  private void b()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_table", String.valueOf(SQLiteFTSUtils.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)));
    localHashMap.put("param_msg", String.valueOf(SQLiteFTSUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)));
    StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).a(null, "actFTSUpgradeCost", true, SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface), 0L, localHashMap, null, false);
    SQLiteFTSUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.FTSMsgUpgrader", 2, "========== upgrade table complete, cost =" + SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) + "us, tables = " + SQLiteFTSUtils.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) + ", msgs = " + SQLiteFTSUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
    }
  }
  
  private void c()
  {
    long l1 = SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    long l2 = System.nanoTime();
    if (!jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.b("UpgradeCursor"))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.FTSMsgUpgrader", 2, "startUpgradeTableStep: upgradeCursorTable has not exist");
      }
      if (!jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a("UpgradeCursor"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.FTSMsgUpgrader", 2, "startUpgradeTableStep: create upgradeCursorTable failure");
        }
        return;
      }
    }
    for (int i = 0;; i = -1)
    {
      int j = i;
      if (i != 1) {
        j = jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a("UpgradeCursor");
      }
      if (j == -1)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.fts.FTSMsgUpgrader", 2, "startUpgradeTableStep: curCursor == -1");
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.FTSMsgUpgrader", 2, "startUpgradeTableStep: curCursor = " + j);
      }
      jdField_b_of_type_Int = j;
      l2 = (System.nanoTime() - l2) / 1000L;
      SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l1, l2);
      jdField_a_of_type_Boolean = true;
      return;
    }
  }
  
  /* Error */
  private boolean c()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4: invokestatic 211	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:b	(Lcom/tencent/mobileqq/app/QQAppInterface;)I
    //   7: iconst_1
    //   8: if_icmpeq +5 -> 13
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_0
    //   14: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   17: invokestatic 214	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:c	(Lcom/tencent/mobileqq/app/QQAppInterface;)Z
    //   20: ifeq +19 -> 39
    //   23: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   26: ifeq +11 -> 37
    //   29: ldc 16
    //   31: iconst_2
    //   32: ldc -40
    //   34: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   37: iconst_1
    //   38: ireturn
    //   39: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   42: ifeq +11 -> 53
    //   45: ldc 16
    //   47: iconst_2
    //   48: ldc -38
    //   50: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   53: aload_0
    //   54: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   57: invokestatic 136	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;)J
    //   60: lstore_3
    //   61: invokestatic 184	java/lang/System:nanoTime	()J
    //   64: lstore 5
    //   66: aload_0
    //   67: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   70: invokevirtual 221	com/tencent/mobileqq/app/QQAppInterface:b	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   73: ldc -33
    //   75: aconst_null
    //   76: invokevirtual 226	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   79: astore 7
    //   81: aload 7
    //   83: ifnull +323 -> 406
    //   86: aload 7
    //   88: invokeinterface 232 1 0
    //   93: istore_1
    //   94: iload_1
    //   95: iconst_1
    //   96: if_icmpne +310 -> 406
    //   99: iconst_1
    //   100: istore_1
    //   101: iload_1
    //   102: istore_2
    //   103: aload 7
    //   105: ifnull +12 -> 117
    //   108: aload 7
    //   110: invokeinterface 235 1 0
    //   115: iload_1
    //   116: istore_2
    //   117: iload_2
    //   118: ifne +60 -> 178
    //   121: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   124: ifeq +11 -> 135
    //   127: ldc 16
    //   129: iconst_2
    //   130: ldc -19
    //   132: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   135: aload_0
    //   136: invokespecial 176	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:b	()V
    //   139: iconst_1
    //   140: ireturn
    //   141: astore 7
    //   143: iconst_0
    //   144: istore_1
    //   145: aload 7
    //   147: invokevirtual 240	java/lang/Exception:printStackTrace	()V
    //   150: iload_1
    //   151: istore_2
    //   152: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   155: ifeq -38 -> 117
    //   158: ldc 16
    //   160: iconst_2
    //   161: ldc -14
    //   163: aload 7
    //   165: invokestatic 246	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   168: iload_1
    //   169: istore_2
    //   170: goto -53 -> 117
    //   173: astore 7
    //   175: aload 7
    //   177: athrow
    //   178: aload_0
    //   179: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   182: invokevirtual 221	com/tencent/mobileqq/app/QQAppInterface:b	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   185: ldc -8
    //   187: aconst_null
    //   188: invokevirtual 226	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   191: astore 7
    //   193: aload 7
    //   195: ifnull +206 -> 401
    //   198: aload 7
    //   200: invokeinterface 232 1 0
    //   205: iconst_1
    //   206: if_icmpne +195 -> 401
    //   209: aload 7
    //   211: invokeinterface 251 1 0
    //   216: pop
    //   217: aload 7
    //   219: aload 7
    //   221: ldc 60
    //   223: invokeinterface 254 2 0
    //   228: invokeinterface 258 2 0
    //   233: istore_1
    //   234: iload_1
    //   235: istore_2
    //   236: aload 7
    //   238: ifnull +12 -> 250
    //   241: aload 7
    //   243: invokeinterface 235 1 0
    //   248: iload_1
    //   249: istore_2
    //   250: iload_2
    //   251: iconst_m1
    //   252: if_icmpne +61 -> 313
    //   255: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   258: ifeq +12 -> 270
    //   261: ldc 16
    //   263: iconst_2
    //   264: ldc_w 260
    //   267: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   270: aload_0
    //   271: invokespecial 176	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:b	()V
    //   274: iconst_1
    //   275: ireturn
    //   276: astore 7
    //   278: iconst_m1
    //   279: istore_1
    //   280: aload 7
    //   282: invokevirtual 240	java/lang/Exception:printStackTrace	()V
    //   285: iload_1
    //   286: istore_2
    //   287: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   290: ifeq -40 -> 250
    //   293: ldc 16
    //   295: iconst_2
    //   296: ldc -14
    //   298: aload 7
    //   300: invokestatic 246	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   303: iload_1
    //   304: istore_2
    //   305: goto -55 -> 250
    //   308: astore 7
    //   310: aload 7
    //   312: athrow
    //   313: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   316: ifeq +29 -> 345
    //   319: ldc 16
    //   321: iconst_2
    //   322: new 150	java/lang/StringBuilder
    //   325: dup
    //   326: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   329: ldc_w 262
    //   332: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   335: iload_2
    //   336: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   339: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   342: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   345: aload_0
    //   346: iload_2
    //   347: putfield 100	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_Int	I
    //   350: invokestatic 184	java/lang/System:nanoTime	()J
    //   353: lload 5
    //   355: lsub
    //   356: ldc2_w 203
    //   359: ldiv
    //   360: lstore 5
    //   362: aload_0
    //   363: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   366: lload_3
    //   367: lload 5
    //   369: invokestatic 207	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;JJ)J
    //   372: pop2
    //   373: aload_0
    //   374: getfield 48	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler	Lcom/tencent/mobileqq/app/proxy/fts/FTSSyncHandler;
    //   377: new 264	nlw
    //   380: dup
    //   381: aload_0
    //   382: invokespecial 266	nlw:<init>	(Lcom/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader;)V
    //   385: invokevirtual 272	com/tencent/mobileqq/app/proxy/fts/FTSSyncHandler:post	(Ljava/lang/Runnable;)Z
    //   388: pop
    //   389: iconst_0
    //   390: ireturn
    //   391: astore 7
    //   393: goto -113 -> 280
    //   396: astore 7
    //   398: goto -253 -> 145
    //   401: iconst_m1
    //   402: istore_1
    //   403: goto -169 -> 234
    //   406: iconst_0
    //   407: istore_1
    //   408: goto -307 -> 101
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	411	0	this	FTSMsgUpgrader
    //   93	315	1	i	int
    //   102	245	2	j	int
    //   60	307	3	l1	long
    //   64	304	5	l2	long
    //   79	30	7	localCursor1	Cursor
    //   141	23	7	localException1	Exception
    //   173	3	7	localObject1	Object
    //   191	51	7	localCursor2	Cursor
    //   276	23	7	localException2	Exception
    //   308	3	7	localObject2	Object
    //   391	1	7	localException3	Exception
    //   396	1	7	localException4	Exception
    // Exception table:
    //   from	to	target	type
    //   66	81	141	java/lang/Exception
    //   86	94	141	java/lang/Exception
    //   66	81	173	finally
    //   86	94	173	finally
    //   108	115	173	finally
    //   145	150	173	finally
    //   152	168	173	finally
    //   178	193	276	java/lang/Exception
    //   198	234	276	java/lang/Exception
    //   178	193	308	finally
    //   198	234	308	finally
    //   241	248	308	finally
    //   280	285	308	finally
    //   287	303	308	finally
    //   241	248	391	java/lang/Exception
    //   108	115	396	java/lang/Exception
  }
  
  /* Error */
  private boolean d()
  {
    // Byte code:
    //   0: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +12 -> 15
    //   6: ldc 16
    //   8: iconst_2
    //   9: ldc_w 278
    //   12: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   15: aconst_null
    //   16: astore 10
    //   18: aconst_null
    //   19: astore 12
    //   21: new 280	java/util/ArrayList
    //   24: dup
    //   25: sipush 512
    //   28: invokespecial 283	java/util/ArrayList:<init>	(I)V
    //   31: astore 14
    //   33: aload_0
    //   34: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   37: invokestatic 110	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:c	(Lcom/tencent/mobileqq/app/QQAppInterface;)I
    //   40: istore_1
    //   41: aload_0
    //   42: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   45: invokestatic 121	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:d	(Lcom/tencent/mobileqq/app/QQAppInterface;)I
    //   48: istore_2
    //   49: aload_0
    //   50: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   53: invokestatic 136	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;)J
    //   56: lstore 6
    //   58: invokestatic 184	java/lang/System:nanoTime	()J
    //   61: lstore 8
    //   63: aload_0
    //   64: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   67: invokevirtual 286	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/persistence/EntityManagerFactory;
    //   70: invokevirtual 292	com/tencent/mobileqq/persistence/EntityManagerFactory:createMessageRecordEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   73: checkcast 294	com/tencent/mobileqq/persistence/MessageRecordEntityManager
    //   76: astore 11
    //   78: aload_0
    //   79: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   82: invokevirtual 221	com/tencent/mobileqq/app/QQAppInterface:b	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   85: new 150	java/lang/StringBuilder
    //   88: dup
    //   89: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   92: ldc_w 296
    //   95: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: aload_0
    //   99: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   102: iconst_1
    //   103: iadd
    //   104: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   107: ldc_w 298
    //   110: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   113: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   116: aconst_null
    //   117: invokevirtual 226	com/tencent/mobileqq/app/SQLiteDatabase:a	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   120: astore 12
    //   122: aload 12
    //   124: ifnull +507 -> 631
    //   127: aload 12
    //   129: invokeinterface 232 1 0
    //   134: iconst_1
    //   135: if_icmpne +496 -> 631
    //   138: aload 12
    //   140: invokeinterface 251 1 0
    //   145: pop
    //   146: aload 12
    //   148: aload 12
    //   150: ldc 84
    //   152: invokeinterface 254 2 0
    //   157: invokeinterface 301 2 0
    //   162: astore 10
    //   164: aload 12
    //   166: aload 12
    //   168: ldc 60
    //   170: invokeinterface 254 2 0
    //   175: invokeinterface 305 2 0
    //   180: lstore 4
    //   182: aload 12
    //   184: ifnull +10 -> 194
    //   187: aload 12
    //   189: invokeinterface 235 1 0
    //   194: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   197: ifeq +41 -> 238
    //   200: ldc 16
    //   202: iconst_2
    //   203: new 150	java/lang/StringBuilder
    //   206: dup
    //   207: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   210: ldc_w 307
    //   213: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   216: aload 10
    //   218: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   221: ldc_w 309
    //   224: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   227: lload 4
    //   229: invokevirtual 160	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   232: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   235: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   238: aconst_null
    //   239: astore 13
    //   241: aload 13
    //   243: astore 12
    //   245: aload 10
    //   247: ifnull +177 -> 424
    //   250: aload 13
    //   252: astore 12
    //   254: lload 4
    //   256: lconst_0
    //   257: lcmp
    //   258: ifle +166 -> 424
    //   261: new 150	java/lang/StringBuilder
    //   264: dup
    //   265: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   268: ldc_w 311
    //   271: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   274: aload 10
    //   276: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   279: ldc_w 313
    //   282: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   285: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   288: astore 12
    //   290: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   293: ifeq +47 -> 340
    //   296: ldc 16
    //   298: iconst_2
    //   299: new 150	java/lang/StringBuilder
    //   302: dup
    //   303: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   306: ldc_w 315
    //   309: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   312: aload 10
    //   314: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   317: ldc_w 317
    //   320: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   323: lload 4
    //   325: invokevirtual 160	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   328: ldc_w 298
    //   331: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   334: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   337: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   340: aload_0
    //   341: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   344: astore 10
    //   346: aload 11
    //   348: aload 12
    //   350: iconst_1
    //   351: anewarray 74	java/lang/String
    //   354: dup
    //   355: iconst_0
    //   356: lload 4
    //   358: invokestatic 77	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   361: aastore
    //   362: aload 10
    //   364: invokevirtual 320	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	(Ljava/lang/String;[Ljava/lang/String;Lcom/tencent/mobileqq/app/QQAppInterface;)Ljava/util/List;
    //   367: astore 13
    //   369: aload 13
    //   371: astore 12
    //   373: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   376: ifeq +48 -> 424
    //   379: new 150	java/lang/StringBuilder
    //   382: dup
    //   383: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   386: ldc_w 322
    //   389: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   392: astore 12
    //   394: aload 13
    //   396: ifnonnull +281 -> 677
    //   399: ldc_w 324
    //   402: astore 10
    //   404: ldc 16
    //   406: iconst_2
    //   407: aload 12
    //   409: aload 10
    //   411: invokevirtual 327	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   414: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   417: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   420: aload 13
    //   422: astore 12
    //   424: aload 12
    //   426: ifnull +268 -> 694
    //   429: aload 12
    //   431: invokeinterface 332 1 0
    //   436: ifne +258 -> 694
    //   439: aload 12
    //   441: invokeinterface 336 1 0
    //   446: astore 10
    //   448: aload 10
    //   450: invokeinterface 341 1 0
    //   455: ifeq +239 -> 694
    //   458: aload 10
    //   460: invokeinterface 345 1 0
    //   465: checkcast 347	com/tencent/mobileqq/data/MessageRecord
    //   468: astore 12
    //   470: aload 12
    //   472: invokevirtual 350	com/tencent/mobileqq/data/MessageRecord:isSupportFTS	()Z
    //   475: ifeq -27 -> 448
    //   478: aload 12
    //   480: getfield 353	com/tencent/mobileqq/data/MessageRecord:isValid	Z
    //   483: ifeq -35 -> 448
    //   486: aload 12
    //   488: getfield 356	com/tencent/mobileqq/data/MessageRecord:msgtype	I
    //   491: sipush 63530
    //   494: if_icmpeq -46 -> 448
    //   497: aload 12
    //   499: invokestatic 361	com/tencent/mobileqq/utils/fts/FTSMessageCodec:a	(Lcom/tencent/mobileqq/data/MessageRecord;)Lcom/tencent/mobileqq/data/fts/FTSMessage;
    //   502: astore 12
    //   504: aload 12
    //   506: ifnull -58 -> 448
    //   509: aload 12
    //   511: invokevirtual 366	com/tencent/mobileqq/data/fts/FTSMessage:insertOpt	()V
    //   514: aload 12
    //   516: invokevirtual 369	com/tencent/mobileqq/data/fts/FTSMessage:preWrite	()V
    //   519: aload 14
    //   521: aload 12
    //   523: invokevirtual 373	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   526: pop
    //   527: goto -79 -> 448
    //   530: astore 10
    //   532: aload 10
    //   534: invokevirtual 374	java/lang/Throwable:printStackTrace	()V
    //   537: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   540: ifeq +30 -> 570
    //   543: ldc 16
    //   545: iconst_2
    //   546: new 150	java/lang/StringBuilder
    //   549: dup
    //   550: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   553: ldc_w 376
    //   556: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   559: aload 10
    //   561: invokevirtual 327	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   564: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   567: invokestatic 378	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   570: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   573: ifeq +46 -> 619
    //   576: ldc 16
    //   578: iconst_2
    //   579: new 150	java/lang/StringBuilder
    //   582: dup
    //   583: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   586: ldc_w 380
    //   589: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   592: aload 14
    //   594: invokevirtual 383	java/util/ArrayList:size	()I
    //   597: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   600: ldc_w 385
    //   603: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   606: aload_0
    //   607: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   610: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   613: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   616: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   619: aload 11
    //   621: ifnull +8 -> 629
    //   624: aload 11
    //   626: invokevirtual 387	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   629: iconst_0
    //   630: ireturn
    //   631: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   634: ifeq +674 -> 1308
    //   637: ldc 16
    //   639: iconst_2
    //   640: new 150	java/lang/StringBuilder
    //   643: dup
    //   644: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   647: ldc_w 389
    //   650: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   653: aload_0
    //   654: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   657: iconst_1
    //   658: iadd
    //   659: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   662: ldc_w 391
    //   665: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   668: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   671: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   674: goto +634 -> 1308
    //   677: aload 13
    //   679: invokeinterface 392 1 0
    //   684: istore_3
    //   685: iload_3
    //   686: invokestatic 397	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   689: astore 10
    //   691: goto -287 -> 404
    //   694: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   697: ifeq +46 -> 743
    //   700: ldc 16
    //   702: iconst_2
    //   703: new 150	java/lang/StringBuilder
    //   706: dup
    //   707: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   710: ldc_w 380
    //   713: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   716: aload 14
    //   718: invokevirtual 383	java/util/ArrayList:size	()I
    //   721: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   724: ldc_w 385
    //   727: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   730: aload_0
    //   731: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   734: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   737: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   740: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   743: aload 11
    //   745: ifnull +8 -> 753
    //   748: aload 11
    //   750: invokevirtual 387	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   753: aload_0
    //   754: getfield 45	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase	Lcom/tencent/mobileqq/persistence/fts/FTSDatatbase;
    //   757: aload 14
    //   759: iconst_1
    //   760: invokevirtual 400	com/tencent/mobileqq/persistence/fts/FTSDatatbase:a	(Ljava/util/ArrayList;I)I
    //   763: iconst_m1
    //   764: if_icmpne +137 -> 901
    //   767: ldc2_w 401
    //   770: invokestatic 408	java/lang/Thread:sleep	(J)V
    //   773: aload_0
    //   774: getfield 45	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase	Lcom/tencent/mobileqq/persistence/fts/FTSDatatbase;
    //   777: aload 14
    //   779: iconst_1
    //   780: invokevirtual 400	com/tencent/mobileqq/persistence/fts/FTSDatatbase:a	(Ljava/util/ArrayList;I)I
    //   783: istore_3
    //   784: invokestatic 184	java/lang/System:nanoTime	()J
    //   787: lload 8
    //   789: lsub
    //   790: ldc2_w 203
    //   793: ldiv
    //   794: lstore 4
    //   796: aload_0
    //   797: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   800: lload 6
    //   802: lload 4
    //   804: invokestatic 207	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;JJ)J
    //   807: pop2
    //   808: iload_3
    //   809: iconst_m1
    //   810: if_icmpne +55 -> 865
    //   813: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   816: ifeq +12 -> 828
    //   819: ldc 16
    //   821: iconst_2
    //   822: ldc_w 410
    //   825: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   828: aload_0
    //   829: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   832: invokevirtual 126	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   835: invokestatic 131	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   838: aconst_null
    //   839: ldc_w 412
    //   842: iconst_0
    //   843: ldc2_w 54
    //   846: lconst_0
    //   847: aconst_null
    //   848: aconst_null
    //   849: iconst_0
    //   850: invokevirtual 139	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   853: iconst_0
    //   854: ireturn
    //   855: astore 10
    //   857: aload 10
    //   859: invokevirtual 413	java/lang/InterruptedException:printStackTrace	()V
    //   862: goto -89 -> 773
    //   865: aload_0
    //   866: aload_0
    //   867: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   870: iconst_1
    //   871: iadd
    //   872: putfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   875: aload_0
    //   876: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   879: iload_1
    //   880: iconst_1
    //   881: invokestatic 416	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;II)I
    //   884: pop
    //   885: aload_0
    //   886: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   889: iload_2
    //   890: aload 14
    //   892: invokevirtual 383	java/util/ArrayList:size	()I
    //   895: invokestatic 418	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:b	(Lcom/tencent/mobileqq/app/QQAppInterface;II)I
    //   898: pop
    //   899: iconst_1
    //   900: ireturn
    //   901: invokestatic 184	java/lang/System:nanoTime	()J
    //   904: lload 8
    //   906: lsub
    //   907: ldc2_w 203
    //   910: ldiv
    //   911: lstore 4
    //   913: aload_0
    //   914: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   917: lload 6
    //   919: lload 4
    //   921: invokestatic 207	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;JJ)J
    //   924: pop2
    //   925: aload_0
    //   926: aload_0
    //   927: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   930: iconst_1
    //   931: iadd
    //   932: putfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   935: goto -60 -> 875
    //   938: astore 10
    //   940: aload 12
    //   942: astore 11
    //   944: aload 10
    //   946: astore 12
    //   948: aload 11
    //   950: astore 10
    //   952: aload 12
    //   954: invokevirtual 240	java/lang/Exception:printStackTrace	()V
    //   957: aload 11
    //   959: astore 10
    //   961: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   964: ifeq +18 -> 982
    //   967: aload 11
    //   969: astore 10
    //   971: ldc 16
    //   973: iconst_2
    //   974: ldc_w 420
    //   977: aload 12
    //   979: invokestatic 246	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   982: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   985: ifeq +46 -> 1031
    //   988: ldc 16
    //   990: iconst_2
    //   991: new 150	java/lang/StringBuilder
    //   994: dup
    //   995: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   998: ldc_w 380
    //   1001: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1004: aload 14
    //   1006: invokevirtual 383	java/util/ArrayList:size	()I
    //   1009: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1012: ldc_w 385
    //   1015: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1018: aload_0
    //   1019: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   1022: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1025: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1028: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1031: aload 11
    //   1033: ifnull +8 -> 1041
    //   1036: aload 11
    //   1038: invokevirtual 387	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   1041: iconst_0
    //   1042: ireturn
    //   1043: astore 12
    //   1045: aload 10
    //   1047: astore 11
    //   1049: aload 12
    //   1051: astore 10
    //   1053: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1056: ifeq +46 -> 1102
    //   1059: ldc 16
    //   1061: iconst_2
    //   1062: new 150	java/lang/StringBuilder
    //   1065: dup
    //   1066: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   1069: ldc_w 380
    //   1072: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1075: aload 14
    //   1077: invokevirtual 383	java/util/ArrayList:size	()I
    //   1080: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1083: ldc_w 385
    //   1086: invokevirtual 157	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1089: aload_0
    //   1090: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   1093: invokevirtual 165	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1096: invokevirtual 171	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1099: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1102: aload 11
    //   1104: ifnull +8 -> 1112
    //   1107: aload 11
    //   1109: invokevirtual 387	com/tencent/mobileqq/persistence/MessageRecordEntityManager:a	()V
    //   1112: aload_0
    //   1113: getfield 45	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase	Lcom/tencent/mobileqq/persistence/fts/FTSDatatbase;
    //   1116: aload 14
    //   1118: iconst_1
    //   1119: invokevirtual 400	com/tencent/mobileqq/persistence/fts/FTSDatatbase:a	(Ljava/util/ArrayList;I)I
    //   1122: iconst_m1
    //   1123: if_icmpne +138 -> 1261
    //   1126: ldc2_w 401
    //   1129: invokestatic 408	java/lang/Thread:sleep	(J)V
    //   1132: aload_0
    //   1133: getfield 45	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase	Lcom/tencent/mobileqq/persistence/fts/FTSDatatbase;
    //   1136: aload 14
    //   1138: iconst_1
    //   1139: invokevirtual 400	com/tencent/mobileqq/persistence/fts/FTSDatatbase:a	(Ljava/util/ArrayList;I)I
    //   1142: istore_3
    //   1143: invokestatic 184	java/lang/System:nanoTime	()J
    //   1146: lload 8
    //   1148: lsub
    //   1149: ldc2_w 203
    //   1152: ldiv
    //   1153: lstore 4
    //   1155: aload_0
    //   1156: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1159: lload 6
    //   1161: lload 4
    //   1163: invokestatic 207	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;JJ)J
    //   1166: pop2
    //   1167: iload_3
    //   1168: iconst_m1
    //   1169: if_icmpne +55 -> 1224
    //   1172: invokestatic 148	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1175: ifeq +12 -> 1187
    //   1178: ldc 16
    //   1180: iconst_2
    //   1181: ldc_w 410
    //   1184: invokestatic 174	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1187: aload_0
    //   1188: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1191: invokevirtual 126	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1194: invokestatic 131	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   1197: aconst_null
    //   1198: ldc_w 412
    //   1201: iconst_0
    //   1202: ldc2_w 54
    //   1205: lconst_0
    //   1206: aconst_null
    //   1207: aconst_null
    //   1208: iconst_0
    //   1209: invokevirtual 139	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   1212: iconst_0
    //   1213: ireturn
    //   1214: astore 11
    //   1216: aload 11
    //   1218: invokevirtual 413	java/lang/InterruptedException:printStackTrace	()V
    //   1221: goto -89 -> 1132
    //   1224: aload_0
    //   1225: aload_0
    //   1226: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   1229: iconst_1
    //   1230: iadd
    //   1231: putfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   1234: aload_0
    //   1235: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1238: iload_1
    //   1239: iconst_1
    //   1240: invokestatic 416	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;II)I
    //   1243: pop
    //   1244: aload_0
    //   1245: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1248: iload_2
    //   1249: aload 14
    //   1251: invokevirtual 383	java/util/ArrayList:size	()I
    //   1254: invokestatic 418	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:b	(Lcom/tencent/mobileqq/app/QQAppInterface;II)I
    //   1257: pop
    //   1258: aload 10
    //   1260: athrow
    //   1261: invokestatic 184	java/lang/System:nanoTime	()J
    //   1264: lload 8
    //   1266: lsub
    //   1267: ldc2_w 203
    //   1270: ldiv
    //   1271: lstore 4
    //   1273: aload_0
    //   1274: getfield 38	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1277: lload 6
    //   1279: lload 4
    //   1281: invokestatic 207	com/tencent/mobileqq/utils/fts/SQLiteFTSUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;JJ)J
    //   1284: pop2
    //   1285: aload_0
    //   1286: aload_0
    //   1287: getfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   1290: iconst_1
    //   1291: iadd
    //   1292: putfield 52	com/tencent/mobileqq/app/proxy/fts/FTSMsgUpgrader:jdField_b_of_type_Int	I
    //   1295: goto -61 -> 1234
    //   1298: astore 10
    //   1300: goto -247 -> 1053
    //   1303: astore 12
    //   1305: goto -357 -> 948
    //   1308: aconst_null
    //   1309: astore 10
    //   1311: ldc2_w 54
    //   1314: lstore 4
    //   1316: goto -1134 -> 182
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1319	0	this	FTSMsgUpgrader
    //   40	1199	1	i	int
    //   48	1201	2	j	int
    //   684	486	3	k	int
    //   180	1135	4	l1	long
    //   56	1222	6	l2	long
    //   61	1204	8	l3	long
    //   16	443	10	localObject1	Object
    //   530	30	10	localThrowable	Throwable
    //   689	1	10	localInteger	Integer
    //   855	3	10	localInterruptedException1	InterruptedException
    //   938	7	10	localException1	Exception
    //   950	309	10	localObject2	Object
    //   1298	1	10	localObject3	Object
    //   1309	1	10	localObject4	Object
    //   76	1032	11	localObject5	Object
    //   1214	3	11	localInterruptedException2	InterruptedException
    //   19	959	12	localObject6	Object
    //   1043	7	12	localObject7	Object
    //   1303	1	12	localException2	Exception
    //   239	439	13	localList	java.util.List
    //   31	1219	14	localArrayList	java.util.ArrayList
    // Exception table:
    //   from	to	target	type
    //   519	527	530	java/lang/Throwable
    //   767	773	855	java/lang/InterruptedException
    //   63	78	938	java/lang/Exception
    //   63	78	1043	finally
    //   952	957	1043	finally
    //   961	967	1043	finally
    //   971	982	1043	finally
    //   1126	1132	1214	java/lang/InterruptedException
    //   78	122	1298	finally
    //   127	182	1298	finally
    //   187	194	1298	finally
    //   194	238	1298	finally
    //   261	340	1298	finally
    //   340	369	1298	finally
    //   373	394	1298	finally
    //   404	420	1298	finally
    //   429	448	1298	finally
    //   448	504	1298	finally
    //   509	519	1298	finally
    //   519	527	1298	finally
    //   532	570	1298	finally
    //   631	674	1298	finally
    //   677	685	1298	finally
    //   78	122	1303	java/lang/Exception
    //   127	182	1303	java/lang/Exception
    //   187	194	1303	java/lang/Exception
    //   194	238	1303	java/lang/Exception
    //   261	340	1303	java/lang/Exception
    //   340	369	1303	java/lang/Exception
    //   373	394	1303	java/lang/Exception
    //   404	420	1303	java/lang/Exception
    //   429	448	1303	java/lang/Exception
    //   448	504	1303	java/lang/Exception
    //   509	519	1303	java/lang/Exception
    //   519	527	1303	java/lang/Exception
    //   532	570	1303	java/lang/Exception
    //   631	674	1303	java/lang/Exception
    //   677	685	1303	java/lang/Exception
  }
  
  public void a()
  {
    jdField_b_of_type_Boolean = true;
  }
  
  public boolean a()
  {
    return !SQLiteFTSUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  public boolean b()
  {
    if (SQLiteFTSUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.FTSMsgUpgrader", 2, "========== upgrade log has complete");
      }
      return c();
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.FTSMsgUpgrader", 2, "========== upgrade log start");
    }
    long l3 = SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    long l4 = System.nanoTime();
    for (;;)
    {
      try
      {
        SQLiteDatabase localSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b();
        Object localObject3 = localSQLiteDatabase.a();
        boolean bool1;
        long l1;
        if ((localObject3 == null) || (localObject3.length == 0))
        {
          SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
          bool1 = c();
          return bool1;
        }
        HashMap localHashMap = new HashMap();
        int j = localObject3.length;
        int i = 0;
        String str;
        Cursor localCursor;
        if (i < j)
        {
          str = localObject3[i];
          if ((str.endsWith("_New")) && ((str.startsWith("mr_friend_")) || (str.startsWith("mr_troop_")) || (str.startsWith("mr_discusssion_")) || (str.startsWith("mr_contact_")) || (str.startsWith("mr_devicemsg_"))))
          {
            localCursor = localSQLiteDatabase.a("SELECT max(_id) AS MAX_ID FROM " + str + ";", null);
            if ((localCursor != null) && (localCursor.getCount() == 1))
            {
              localCursor.moveToNext();
              localHashMap.put(str, Long.valueOf(localCursor.getLong(localCursor.getColumnIndex("MAX_ID"))));
            }
            if (localCursor != null) {
              localCursor.close();
            }
          }
        }
        else if (QLog.isColorLevel())
        {
          localObject3 = localHashMap.keySet().iterator();
          if (((Iterator)localObject3).hasNext())
          {
            str = (String)((Iterator)localObject3).next();
            QLog.d("Q.fts.FTSMsgUpgrader", 2, "startUpgradeLogStep: msgUpgradeInfo[key=" + str + ", value=" + localHashMap.get(str) + "]");
            continue;
          }
        }
        long l2;
        boolean bool2;
        i += 1;
      }
      catch (Exception localException1)
      {
        localException1.printStackTrace();
        if (QLog.isColorLevel()) {
          QLog.e("Q.fts.FTSMsgUpgrader", 2, "startUpgradeLogStep: ", localException1);
        }
        return false;
        try
        {
          localException1.a("CREATE TABLE IF NOT EXISTS msg_upgrade_log(id INTEGER PRIMARY KEY AUTOINCREMENT, tablename TEXT, MAX_ID INTEGER);");
          localObject3 = localHashMap.keySet().iterator();
          if (((Iterator)localObject3).hasNext())
          {
            str = (String)((Iterator)localObject3).next();
            localCursor = localException1.a("msg_upgrade_log", new String[] { "id" }, "tablename=?", new String[] { str }, null, null);
            l2 = -1L;
            l1 = l2;
            if (localCursor != null)
            {
              l1 = l2;
              if (localCursor.getCount() == 1)
              {
                localCursor.moveToNext();
                l1 = localCursor.getLong(localCursor.getColumnIndex("id"));
              }
            }
            if (localCursor != null) {
              localCursor.close();
            }
            if (a(l1, str, ((Long)localHashMap.get(str)).longValue(), localException1) != -1L) {
              continue;
            }
            Thread.sleep(5L);
            if (a(l1, str, ((Long)localHashMap.get(str)).longValue(), localException1) != -1L) {
              continue;
            }
            StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).a(null, "actFTSUpgradeLogFailure", false, -1L, 0L, null, null, false);
            return false;
          }
          SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
          bool1 = c();
        }
        catch (Exception localException2)
        {
          localException2 = localException2;
          bool2 = false;
          localException2.printStackTrace();
          bool1 = bool2;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.e("Q.fts.FTSMsgUpgrader", 2, "startUpgradeLogStep: ", localException2);
          bool1 = bool2;
          continue;
        }
        finally {}
        return bool1;
      }
      finally
      {
        l1 = (System.nanoTime() - l4) / 1000L;
        SQLiteFTSUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l3, l1);
      }
    }
  }
}
