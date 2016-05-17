package com.tencent.mobileqq.activity.qwallet;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;

public class PasswdRedBagDBManager
{
  private Context jdField_a_of_type_AndroidContentContext;
  private SQLiteDatabase jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase;
  private PasswdRedBagDBHelper jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper;
  private PasswdRedBagManager jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagManager;
  private String jdField_a_of_type_JavaLangString;
  
  public PasswdRedBagDBManager(PasswdRedBagManager paramPasswdRedBagManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper = new PasswdRedBagDBHelper(jdField_a_of_type_AndroidContentContext, e);
    jdField_a_of_type_AndroidContentContext = jdField_a_of_type_AndroidContentContext;
    jdField_a_of_type_JavaLangString = e;
    jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagManager = paramPasswdRedBagManager;
  }
  
  /* Error */
  public java.util.HashMap a()
  {
    // Byte code:
    //   0: new 46	java/util/HashMap
    //   3: dup
    //   4: invokespecial 47	java/util/HashMap:<init>	()V
    //   7: astore 8
    //   9: aload_0
    //   10: aload_0
    //   11: getfield 35	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper	Lcom/tencent/mobileqq/activity/qwallet/PasswdRedBagDBHelper;
    //   14: invokevirtual 51	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   17: putfield 53	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   20: aload_0
    //   21: getfield 53	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   24: ldc 55
    //   26: iconst_4
    //   27: anewarray 57	java/lang/String
    //   30: dup
    //   31: iconst_0
    //   32: ldc 59
    //   34: aastore
    //   35: dup
    //   36: iconst_1
    //   37: ldc 61
    //   39: aastore
    //   40: dup
    //   41: iconst_2
    //   42: ldc 63
    //   44: aastore
    //   45: dup
    //   46: iconst_3
    //   47: ldc 65
    //   49: aastore
    //   50: aconst_null
    //   51: aconst_null
    //   52: aconst_null
    //   53: aconst_null
    //   54: aconst_null
    //   55: invokevirtual 71	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   58: astore 6
    //   60: aload 6
    //   62: ifnull +241 -> 303
    //   65: aload 6
    //   67: astore 5
    //   69: aload 6
    //   71: ldc 59
    //   73: invokeinterface 77 2 0
    //   78: istore_1
    //   79: aload 6
    //   81: astore 5
    //   83: aload 6
    //   85: ldc 61
    //   87: invokeinterface 77 2 0
    //   92: istore_2
    //   93: aload 6
    //   95: astore 5
    //   97: aload 6
    //   99: ldc 63
    //   101: invokeinterface 77 2 0
    //   106: istore_3
    //   107: aload 6
    //   109: astore 5
    //   111: aload 6
    //   113: ldc 65
    //   115: invokeinterface 77 2 0
    //   120: istore 4
    //   122: aload 6
    //   124: astore 5
    //   126: aload 6
    //   128: invokeinterface 81 1 0
    //   133: ifeq +170 -> 303
    //   136: aload 6
    //   138: astore 5
    //   140: new 83	java/lang/StringBuilder
    //   143: dup
    //   144: invokespecial 84	java/lang/StringBuilder:<init>	()V
    //   147: astore 7
    //   149: aload 6
    //   151: astore 5
    //   153: aload 7
    //   155: aload 6
    //   157: iload_3
    //   158: invokeinterface 88 2 0
    //   163: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: pop
    //   167: aload 6
    //   169: astore 5
    //   171: aload 7
    //   173: ldc 94
    //   175: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   178: pop
    //   179: aload 6
    //   181: astore 5
    //   183: aload 7
    //   185: aload 6
    //   187: iload_2
    //   188: invokeinterface 88 2 0
    //   193: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: pop
    //   197: aload 6
    //   199: astore 5
    //   201: aload 7
    //   203: ldc 94
    //   205: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   208: pop
    //   209: aload 6
    //   211: astore 5
    //   213: aload 7
    //   215: aload 6
    //   217: iload_1
    //   218: invokeinterface 88 2 0
    //   223: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: pop
    //   227: aload 6
    //   229: astore 5
    //   231: aload 8
    //   233: aload 7
    //   235: invokevirtual 98	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   238: aload 6
    //   240: iload 4
    //   242: invokeinterface 88 2 0
    //   247: invokevirtual 102	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   250: pop
    //   251: goto -129 -> 122
    //   254: astore 7
    //   256: aload 6
    //   258: astore 5
    //   260: invokestatic 107	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   263: ifeq +16 -> 279
    //   266: aload 6
    //   268: astore 5
    //   270: getstatic 108	com/tencent/mobileqq/activity/qwallet/PasswdRedBagManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   273: iconst_2
    //   274: ldc 110
    //   276: invokestatic 114	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   279: aload 6
    //   281: astore 5
    //   283: aload 7
    //   285: invokevirtual 117	java/lang/Exception:printStackTrace	()V
    //   288: aload 6
    //   290: ifnull +10 -> 300
    //   293: aload 6
    //   295: invokeinterface 120 1 0
    //   300: aload 8
    //   302: areturn
    //   303: aload 6
    //   305: ifnull -5 -> 300
    //   308: aload 6
    //   310: invokeinterface 120 1 0
    //   315: aload 8
    //   317: areturn
    //   318: astore 6
    //   320: aconst_null
    //   321: astore 5
    //   323: aload 5
    //   325: ifnull +10 -> 335
    //   328: aload 5
    //   330: invokeinterface 120 1 0
    //   335: aload 6
    //   337: athrow
    //   338: astore 6
    //   340: goto -17 -> 323
    //   343: astore 7
    //   345: aconst_null
    //   346: astore 6
    //   348: goto -92 -> 256
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	351	0	this	PasswdRedBagDBManager
    //   78	140	1	i	int
    //   92	96	2	j	int
    //   106	52	3	k	int
    //   120	121	4	m	int
    //   67	262	5	localCursor1	android.database.Cursor
    //   58	251	6	localCursor2	android.database.Cursor
    //   318	18	6	localObject1	Object
    //   338	1	6	localObject2	Object
    //   346	1	6	localObject3	Object
    //   147	87	7	localStringBuilder	StringBuilder
    //   254	30	7	localException1	Exception
    //   343	1	7	localException2	Exception
    //   7	309	8	localHashMap	java.util.HashMap
    // Exception table:
    //   from	to	target	type
    //   69	79	254	java/lang/Exception
    //   83	93	254	java/lang/Exception
    //   97	107	254	java/lang/Exception
    //   111	122	254	java/lang/Exception
    //   126	136	254	java/lang/Exception
    //   140	149	254	java/lang/Exception
    //   153	167	254	java/lang/Exception
    //   171	179	254	java/lang/Exception
    //   183	197	254	java/lang/Exception
    //   201	209	254	java/lang/Exception
    //   213	227	254	java/lang/Exception
    //   231	251	254	java/lang/Exception
    //   9	60	318	finally
    //   69	79	338	finally
    //   83	93	338	finally
    //   97	107	338	finally
    //   111	122	338	finally
    //   126	136	338	finally
    //   140	149	338	finally
    //   153	167	338	finally
    //   171	179	338	finally
    //   183	197	338	finally
    //   201	209	338	finally
    //   213	227	338	finally
    //   231	251	338	finally
    //   260	266	338	finally
    //   270	279	338	finally
    //   283	288	338	finally
    //   9	60	343	java/lang/Exception
  }
  
