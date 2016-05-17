package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ActivityDAUReport
  extends AsyncStep
{
  public ActivityDAUReport()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  protected int a()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 22	com/tencent/mobileqq/app/automator/step/ActivityDAUReport:a	Lcom/tencent/mobileqq/app/automator/Automator;
    //   4: getfield 27	com/tencent/mobileqq/app/automator/Automator:a	Lcom/tencent/common/app/AppInterface;
    //   7: invokevirtual 32	com/tencent/common/app/AppInterface:a	()Lcom/tencent/mobileqq/persistence/EntityManagerFactory;
    //   10: invokevirtual 38	com/tencent/mobileqq/persistence/EntityManagerFactory:createEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   13: astore 4
    //   15: ldc 40
    //   17: monitorenter
    //   18: aload 4
    //   20: ldc 40
    //   22: invokevirtual 45	com/tencent/mobileqq/persistence/EntityManager:a	(Ljava/lang/Class;)Ljava/util/List;
    //   25: astore_3
    //   26: aload_0
    //   27: getfield 22	com/tencent/mobileqq/app/automator/step/ActivityDAUReport:a	Lcom/tencent/mobileqq/app/automator/Automator;
    //   30: getfield 27	com/tencent/mobileqq/app/automator/Automator:a	Lcom/tencent/common/app/AppInterface;
    //   33: bipush 50
    //   35: invokevirtual 49	com/tencent/common/app/AppInterface:getManager	(I)Lmqq/manager/Manager;
    //   38: checkcast 51	com/tencent/mobileqq/app/FriendsManager
    //   41: astore 5
    //   43: aload 5
    //   45: ifnull +367 -> 412
    //   48: aload 5
    //   50: aload_0
    //   51: getfield 22	com/tencent/mobileqq/app/automator/step/ActivityDAUReport:a	Lcom/tencent/mobileqq/app/automator/Automator;
    //   54: getfield 27	com/tencent/mobileqq/app/automator/Automator:a	Lcom/tencent/common/app/AppInterface;
    //   57: invokevirtual 54	com/tencent/common/app/AppInterface:a	()Ljava/lang/String;
    //   60: invokevirtual 58	com/tencent/mobileqq/app/FriendsManager:b	(Ljava/lang/String;)Lcom/tencent/mobileqq/data/Card;
    //   63: astore 5
    //   65: aload 5
    //   67: ifnull +345 -> 412
    //   70: aload 5
    //   72: getfield 64	com/tencent/mobileqq/data/Card:shGender	S
    //   75: istore_2
    //   76: aload 5
    //   78: getfield 68	com/tencent/mobileqq/data/Card:age	B
    //   81: istore_1
    //   82: aload_3
    //   83: ifnull +276 -> 359
    //   86: aload_3
    //   87: invokeinterface 73 1 0
    //   92: ifle +267 -> 359
    //   95: aload_3
    //   96: invokeinterface 77 1 0
    //   101: astore 5
    //   103: aload 5
    //   105: invokeinterface 83 1 0
    //   110: ifeq +241 -> 351
    //   113: aload 5
    //   115: invokeinterface 87 1 0
    //   120: checkcast 40	com/tencent/mobileqq/data/ActivityDAUInfo
    //   123: astore 6
    //   125: new 89	java/util/HashMap
    //   128: dup
    //   129: iconst_2
    //   130: invokespecial 92	java/util/HashMap:<init>	(I)V
    //   133: astore 7
    //   135: aload 7
    //   137: ldc 94
    //   139: aload 6
    //   141: getfield 97	com/tencent/mobileqq/data/ActivityDAUInfo:activityName	Ljava/lang/String;
    //   144: invokevirtual 101	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   147: pop
    //   148: aload 7
    //   150: ldc 103
    //   152: aload 6
    //   154: getfield 106	com/tencent/mobileqq/data/ActivityDAUInfo:count	I
    //   157: invokestatic 112	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   160: invokevirtual 101	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   163: pop
    //   164: aload 7
    //   166: ldc 114
    //   168: iload_2
    //   169: invokestatic 112	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   172: invokevirtual 101	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   175: pop
    //   176: aload 7
    //   178: ldc 115
    //   180: iload_1
    //   181: invokestatic 112	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   184: invokevirtual 101	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   187: pop
    //   188: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   191: ifeq +89 -> 280
    //   194: ldc 122
    //   196: iconst_2
    //   197: new 124	java/lang/StringBuilder
    //   200: dup
    //   201: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   204: ldc 127
    //   206: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: aload 6
    //   211: getfield 97	com/tencent/mobileqq/data/ActivityDAUInfo:activityName	Ljava/lang/String;
    //   214: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   217: ldc -123
    //   219: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   222: aload 6
    //   224: getfield 106	com/tencent/mobileqq/data/ActivityDAUInfo:count	I
    //   227: invokevirtual 136	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   230: ldc -118
    //   232: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: aload 6
    //   237: getfield 141	com/tencent/mobileqq/data/ActivityDAUInfo:displayCount	I
    //   240: invokevirtual 136	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   243: ldc -123
    //   245: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   248: aload 6
    //   250: getfield 145	com/tencent/mobileqq/data/ActivityDAUInfo:showTime	J
    //   253: invokevirtual 148	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   256: ldc -106
    //   258: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: iload_2
    //   262: invokevirtual 136	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   265: ldc -104
    //   267: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   270: iload_1
    //   271: invokevirtual 136	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   274: invokevirtual 155	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   277: invokestatic 159	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   280: invokestatic 164	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   283: invokestatic 169	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   286: aconst_null
    //   287: ldc -85
    //   289: iconst_1
    //   290: aload 6
    //   292: getfield 141	com/tencent/mobileqq/data/ActivityDAUInfo:displayCount	I
    //   295: i2l
    //   296: aload 6
    //   298: getfield 145	com/tencent/mobileqq/data/ActivityDAUInfo:showTime	J
    //   301: aload 7
    //   303: aconst_null
    //   304: invokevirtual 174	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;)V
    //   307: goto -204 -> 103
    //   310: astore_3
    //   311: ldc 40
    //   313: monitorexit
    //   314: aload_3
    //   315: athrow
    //   316: astore_3
    //   317: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   320: ifeq +99 -> 419
    //   323: ldc 122
    //   325: iconst_2
    //   326: new 124	java/lang/StringBuilder
    //   329: dup
    //   330: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   333: ldc -80
    //   335: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   338: aload_3
    //   339: invokevirtual 179	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   342: invokevirtual 155	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   345: invokestatic 159	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   348: goto +71 -> 419
    //   351: aload 4
    //   353: ldc 40
    //   355: invokevirtual 182	com/tencent/mobileqq/persistence/EntityManager:a	(Ljava/lang/Class;)Z
    //   358: pop
    //   359: invokestatic 120	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   362: ifeq +34 -> 396
    //   365: aload_3
    //   366: ifnonnull +36 -> 402
    //   369: iconst_0
    //   370: istore_1
    //   371: ldc 122
    //   373: iconst_2
    //   374: new 124	java/lang/StringBuilder
    //   377: dup
    //   378: invokespecial 125	java/lang/StringBuilder:<init>	()V
    //   381: ldc -72
    //   383: invokevirtual 131	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   386: iload_1
    //   387: invokevirtual 136	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   390: invokevirtual 155	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   393: invokestatic 159	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   396: ldc 40
    //   398: monitorexit
    //   399: bipush 7
    //   401: ireturn
    //   402: aload_3
    //   403: invokeinterface 73 1 0
    //   408: istore_1
    //   409: goto -38 -> 371
    //   412: iconst_m1
    //   413: istore_1
    //   414: iconst_m1
    //   415: istore_2
    //   416: goto -334 -> 82
    //   419: aconst_null
    //   420: astore_3
    //   421: goto -395 -> 26
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	424	0	this	ActivityDAUReport
    //   81	333	1	i	int
    //   75	341	2	j	int
    //   25	71	3	localList	java.util.List
    //   310	5	3	localObject1	Object
    //   316	87	3	localException	Exception
    //   420	1	3	localObject2	Object
    //   13	339	4	localEntityManager	com.tencent.mobileqq.persistence.EntityManager
    //   41	73	5	localObject3	Object
    //   123	174	6	localActivityDAUInfo	com.tencent.mobileqq.data.ActivityDAUInfo
    //   133	169	7	localHashMap	java.util.HashMap
    // Exception table:
    //   from	to	target	type
    //   18	26	310	finally
    //   26	43	310	finally
    //   48	65	310	finally
    //   70	82	310	finally
    //   86	103	310	finally
    //   103	280	310	finally
    //   280	307	310	finally
    //   311	314	310	finally
    //   317	348	310	finally
    //   351	359	310	finally
    //   359	365	310	finally
    //   371	396	310	finally
    //   396	399	310	finally
    //   402	409	310	finally
    //   18	26	316	java/lang/Exception
  }
}
