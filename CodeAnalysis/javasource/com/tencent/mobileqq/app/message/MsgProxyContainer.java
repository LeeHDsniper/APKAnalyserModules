package com.tencent.mobileqq.app.message;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.BaseProxy;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.TroopAndDiscMsgProxy;
import java.util.concurrent.ConcurrentHashMap;

public class MsgProxyContainer
  extends BaseProxy
{
  static final String jdField_a_of_type_JavaLangString = "Q.msg.BaseMsgProxyContainer";
  private MsgProxy jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy;
  private TroopAndDiscMsgProxy jdField_a_of_type_ComTencentMobileqqTroopDataTroopAndDiscMsgProxy;
  private volatile boolean jdField_a_of_type_Boolean;
  private TroopAndDiscMsgProxy b;
  private TroopAndDiscMsgProxy c;
  
  public MsgProxyContainer(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    super(paramQQAppInterface, paramProxyManager);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy = new MsgProxy(paramQQAppInterface, paramProxyManager);
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAndDiscMsgProxy = new TroopAndDiscMsgProxy(paramQQAppInterface, paramProxyManager);
    b = new TroopAndDiscMsgProxy(paramQQAppInterface, paramProxyManager);
    c = new TroopAndDiscMsgProxy(paramQQAppInterface, paramProxyManager);
  }
  
  public MsgProxy a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy;
    case 1: 
      return jdField_a_of_type_ComTencentMobileqqTroopDataTroopAndDiscMsgProxy;
    case 3000: 
      return b;
    }
    return c;
  }
  
  /* Error */
  protected void a()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_1
    //   2: aload_0
    //   3: getfield 24	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_Boolean	Z
    //   6: ifne +655 -> 661
    //   9: aload_0
    //   10: monitorenter
    //   11: aload_0
    //   12: getfield 24	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_Boolean	Z
    //   15: ifne +213 -> 228
    //   18: invokestatic 49	java/lang/System:currentTimeMillis	()J
    //   21: lstore 5
    //   23: aload_0
    //   24: getfield 34	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqTroopDataTroopAndDiscMsgProxy	Lcom/tencent/mobileqq/troop/data/TroopAndDiscMsgProxy;
    //   27: invokevirtual 51	com/tencent/mobileqq/troop/data/TroopAndDiscMsgProxy:a	()V
    //   30: aload_0
    //   31: getfield 36	com/tencent/mobileqq/app/message/MsgProxyContainer:b	Lcom/tencent/mobileqq/troop/data/TroopAndDiscMsgProxy;
    //   34: invokevirtual 51	com/tencent/mobileqq/troop/data/TroopAndDiscMsgProxy:a	()V
    //   37: aload_0
    //   38: getfield 29	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy	Lcom/tencent/mobileqq/app/message/MsgProxy;
    //   41: invokevirtual 52	com/tencent/mobileqq/app/message/MsgProxy:a	()V
    //   44: aload_0
    //   45: getfield 38	com/tencent/mobileqq/app/message/MsgProxyContainer:c	Lcom/tencent/mobileqq/troop/data/TroopAndDiscMsgProxy;
    //   48: invokevirtual 51	com/tencent/mobileqq/troop/data/TroopAndDiscMsgProxy:a	()V
    //   51: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   54: ifeq +11 -> 65
    //   57: ldc 8
    //   59: iconst_2
    //   60: ldc 60
    //   62: invokestatic 64	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   65: aload_0
    //   66: getfield 67	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   69: bipush 17
    //   71: invokevirtual 73	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   74: checkcast 75	com/tencent/mobileqq/app/proxy/ProxyManager
    //   77: invokevirtual 78	com/tencent/mobileqq/app/proxy/ProxyManager:a	()Lcom/tencent/mobileqq/app/proxy/RecentUserProxy;
    //   80: iconst_1
    //   81: invokevirtual 83	com/tencent/mobileqq/app/proxy/RecentUserProxy:a	(Z)Ljava/util/List;
    //   84: astore 9
    //   86: aload 9
    //   88: ifnonnull +6 -> 94
    //   91: aload_0
    //   92: monitorexit
    //   93: return
    //   94: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   97: ifeq +34 -> 131
    //   100: ldc 8
    //   102: iconst_2
    //   103: new 85	java/lang/StringBuilder
    //   106: dup
    //   107: invokespecial 87	java/lang/StringBuilder:<init>	()V
    //   110: ldc 89
    //   112: invokevirtual 93	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: aload 9
    //   117: invokeinterface 99 1 0
    //   122: invokevirtual 102	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   125: invokevirtual 106	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   128: invokestatic 109	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   131: iconst_0
    //   132: istore_3
    //   133: iload_1
    //   134: istore_2
    //   135: aload 9
    //   137: invokeinterface 99 1 0
    //   142: istore 4
    //   144: iload_1
    //   145: istore_2
    //   146: iload_3
    //   147: iload 4
    //   149: if_icmpge +11 -> 160
    //   152: iload_3
    //   153: bipush 40
    //   155: if_icmplt +83 -> 238
    //   158: iload_1
    //   159: istore_2
    //   160: invokestatic 49	java/lang/System:currentTimeMillis	()J
    //   163: lstore 7
    //   165: invokestatic 114	com/tencent/util/MsgAutoMonitorUtil:a	()Lcom/tencent/util/MsgAutoMonitorUtil;
    //   168: ldc 116
    //   170: new 85	java/lang/StringBuilder
    //   173: dup
    //   174: invokespecial 87	java/lang/StringBuilder:<init>	()V
    //   177: lload 7
    //   179: lload 5
    //   181: lsub
    //   182: invokevirtual 119	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   185: ldc 121
    //   187: invokevirtual 93	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: invokevirtual 106	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   193: invokevirtual 124	com/tencent/util/MsgAutoMonitorUtil:a	(Ljava/lang/String;Ljava/lang/String;)V
    //   196: invokestatic 114	com/tencent/util/MsgAutoMonitorUtil:a	()Lcom/tencent/util/MsgAutoMonitorUtil;
    //   199: ldc 126
    //   201: new 85	java/lang/StringBuilder
    //   204: dup
    //   205: invokespecial 87	java/lang/StringBuilder:<init>	()V
    //   208: iload_2
    //   209: invokevirtual 102	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   212: ldc 121
    //   214: invokevirtual 93	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   217: invokevirtual 106	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   220: invokevirtual 124	com/tencent/util/MsgAutoMonitorUtil:a	(Ljava/lang/String;Ljava/lang/String;)V
    //   223: aload_0
    //   224: iconst_1
    //   225: putfield 24	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_Boolean	Z
    //   228: aload_0
    //   229: monitorexit
    //   230: return
    //   231: astore 9
    //   233: aload_0
    //   234: monitorexit
    //   235: aload 9
    //   237: athrow
    //   238: iload_1
    //   239: istore_2
    //   240: aload 9
    //   242: iload_3
    //   243: invokeinterface 130 2 0
    //   248: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   251: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   254: sipush 6000
    //   257: if_icmpne +6 -> 263
    //   260: goto +402 -> 662
    //   263: iload_1
    //   264: istore_2
    //   265: aload 9
    //   267: iload_3
    //   268: invokeinterface 130 2 0
    //   273: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   276: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   279: ifne +40 -> 319
    //   282: iload_1
    //   283: istore_2
    //   284: getstatic 141	com/tencent/mobileqq/app/AppConstants:ap	Ljava/lang/String;
    //   287: aload 9
    //   289: iload_3
    //   290: invokeinterface 130 2 0
    //   295: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   298: getfield 144	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   301: invokevirtual 150	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   304: ifeq +15 -> 319
    //   307: iload_1
    //   308: istore_2
    //   309: invokestatic 155	com/tencent/mobileqq/systemmsg/SystemMsgController:a	()Lcom/tencent/mobileqq/systemmsg/SystemMsgController;
    //   312: aload_0
    //   313: getfield 67	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   316: invokevirtual 158	com/tencent/mobileqq/systemmsg/SystemMsgController:a	(Lcom/tencent/mobileqq/app/QQAppInterface;)V
    //   319: iload_1
    //   320: istore_2
    //   321: aload 9
    //   323: iload_3
    //   324: invokeinterface 130 2 0
    //   329: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   332: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   335: ifne +40 -> 375
    //   338: iload_1
    //   339: istore_2
    //   340: getstatic 161	com/tencent/mobileqq/app/AppConstants:au	Ljava/lang/String;
    //   343: aload 9
    //   345: iload_3
    //   346: invokeinterface 130 2 0
    //   351: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   354: getfield 144	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   357: invokevirtual 150	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   360: ifeq +15 -> 375
    //   363: iload_1
    //   364: istore_2
    //   365: invokestatic 166	com/tencent/mobileqq/systemmsg/FriendSystemMsgController:a	()Lcom/tencent/mobileqq/systemmsg/FriendSystemMsgController;
    //   368: aload_0
    //   369: getfield 67	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   372: invokevirtual 168	com/tencent/mobileqq/systemmsg/FriendSystemMsgController:b	(Lcom/tencent/mobileqq/app/QQAppInterface;)V
    //   375: iload_1
    //   376: istore_2
    //   377: aload 9
    //   379: iload_3
    //   380: invokeinterface 130 2 0
    //   385: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   388: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   391: ifne +40 -> 431
    //   394: iload_1
    //   395: istore_2
    //   396: getstatic 171	com/tencent/mobileqq/app/AppConstants:av	Ljava/lang/String;
    //   399: aload 9
    //   401: iload_3
    //   402: invokeinterface 130 2 0
    //   407: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   410: getfield 144	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   413: invokevirtual 150	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   416: ifeq +15 -> 431
    //   419: iload_1
    //   420: istore_2
    //   421: invokestatic 176	com/tencent/mobileqq/systemmsg/GroupSystemMsgController:a	()Lcom/tencent/mobileqq/systemmsg/GroupSystemMsgController;
    //   424: aload_0
    //   425: getfield 67	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   428: invokevirtual 178	com/tencent/mobileqq/systemmsg/GroupSystemMsgController:c	(Lcom/tencent/mobileqq/app/QQAppInterface;)V
    //   431: iload_1
    //   432: istore_2
    //   433: aload_0
    //   434: getfield 67	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   437: invokevirtual 181	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   440: invokestatic 186	com/tencent/mobileqq/app/message/MsgPool:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/message/MsgPool;
    //   443: aload 9
    //   445: iload_3
    //   446: invokeinterface 130 2 0
    //   451: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   454: getfield 144	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   457: aload 9
    //   459: iload_3
    //   460: invokeinterface 130 2 0
    //   465: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   468: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   471: invokevirtual 189	com/tencent/mobileqq/app/message/MsgPool:a	(Ljava/lang/String;I)Ljava/lang/Object;
    //   474: astore 10
    //   476: iload_1
    //   477: istore_2
    //   478: aload 10
    //   480: monitorenter
    //   481: iload_1
    //   482: istore 4
    //   484: aload_0
    //   485: aload 9
    //   487: iload_3
    //   488: invokeinterface 130 2 0
    //   493: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   496: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   499: invokevirtual 191	com/tencent/mobileqq/app/message/MsgProxyContainer:a	(I)Lcom/tencent/mobileqq/app/message/MsgProxy;
    //   502: aload 9
    //   504: iload_3
    //   505: invokeinterface 130 2 0
    //   510: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   513: getfield 144	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   516: aload 9
    //   518: iload_3
    //   519: invokeinterface 130 2 0
    //   524: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   527: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   530: invokevirtual 195	com/tencent/mobileqq/app/message/MsgProxy:g	(Ljava/lang/String;I)Ljava/util/List;
    //   533: astore 11
    //   535: aload 11
    //   537: ifnull +121 -> 658
    //   540: iload_1
    //   541: istore 4
    //   543: aload 11
    //   545: invokeinterface 198 1 0
    //   550: ifne +108 -> 658
    //   553: iload_1
    //   554: istore 4
    //   556: aload_0
    //   557: getfield 67	com/tencent/mobileqq/app/message/MsgProxyContainer:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   560: invokevirtual 181	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   563: invokestatic 186	com/tencent/mobileqq/app/message/MsgPool:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/message/MsgPool;
    //   566: invokevirtual 201	com/tencent/mobileqq/app/message/MsgPool:a	()Ljava/util/concurrent/ConcurrentHashMap;
    //   569: aload 9
    //   571: iload_3
    //   572: invokeinterface 130 2 0
    //   577: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   580: getfield 144	com/tencent/mobileqq/data/RecentUser:uin	Ljava/lang/String;
    //   583: aload 9
    //   585: iload_3
    //   586: invokeinterface 130 2 0
    //   591: checkcast 132	com/tencent/mobileqq/data/RecentUser
    //   594: getfield 136	com/tencent/mobileqq/data/RecentUser:type	I
    //   597: invokestatic 206	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   600: aload 11
    //   602: invokevirtual 212	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   605: pop
    //   606: iload_1
    //   607: istore 4
    //   609: aload 11
    //   611: invokeinterface 99 1 0
    //   616: istore_2
    //   617: iload_1
    //   618: iload_2
    //   619: iadd
    //   620: istore_1
    //   621: aload 10
    //   623: monitorexit
    //   624: goto +38 -> 662
    //   627: astore 9
    //   629: iload_1
    //   630: istore_2
    //   631: iload_2
    //   632: istore 4
    //   634: aload 10
    //   636: monitorexit
    //   637: aload 9
    //   639: athrow
    //   640: astore 9
    //   642: goto -482 -> 160
    //   645: astore 9
    //   647: aload 9
    //   649: athrow
    //   650: astore 9
    //   652: iload 4
    //   654: istore_2
    //   655: goto -24 -> 631
    //   658: goto -37 -> 621
    //   661: return
    //   662: iload_3
    //   663: iconst_1
    //   664: iadd
    //   665: istore_3
    //   666: goto -533 -> 133
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	669	0	this	MsgProxyContainer
    //   1	629	1	i	int
    //   134	521	2	j	int
    //   132	534	3	k	int
    //   142	511	4	m	int
    //   21	159	5	l1	long
    //   163	15	7	l2	long
    //   84	52	9	localList1	java.util.List
    //   231	353	9	localObject1	Object
    //   627	11	9	localObject2	Object
    //   640	1	9	localException	Exception
    //   645	3	9	localObject3	Object
    //   650	1	9	localObject4	Object
    //   474	161	10	localObject5	Object
    //   533	77	11	localList2	java.util.List
    // Exception table:
    //   from	to	target	type
    //   11	65	231	finally
    //   65	86	231	finally
    //   91	93	231	finally
    //   94	131	231	finally
    //   160	228	231	finally
    //   228	230	231	finally
    //   233	235	231	finally
    //   647	650	231	finally
    //   621	624	627	finally
    //   135	144	640	java/lang/Exception
    //   240	260	640	java/lang/Exception
    //   265	282	640	java/lang/Exception
    //   284	307	640	java/lang/Exception
    //   309	319	640	java/lang/Exception
    //   321	338	640	java/lang/Exception
    //   340	363	640	java/lang/Exception
    //   365	375	640	java/lang/Exception
    //   377	394	640	java/lang/Exception
    //   396	419	640	java/lang/Exception
    //   421	431	640	java/lang/Exception
    //   433	476	640	java/lang/Exception
    //   478	481	640	java/lang/Exception
    //   637	640	640	java/lang/Exception
    //   135	144	645	finally
    //   240	260	645	finally
    //   265	282	645	finally
    //   284	307	645	finally
    //   309	319	645	finally
    //   321	338	645	finally
    //   340	363	645	finally
    //   365	375	645	finally
    //   377	394	645	finally
    //   396	419	645	finally
    //   421	431	645	finally
    //   433	476	645	finally
    //   478	481	645	finally
    //   637	640	645	finally
    //   484	535	650	finally
    //   543	553	650	finally
    //   556	606	650	finally
    //   609	617	650	finally
    //   634	637	650	finally
  }
  
  protected void b()
  {
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAndDiscMsgProxy.b();
    b.b();
    jdField_a_of_type_ComTencentMobileqqAppMessageMsgProxy.b();
    c.b();
    MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).a().clear();
    MsgPool.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
  }
}