  /* Error */
  public List a()
  {
    // Byte code:
    //   0: new 123	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 124	java/util/ArrayList:<init>	()V
    //   7: astore 12
    //   9: aload_0
    //   10: aload_0
    //   11: getfield 35	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper	Lcom/tencent/mobileqq/activity/qwallet/PasswdRedBagDBHelper;
    //   14: invokevirtual 51	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   17: putfield 53	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   20: aload_0
    //   21: getfield 53	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   24: ldc 126
    //   26: bipush 7
    //   28: anewarray 57	java/lang/String
    //   31: dup
    //   32: iconst_0
    //   33: ldc 59
    //   35: aastore
    //   36: dup
    //   37: iconst_1
    //   38: ldc -128
    //   40: aastore
    //   41: dup
    //   42: iconst_2
    //   43: ldc -126
    //   45: aastore
    //   46: dup
    //   47: iconst_3
    //   48: ldc -124
    //   50: aastore
    //   51: dup
    //   52: iconst_4
    //   53: ldc -122
    //   55: aastore
    //   56: dup
    //   57: iconst_5
    //   58: ldc -120
    //   60: aastore
    //   61: dup
    //   62: bipush 6
    //   64: ldc -118
    //   66: aastore
    //   67: aconst_null
    //   68: aconst_null
    //   69: aconst_null
    //   70: aconst_null
    //   71: ldc -116
    //   73: invokevirtual 71	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   76: astore 10
    //   78: aload 10
    //   80: ifnull +378 -> 458
    //   83: aload 10
    //   85: astore 9
    //   87: aload 10
    //   89: ldc 59
    //   91: invokeinterface 77 2 0
    //   96: istore_1
    //   97: aload 10
    //   99: astore 9
    //   101: aload 10
    //   103: ldc -128
    //   105: invokeinterface 77 2 0
    //   110: istore_2
    //   111: aload 10
    //   113: astore 9
    //   115: aload 10
    //   117: ldc -126
    //   119: invokeinterface 77 2 0
    //   124: istore_3
    //   125: aload 10
    //   127: astore 9
    //   129: aload 10
    //   131: ldc -124
    //   133: invokeinterface 77 2 0
    //   138: istore 4
    //   140: aload 10
    //   142: astore 9
    //   144: aload 10
    //   146: ldc -122
    //   148: invokeinterface 77 2 0
    //   153: istore 5
    //   155: aload 10
    //   157: astore 9
    //   159: aload 10
    //   161: ldc -120
    //   163: invokeinterface 77 2 0
    //   168: istore 6
    //   170: aload 10
    //   172: astore 9
    //   174: aload 10
    //   176: ldc -118
    //   178: invokeinterface 77 2 0
    //   183: istore 7
    //   185: aload 10
    //   187: astore 9
    //   189: aload 10
    //   191: invokeinterface 81 1 0
    //   196: ifeq +262 -> 458
    //   199: aload 10
    //   201: astore 9
    //   203: new 142	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo
    //   206: dup
    //   207: invokespecial 143	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:<init>	()V
    //   210: astore 11
    //   212: aload 10
    //   214: astore 9
    //   216: aload 10
    //   218: iload 6
    //   220: invokeinterface 147 2 0
    //   225: iconst_1
    //   226: if_icmpne +214 -> 440
    //   229: iconst_1
    //   230: istore 8
    //   232: aload 10
    //   234: astore 9
    //   236: aload 11
    //   238: iload 8
    //   240: putfield 150	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_b_of_type_Boolean	Z
    //   243: aload 10
    //   245: astore 9
    //   247: aload 10
    //   249: iload 5
    //   251: invokeinterface 147 2 0
    //   256: iconst_1
    //   257: if_icmpne +189 -> 446
    //   260: iconst_1
    //   261: istore 8
    //   263: aload 10
    //   265: astore 9
    //   267: aload 11
    //   269: iload 8
    //   271: putfield 152	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_a_of_type_Boolean	Z
    //   274: aload 10
    //   276: astore 9
    //   278: aload 11
    //   280: aload 10
    //   282: iload 4
    //   284: invokeinterface 88 2 0
    //   289: putfield 155	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_c_of_type_JavaLangString	Ljava/lang/String;
    //   292: aload 10
    //   294: astore 9
    //   296: aload 11
    //   298: aload 10
    //   300: iload_1
    //   301: invokeinterface 88 2 0
    //   306: putfield 156	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   309: aload 10
    //   311: astore 9
    //   313: aload 11
    //   315: aload 10
    //   317: iload_2
    //   318: invokeinterface 88 2 0
    //   323: putfield 158	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   326: aload 10
    //   328: astore 9
    //   330: aload 11
    //   332: aload 10
    //   334: iload_3
    //   335: invokeinterface 162 2 0
    //   340: putfield 165	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_a_of_type_Long	J
    //   343: aload 10
    //   345: astore 9
    //   347: aload 10
    //   349: iload 7
    //   351: invokeinterface 147 2 0
    //   356: iconst_1
    //   357: if_icmpne +95 -> 452
    //   360: iconst_1
    //   361: istore 8
    //   363: aload 10
    //   365: astore 9
    //   367: aload 11
    //   369: iload 8
    //   371: putfield 167	com/tencent/mobileqq/activity/qwallet/PasswdRedBagInfo:jdField_c_of_type_Boolean	Z
    //   374: aload 10
    //   376: astore 9
    //   378: aload 12
    //   380: aload 11
    //   382: invokeinterface 173 2 0
    //   387: pop
    //   388: goto -203 -> 185
    //   391: astore 11
    //   393: aload 10
    //   395: astore 9
    //   397: invokestatic 107	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   400: ifeq +16 -> 416
    //   403: aload 10
    //   405: astore 9
    //   407: getstatic 108	com/tencent/mobileqq/activity/qwallet/PasswdRedBagManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   410: iconst_2
    //   411: ldc -81
    //   413: invokestatic 114	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   416: aload 10
    //   418: astore 9
    //   420: aload 11
    //   422: invokevirtual 117	java/lang/Exception:printStackTrace	()V
    //   425: aload 10
    //   427: ifnull +10 -> 437
    //   430: aload 10
    //   432: invokeinterface 120 1 0
    //   437: aload 12
    //   439: areturn
    //   440: iconst_0
    //   441: istore 8
    //   443: goto -211 -> 232
    //   446: iconst_0
    //   447: istore 8
    //   449: goto -186 -> 263
    //   452: iconst_0
    //   453: istore 8
    //   455: goto -92 -> 363
    //   458: aload 10
    //   460: ifnull -23 -> 437
    //   463: aload 10
    //   465: invokeinterface 120 1 0
    //   470: aload 12
    //   472: areturn
    //   473: astore 10
    //   475: aconst_null
    //   476: astore 9
    //   478: aload 9
    //   480: ifnull +10 -> 490
    //   483: aload 9
    //   485: invokeinterface 120 1 0
    //   490: aload 10
    //   492: athrow
    //   493: astore 10
    //   495: goto -17 -> 478
    //   498: astore 11
    //   500: aconst_null
    //   501: astore 10
    //   503: goto -110 -> 393
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	506	0	this	PasswdRedBagDBManager
    //   96	205	1	i	int
    //   110	208	2	j	int
    //   124	211	3	k	int
    //   138	145	4	m	int
    //   153	97	5	n	int
    //   168	51	6	i1	int
    //   183	167	7	i2	int
    //   230	224	8	bool	boolean
    //   85	399	9	localCursor1	android.database.Cursor
    //   76	388	10	localCursor2	android.database.Cursor
    //   473	18	10	localObject1	Object
    //   493	1	10	localObject2	Object
    //   501	1	10	localObject3	Object
    //   210	171	11	localPasswdRedBagInfo	PasswdRedBagInfo
    //   391	30	11	localException1	Exception
    //   498	1	11	localException2	Exception
    //   7	464	12	localArrayList	java.util.ArrayList
    // Exception table:
    //   from	to	target	type
    //   87	97	391	java/lang/Exception
    //   101	111	391	java/lang/Exception
    //   115	125	391	java/lang/Exception
    //   129	140	391	java/lang/Exception
    //   144	155	391	java/lang/Exception
    //   159	170	391	java/lang/Exception
    //   174	185	391	java/lang/Exception
    //   189	199	391	java/lang/Exception
    //   203	212	391	java/lang/Exception
    //   216	229	391	java/lang/Exception
    //   236	243	391	java/lang/Exception
    //   247	260	391	java/lang/Exception
    //   267	274	391	java/lang/Exception
    //   278	292	391	java/lang/Exception
    //   296	309	391	java/lang/Exception
    //   313	326	391	java/lang/Exception
    //   330	343	391	java/lang/Exception
    //   347	360	391	java/lang/Exception
    //   367	374	391	java/lang/Exception
    //   378	388	391	java/lang/Exception
    //   9	78	473	finally
    //   87	97	493	finally
    //   101	111	493	finally
    //   115	125	493	finally
    //   129	140	493	finally
    //   144	155	493	finally
    //   159	170	493	finally
    //   174	185	493	finally
    //   189	199	493	finally
    //   203	212	493	finally
    //   216	229	493	finally
    //   236	243	493	finally
    //   247	260	493	finally
    //   267	274	493	finally
    //   278	292	493	finally
    //   296	309	493	finally
    //   313	326	493	finally
    //   330	343	493	finally
    //   347	360	493	finally
    //   367	374	493	finally
    //   378	388	493	finally
    //   397	403	493	finally
    //   407	416	493	finally
    //   420	425	493	finally
    //   9	78	498	java/lang/Exception
  }
  
  /* Error */
  public List a(int paramInt)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: new 123	java/util/ArrayList
    //   6: dup
    //   7: invokespecial 124	java/util/ArrayList:<init>	()V
    //   10: astore 7
    //   12: aload_0
    //   13: aload_0
    //   14: getfield 35	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper	Lcom/tencent/mobileqq/activity/qwallet/PasswdRedBagDBHelper;
    //   17: invokevirtual 51	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   20: putfield 53	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   23: aload_0
    //   24: getfield 53	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   27: astore 4
    //   29: new 83	java/lang/StringBuilder
    //   32: dup
    //   33: invokespecial 84	java/lang/StringBuilder:<init>	()V
    //   36: iload_1
    //   37: invokevirtual 179	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   40: ldc -75
    //   42: invokevirtual 92	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   45: invokevirtual 98	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   48: astore 6
    //   50: aload 4
    //   52: ldc -73
    //   54: iconst_2
    //   55: anewarray 57	java/lang/String
    //   58: dup
    //   59: iconst_0
    //   60: ldc 61
    //   62: aastore
    //   63: dup
    //   64: iconst_1
    //   65: ldc -71
    //   67: aastore
    //   68: ldc -69
    //   70: iconst_1
    //   71: anewarray 57	java/lang/String
    //   74: dup
    //   75: iconst_0
    //   76: aload 6
    //   78: aastore
    //   79: aconst_null
    //   80: aconst_null
    //   81: aconst_null
    //   82: invokevirtual 71	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   85: astore 4
    //   87: aload 4
    //   89: astore 5
    //   91: aload 5
    //   93: ifnull +168 -> 261
    //   96: aload 5
    //   98: astore 4
    //   100: aload 5
    //   102: ldc 61
    //   104: invokeinterface 77 2 0
    //   109: istore_2
    //   110: aload 5
    //   112: astore 4
    //   114: aload 5
    //   116: ldc -71
    //   118: invokeinterface 77 2 0
    //   123: istore_3
    //   124: aload 5
    //   126: astore 4
    //   128: aload 5
    //   130: invokeinterface 81 1 0
    //   135: ifeq +126 -> 261
    //   138: aload 5
    //   140: astore 4
    //   142: new 189	com/tencent/mobileqq/activity/qwallet/PasswdRedBagUpdateInfo
    //   145: dup
    //   146: invokespecial 190	com/tencent/mobileqq/activity/qwallet/PasswdRedBagUpdateInfo:<init>	()V
    //   149: astore 6
    //   151: aload 5
    //   153: astore 4
    //   155: aload 6
    //   157: iload_1
    //   158: putfield 193	com/tencent/mobileqq/activity/qwallet/PasswdRedBagUpdateInfo:jdField_a_of_type_Int	I
    //   161: aload 5
    //   163: astore 4
    //   165: aload 6
    //   167: aload 5
    //   169: iload_2
    //   170: invokeinterface 162 2 0
    //   175: putfield 194	com/tencent/mobileqq/activity/qwallet/PasswdRedBagUpdateInfo:jdField_a_of_type_Long	J
    //   178: aload 5
    //   180: astore 4
    //   182: aload 6
    //   184: aload 5
    //   186: iload_3
    //   187: invokeinterface 162 2 0
    //   192: putfield 196	com/tencent/mobileqq/activity/qwallet/PasswdRedBagUpdateInfo:b	J
    //   195: aload 5
    //   197: astore 4
    //   199: aload 7
    //   201: aload 6
    //   203: invokeinterface 173 2 0
    //   208: pop
    //   209: goto -85 -> 124
    //   212: astore 6
    //   214: aload 5
    //   216: astore 4
    //   218: invokestatic 107	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   221: ifeq +16 -> 237
    //   224: aload 5
    //   226: astore 4
    //   228: getstatic 108	com/tencent/mobileqq/activity/qwallet/PasswdRedBagManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   231: iconst_2
    //   232: ldc -58
    //   234: invokestatic 114	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   237: aload 5
    //   239: astore 4
    //   241: aload 6
    //   243: invokevirtual 117	java/lang/Exception:printStackTrace	()V
    //   246: aload 5
    //   248: ifnull +10 -> 258
    //   251: aload 5
    //   253: invokeinterface 120 1 0
    //   258: aload 7
    //   260: areturn
    //   261: aload 5
    //   263: ifnull -5 -> 258
    //   266: aload 5
    //   268: invokeinterface 120 1 0
    //   273: aload 7
    //   275: areturn
    //   276: astore 4
    //   278: aload 5
    //   280: ifnull +10 -> 290
    //   283: aload 5
    //   285: invokeinterface 120 1 0
    //   290: aload 4
    //   292: athrow
    //   293: astore 6
    //   295: aload 4
    //   297: astore 5
    //   299: aload 6
    //   301: astore 4
    //   303: goto -25 -> 278
    //   306: astore 6
    //   308: aconst_null
    //   309: astore 5
    //   311: goto -97 -> 214
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	314	0	this	PasswdRedBagDBManager
    //   0	314	1	paramInt	int
    //   109	61	2	i	int
    //   123	64	3	j	int
    //   27	213	4	localObject1	Object
    //   276	20	4	localObject2	Object
    //   301	1	4	localObject3	Object
    //   1	309	5	localObject4	Object
    //   48	154	6	localObject5	Object
    //   212	30	6	localException1	Exception
    //   293	7	6	localObject6	Object
    //   306	1	6	localException2	Exception
    //   10	264	7	localArrayList	java.util.ArrayList
    // Exception table:
    //   from	to	target	type
    //   100	110	212	java/lang/Exception
    //   114	124	212	java/lang/Exception
    //   128	138	212	java/lang/Exception
    //   142	151	212	java/lang/Exception
    //   155	161	212	java/lang/Exception
    //   165	178	212	java/lang/Exception
    //   182	195	212	java/lang/Exception
    //   199	209	212	java/lang/Exception
    //   12	87	276	finally
    //   100	110	293	finally
    //   114	124	293	finally
    //   128	138	293	finally
    //   142	151	293	finally
    //   155	161	293	finally
    //   165	178	293	finally
    //   182	195	293	finally
    //   199	209	293	finally
    //   218	224	293	finally
    //   228	237	293	finally
    //   241	246	293	finally
    //   12	87	306	java/lang/Exception
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase != null) {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.close();
    }
  }
  
  public void a(PasswdRedBagInfo paramPasswdRedBagInfo)
  {
    int j = 1;
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("redbag_id", jdField_a_of_type_JavaLangString);
      localContentValues.put("uint64_creator_uin", jdField_b_of_type_JavaLangString);
      localContentValues.put("expire_time", Long.valueOf(jdField_a_of_type_Long));
      localContentValues.put("password", jdField_c_of_type_JavaLangString);
      if (jdField_a_of_type_Boolean)
      {
        i = 1;
        localContentValues.put("is_open", Integer.valueOf(i));
        if (!jdField_b_of_type_Boolean) {
          break label148;
        }
        i = 1;
        label98:
        localContentValues.put("is_finish", Integer.valueOf(i));
        if (!jdField_c_of_type_Boolean) {
          break label153;
        }
      }
      label148:
      label153:
      for (int i = j;; i = 0)
      {
        localContentValues.put("is_overdue", Integer.valueOf(i));
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.replace("red_bags", null, localContentValues);
        return;
        i = 0;
        break;
        i = 0;
        break label98;
      }
      return;
    }
    catch (Exception paramPasswdRedBagInfo)
    {
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "insertPasswdRedBag failed ");
      }
      paramPasswdRedBagInfo.printStackTrace();
    }
  }
  
  public void a(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("redbag_id", paramString3);
      localContentValues.put("source", paramString1);
      localContentValues.put("code", paramString2);
      localContentValues.put("authkey", paramString4);
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.replace("red_bag_relations", null, localContentValues);
      return;
    }
    catch (Exception paramString1)
    {
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "insertPasswdRedBagRelation failed ");
      }
      paramString1.printStackTrace();
    }
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    int i = 1;
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      if (paramBoolean) {}
      for (;;)
      {
        localContentValues.put("is_open", Integer.valueOf(i));
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.update("red_bags", localContentValues, "redbag_id=?", new String[] { paramString });
        return;
        i = 0;
      }
      return;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "setOpen failed ");
      }
      paramString.printStackTrace();
    }
  }
  
  public void a(List paramList)
  {
    for (;;)
    {
      try
      {
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.beginTransaction();
        paramList = paramList.iterator();
        if (!paramList.hasNext()) {
          continue;
        }
        localPasswdRedBagInfo = (PasswdRedBagInfo)paramList.next();
        localContentValues = new ContentValues();
        localContentValues.put("redbag_id", jdField_a_of_type_JavaLangString);
        localContentValues.put("uint64_creator_uin", jdField_b_of_type_JavaLangString);
        localContentValues.put("expire_time", Long.valueOf(jdField_a_of_type_Long));
        localContentValues.put("password", jdField_c_of_type_JavaLangString);
        if (!jdField_a_of_type_Boolean) {
          continue;
        }
        i = 1;
      }
      catch (Exception paramList)
      {
        PasswdRedBagInfo localPasswdRedBagInfo;
        ContentValues localContentValues;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "insertPasswdRedBags failed ");
        paramList.printStackTrace();
        return;
        int i = 0;
        continue;
        i = 0;
        continue;
        i = 0;
        continue;
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.setTransactionSuccessful();
        return;
      }
      finally
      {
        if (!jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.inTransaction()) {
          continue;
        }
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.endTransaction();
      }
      localContentValues.put("is_open", Integer.valueOf(i));
      if (!jdField_b_of_type_Boolean) {
        continue;
      }
      i = 1;
      localContentValues.put("is_finish", Integer.valueOf(i));
      if (!jdField_c_of_type_Boolean) {
        continue;
      }
      i = 1;
      localContentValues.put("is_overdue", Integer.valueOf(i));
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.replace("red_bags", null, localContentValues);
    }
  }
  
  public void b()
  {
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      long l = NetConnInfoCenter.getServerTimeMillis() / 1000L;
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.delete("red_bags", "expire_time < ?", new String[] { String.valueOf(l - 604800L) });
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "clearExpirePasswdRedBag failed ");
      }
      localException.printStackTrace();
    }
  }
  
  public void b(String paramString, boolean paramBoolean)
  {
    int i = 1;
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      if (paramBoolean) {}
      for (;;)
      {
        localContentValues.put("is_finish", Integer.valueOf(i));
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.update("red_bags", localContentValues, "redbag_id=?", new String[] { paramString });
        return;
        i = 0;
      }
      return;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "setFinish failed ");
      }
      paramString.printStackTrace();
    }
  }
  
  public void b(List paramList)
  {
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.beginTransaction();
      ContentValues localContentValues = new ContentValues();
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        PasswdRedBagUpdateInfo localPasswdRedBagUpdateInfo = (PasswdRedBagUpdateInfo)paramList.next();
        localContentValues.clear();
        localContentValues.put("code", Long.valueOf(jdField_a_of_type_Long));
        localContentValues.put("source", Integer.valueOf(jdField_a_of_type_Int));
        localContentValues.put("last_update_time", Long.valueOf(b));
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.replace("update_times", null, localContentValues);
      }
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.setTransactionSuccessful();
    }
    finally
    {
      if (jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.inTransaction()) {
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.endTransaction();
      }
    }
    if (jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.inTransaction()) {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.endTransaction();
    }
  }
  
  /* Error */
  public void c()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 18
    //   3: aconst_null
    //   4: astore 19
    //   6: aload_0
    //   7: getfield 36	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   10: ldc_w 297
    //   13: invokevirtual 303	android/content/Context:getDatabasePath	(Ljava/lang/String;)Ljava/io/File;
    //   16: astore 20
    //   18: aload 20
    //   20: invokevirtual 308	java/io/File:exists	()Z
    //   23: istore 12
    //   25: iload 12
    //   27: ifne +28 -> 55
    //   30: iconst_0
    //   31: ifeq +11 -> 42
    //   34: new 310	java/lang/NullPointerException
    //   37: dup
    //   38: invokespecial 311	java/lang/NullPointerException:<init>	()V
    //   41: athrow
    //   42: iconst_0
    //   43: ifeq +11 -> 54
    //   46: new 310	java/lang/NullPointerException
    //   49: dup
    //   50: invokespecial 311	java/lang/NullPointerException:<init>	()V
    //   53: athrow
    //   54: return
    //   55: aload 20
    //   57: invokevirtual 314	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   60: aconst_null
    //   61: iconst_0
    //   62: invokestatic 318	android/database/sqlite/SQLiteDatabase:openDatabase	(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;
    //   65: astore 20
    //   67: aload 20
    //   69: astore 18
    //   71: aload 18
    //   73: ifnonnull +26 -> 99
    //   76: iconst_0
    //   77: ifeq +11 -> 88
    //   80: new 310	java/lang/NullPointerException
    //   83: dup
    //   84: invokespecial 311	java/lang/NullPointerException:<init>	()V
    //   87: athrow
    //   88: aload 18
    //   90: ifnull -36 -> 54
    //   93: aload 18
    //   95: invokevirtual 199	android/database/sqlite/SQLiteDatabase:close	()V
    //   98: return
    //   99: aload 18
    //   101: ldc_w 320
    //   104: iconst_1
    //   105: anewarray 57	java/lang/String
    //   108: dup
    //   109: iconst_0
    //   110: aload_0
    //   111: getfield 38	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   114: aastore
    //   115: invokevirtual 324	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   118: astore 20
    //   120: aload 20
    //   122: ifnull +322 -> 444
    //   125: aload 20
    //   127: ldc 59
    //   129: invokeinterface 77 2 0
    //   134: istore 5
    //   136: aload 20
    //   138: ldc -128
    //   140: invokeinterface 77 2 0
    //   145: istore 10
    //   147: aload 20
    //   149: ldc -126
    //   151: invokeinterface 77 2 0
    //   156: istore 8
    //   158: aload 20
    //   160: ldc -124
    //   162: invokeinterface 77 2 0
    //   167: istore 7
    //   169: aload 20
    //   171: ldc 65
    //   173: invokeinterface 77 2 0
    //   178: istore_1
    //   179: aload 20
    //   181: ldc 61
    //   183: invokeinterface 77 2 0
    //   188: istore 6
    //   190: aload 20
    //   192: ldc 63
    //   194: invokeinterface 77 2 0
    //   199: istore_2
    //   200: aload 20
    //   202: ldc -122
    //   204: invokeinterface 77 2 0
    //   209: istore 9
    //   211: aload 20
    //   213: ldc -120
    //   215: invokeinterface 77 2 0
    //   220: istore_3
    //   221: aload 20
    //   223: invokeinterface 81 1 0
    //   228: ifeq +216 -> 444
    //   231: aload_0
    //   232: getfield 40	com/tencent/mobileqq/activity/qwallet/PasswdRedBagDBManager:jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagManager	Lcom/tencent/mobileqq/activity/qwallet/PasswdRedBagManager;
    //   235: astore 19
    //   237: aload 20
    //   239: iload 5
    //   241: invokeinterface 88 2 0
    //   246: astore 22
    //   248: aload 20
    //   250: iload 7
    //   252: invokeinterface 88 2 0
    //   257: astore 23
    //   259: aload 20
    //   261: iload 10
    //   263: invokeinterface 162 2 0
    //   268: lstore 14
    //   270: aload 20
    //   272: iload 8
    //   274: invokeinterface 162 2 0
    //   279: lstore 16
    //   281: aload 20
    //   283: iload_2
    //   284: invokeinterface 147 2 0
    //   289: istore 11
    //   291: aload 20
    //   293: iload 6
    //   295: invokeinterface 147 2 0
    //   300: istore 4
    //   302: aload 20
    //   304: iload_1
    //   305: invokeinterface 88 2 0
    //   310: astore 21
    //   312: aload 20
    //   314: iload 9
    //   316: invokeinterface 147 2 0
    //   321: iconst_1
    //   322: if_icmpne +110 -> 432
    //   325: iconst_1
    //   326: istore 12
    //   328: aload 20
    //   330: iload_3
    //   331: invokeinterface 147 2 0
    //   336: iconst_1
    //   337: if_icmpne +101 -> 438
    //   340: iconst_1
    //   341: istore 13
    //   343: aload 19
    //   345: aload 22
    //   347: aload 23
    //   349: lload 14
    //   351: invokestatic 284	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   354: lload 16
    //   356: iload 11
    //   358: invokestatic 326	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   361: iload 4
    //   363: invokestatic 326	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   366: aload 21
    //   368: iload 12
    //   370: iload 13
    //   372: invokevirtual 329	com/tencent/mobileqq/activity/qwallet/PasswdRedBagManager:a	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    //   375: goto -154 -> 221
    //   378: astore 21
    //   380: aload 20
    //   382: astore 19
    //   384: aload 21
    //   386: astore 20
    //   388: invokestatic 107	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   391: ifeq +13 -> 404
    //   394: getstatic 108	com/tencent/mobileqq/activity/qwallet/PasswdRedBagManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   397: iconst_2
    //   398: ldc_w 331
    //   401: invokestatic 114	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   404: aload 20
    //   406: invokevirtual 117	java/lang/Exception:printStackTrace	()V
    //   409: aload 19
    //   411: ifnull +10 -> 421
    //   414: aload 19
    //   416: invokeinterface 120 1 0
    //   421: aload 18
    //   423: ifnull -369 -> 54
    //   426: aload 18
    //   428: invokevirtual 199	android/database/sqlite/SQLiteDatabase:close	()V
    //   431: return
    //   432: iconst_0
    //   433: istore 12
    //   435: goto -107 -> 328
    //   438: iconst_0
    //   439: istore 13
    //   441: goto -98 -> 343
    //   444: aload 20
    //   446: ifnull +10 -> 456
    //   449: aload 20
    //   451: invokeinterface 120 1 0
    //   456: aload 18
    //   458: ifnull -404 -> 54
    //   461: aload 18
    //   463: invokevirtual 199	android/database/sqlite/SQLiteDatabase:close	()V
    //   466: return
    //   467: astore 19
    //   469: aconst_null
    //   470: astore 20
    //   472: aconst_null
    //   473: astore 18
    //   475: aload 20
    //   477: ifnull +10 -> 487
    //   480: aload 20
    //   482: invokeinterface 120 1 0
    //   487: aload 18
    //   489: ifnull +8 -> 497
    //   492: aload 18
    //   494: invokevirtual 199	android/database/sqlite/SQLiteDatabase:close	()V
    //   497: aload 19
    //   499: athrow
    //   500: astore 19
    //   502: aconst_null
    //   503: astore 20
    //   505: goto -30 -> 475
    //   508: astore 19
    //   510: goto -35 -> 475
    //   513: astore 21
    //   515: aload 19
    //   517: astore 20
    //   519: aload 21
    //   521: astore 19
    //   523: goto -48 -> 475
    //   526: astore 20
    //   528: goto -140 -> 388
    //   531: astore 20
    //   533: goto -145 -> 388
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	536	0	this	PasswdRedBagDBManager
    //   178	127	1	i	int
    //   199	85	2	j	int
    //   220	111	3	k	int
    //   300	62	4	m	int
    //   134	106	5	n	int
    //   188	106	6	i1	int
    //   167	84	7	i2	int
    //   156	117	8	i3	int
    //   209	106	9	i4	int
    //   145	117	10	i5	int
    //   289	68	11	i6	int
    //   23	411	12	bool1	boolean
    //   341	99	13	bool2	boolean
    //   268	82	14	l1	long
    //   279	76	16	l2	long
    //   1	492	18	localObject1	Object
    //   4	411	19	localObject2	Object
    //   467	31	19	localObject3	Object
    //   500	1	19	localObject4	Object
    //   508	8	19	localObject5	Object
    //   521	1	19	localObject6	Object
    //   16	502	20	localObject7	Object
    //   526	1	20	localException1	Exception
    //   531	1	20	localException2	Exception
    //   310	57	21	str1	String
    //   378	7	21	localException3	Exception
    //   513	7	21	localObject8	Object
    //   246	100	22	str2	String
    //   257	91	23	str3	String
    // Exception table:
    //   from	to	target	type
    //   125	221	378	java/lang/Exception
    //   221	325	378	java/lang/Exception
    //   328	340	378	java/lang/Exception
    //   343	375	378	java/lang/Exception
    //   6	25	467	finally
    //   55	67	467	finally
    //   99	120	500	finally
    //   125	221	508	finally
    //   221	325	508	finally
    //   328	340	508	finally
    //   343	375	508	finally
    //   388	404	513	finally
    //   404	409	513	finally
    //   6	25	526	java/lang/Exception
    //   55	67	526	java/lang/Exception
    //   99	120	531	java/lang/Exception
  }
  
  public void c(String paramString, boolean paramBoolean)
  {
    int i = 1;
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBHelper.getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      if (paramBoolean) {}
      for (;;)
      {
        localContentValues.put("is_overdue", Integer.valueOf(i));
        jdField_a_of_type_AndroidDatabaseSqliteSQLiteDatabase.update("red_bags", localContentValues, "redbag_id=?", new String[] { paramString });
        return;
        i = 0;
      }
      return;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.jdField_a_of_type_JavaLangString, 2, "setOverDue failed ");
      }
      paramString.printStackTrace();
    }
  }
}
