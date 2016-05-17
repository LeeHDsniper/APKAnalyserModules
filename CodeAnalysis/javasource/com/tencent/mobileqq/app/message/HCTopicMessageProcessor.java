package com.tencent.mobileqq.app.message;

import android.util.Pair;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotchat.PttShowRoomMng;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageCacheItem;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import msf.msgcomm.msg_comm.GroupInfo;
import msf.msgcomm.msg_comm.Msg;
import msf.msgcomm.msg_comm.MsgHead;
import njx;

public class HCTopicMessageProcessor
  extends BaseMessageProcessorForTroopAndDisc
{
  public static final String c = "HCTopicMsgProc";
  public Comparator b;
  
  public HCTopicMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = new njx(this);
  }
  
  private ArrayList a(ArrayList paramArrayList, String paramString)
  {
    if ((paramArrayList == null) || (paramArrayList.size() == 0)) {
      return null;
    }
    if (QLog.isColorLevel()) {
      NearbyUtils.a("HCTopicMsgProc", new Object[] { "<---groupMsgRecordHandle_PB", paramString, Integer.valueOf(paramArrayList.size()) });
    }
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    PBDecodeContext localPBDecodeContext = new PBDecodeContext();
    jdField_e_of_type_Long = Long.valueOf(paramString).longValue();
    d = 1026;
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      paramString = (msg_comm.Msg)paramArrayList.next();
      if (paramString != null)
      {
        localArrayList1.clear();
        Object localObject = (msg_comm.MsgHead)msg_head.get();
        long l = msg_uid.get();
        jdField_e_of_type_Int = group_info.get()).group_type.get();
        try
        {
          a(paramString, localArrayList1, localPBDecodeContext, false, null);
          if (localArrayList1.size() != 0)
          {
            MessageHandlerUtils.a(localArrayList1);
            if (localArrayList1.size() > 0)
            {
              paramString = localArrayList1.iterator();
              while (paramString.hasNext())
              {
                localObject = (MessageRecord)paramString.next();
                if (msgUid == 0L) {
                  msgUid = l;
                }
              }
            }
          }
        }
        catch (Exception paramString)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("HCTopicMsgProc", 2, "decodeSinglePbMsg_GroupDis error,", paramString);
            }
          }
          localArrayList2.addAll(localArrayList1);
        }
      }
    }
    a(localArrayList2);
    localArrayList1.clear();
    a(localArrayList2, localArrayList1, true);
    return localArrayList1;
  }
  
  private void a(List paramList1, List paramList2)
  {
    Pair localPair = super.a(paramList1, paramList2);
    if ((((Boolean)first).booleanValue()) && (QLog.isColorLevel()))
    {
      StringBuilder localStringBuilder = new StringBuilder("<---HCTopicMessagePackage:msgFilter_OnePkg ");
      localStringBuilder.append((CharSequence)second);
      localStringBuilder.append(" inListSize:").append(paramList1.size()).append(" outListSize:").append(paramList2.size());
      QLog.d("HCTopicMsgProc", 2, localStringBuilder.toString());
    }
  }
  
  /* Error */
  public void a(int paramInt, Object... paramVarArgs)
  {
    // Byte code:
    //   0: iload_1
    //   1: tableswitch	default:+27->28, 1001:+28->29, 1002:+96->97, 1003:+96->97
    //   28: return
    //   29: aload_2
    //   30: iconst_0
    //   31: aaload
    //   32: checkcast 97	msf/msgcomm/msg_comm$Msg
    //   35: astore 9
    //   37: aload_2
    //   38: iconst_1
    //   39: aaload
    //   40: checkcast 216	java/lang/String
    //   43: astore_2
    //   44: aload 9
    //   46: getfield 220	msf/msgcomm/msg_comm$Msg:appshare_info	Lmsf/msgcomm/msg_comm$AppShareInfo;
    //   49: iconst_0
    //   50: invokevirtual 226	msf/msgcomm/msg_comm$AppShareInfo:setHasFlag	(Z)V
    //   53: iconst_1
    //   54: istore_3
    //   55: iload_3
    //   56: ifeq +28 -> 84
    //   59: aload_0
    //   60: aload 9
    //   62: aload_2
    //   63: invokevirtual 229	com/tencent/mobileqq/app/message/HCTopicMessageProcessor:a	(Lmsf/msgcomm/msg_comm$Msg;Ljava/lang/String;)V
    //   66: return
    //   67: astore 10
    //   69: aconst_null
    //   70: astore 9
    //   72: aconst_null
    //   73: astore_2
    //   74: aload 10
    //   76: invokevirtual 232	java/lang/Exception:printStackTrace	()V
    //   79: iconst_0
    //   80: istore_3
    //   81: goto -26 -> 55
    //   84: aload_0
    //   85: aload_0
    //   86: invokevirtual 236	java/lang/Object:getClass	()Ljava/lang/Class;
    //   89: invokevirtual 241	java/lang/Class:getName	()Ljava/lang/String;
    //   92: iload_1
    //   93: invokevirtual 244	com/tencent/mobileqq/app/message/HCTopicMessageProcessor:a	(Ljava/lang/String;I)V
    //   96: return
    //   97: lconst_0
    //   98: lstore 4
    //   100: new 34	java/util/ArrayList
    //   103: dup
    //   104: invokespecial 62	java/util/ArrayList:<init>	()V
    //   107: astore 9
    //   109: aload_0
    //   110: aload_2
    //   111: iconst_0
    //   112: aaload
    //   113: checkcast 34	java/util/ArrayList
    //   116: aload 9
    //   118: invokespecial 246	com/tencent/mobileqq/app/message/HCTopicMessageProcessor:a	(Ljava/util/List;Ljava/util/List;)V
    //   121: aload_2
    //   122: iconst_1
    //   123: aaload
    //   124: checkcast 216	java/lang/String
    //   127: astore 10
    //   129: aload_2
    //   130: iconst_2
    //   131: aaload
    //   132: checkcast 216	java/lang/String
    //   135: astore 12
    //   137: aload_2
    //   138: iconst_3
    //   139: aaload
    //   140: checkcast 67	java/lang/Long
    //   143: invokevirtual 74	java/lang/Long:longValue	()J
    //   146: lstore 6
    //   148: lload 6
    //   150: lstore 4
    //   152: iconst_1
    //   153: istore 8
    //   155: aload 12
    //   157: astore 11
    //   159: aload 10
    //   161: astore_2
    //   162: invokestatic 44	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   165: ifeq +54 -> 219
    //   168: ldc 8
    //   170: bipush 6
    //   172: anewarray 46	java/lang/Object
    //   175: dup
    //   176: iconst_0
    //   177: ldc -8
    //   179: aastore
    //   180: dup
    //   181: iconst_1
    //   182: iload 8
    //   184: invokestatic 251	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   187: aastore
    //   188: dup
    //   189: iconst_2
    //   190: aload_2
    //   191: aastore
    //   192: dup
    //   193: iconst_3
    //   194: aload 11
    //   196: aastore
    //   197: dup
    //   198: iconst_4
    //   199: lload 4
    //   201: invokestatic 254	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   204: aastore
    //   205: dup
    //   206: iconst_5
    //   207: aload 9
    //   209: invokevirtual 38	java/util/ArrayList:size	()I
    //   212: invokestatic 54	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   215: aastore
    //   216: invokestatic 59	com/tencent/mobileqq/nearby/NearbyUtils:a	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   219: iload 8
    //   221: ifeq +58 -> 279
    //   224: iload_1
    //   225: sipush 1002
    //   228: if_icmpne +45 -> 273
    //   231: iconst_1
    //   232: istore 8
    //   234: aload_0
    //   235: iload 8
    //   237: aload_2
    //   238: aload 9
    //   240: aload 11
    //   242: lload 4
    //   244: invokevirtual 257	com/tencent/mobileqq/app/message/HCTopicMessageProcessor:a	(ZLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;J)V
    //   247: return
    //   248: astore 11
    //   250: aconst_null
    //   251: astore 10
    //   253: aconst_null
    //   254: astore 9
    //   256: aconst_null
    //   257: astore_2
    //   258: aload 11
    //   260: invokevirtual 232	java/lang/Exception:printStackTrace	()V
    //   263: iconst_0
    //   264: istore 8
    //   266: aload 10
    //   268: astore 11
    //   270: goto -108 -> 162
    //   273: iconst_0
    //   274: istore 8
    //   276: goto -42 -> 234
    //   279: aload_0
    //   280: aload_0
    //   281: invokevirtual 236	java/lang/Object:getClass	()Ljava/lang/Class;
    //   284: invokevirtual 241	java/lang/Class:getName	()Ljava/lang/String;
    //   287: iload_1
    //   288: invokevirtual 244	com/tencent/mobileqq/app/message/HCTopicMessageProcessor:a	(Ljava/lang/String;I)V
    //   291: return
    //   292: astore 11
    //   294: aconst_null
    //   295: astore 10
    //   297: aconst_null
    //   298: astore_2
    //   299: goto -41 -> 258
    //   302: astore 11
    //   304: aconst_null
    //   305: astore 12
    //   307: aload 10
    //   309: astore_2
    //   310: aload 12
    //   312: astore 10
    //   314: goto -56 -> 258
    //   317: astore 11
    //   319: aload 10
    //   321: astore_2
    //   322: aload 12
    //   324: astore 10
    //   326: goto -68 -> 258
    //   329: astore 10
    //   331: aconst_null
    //   332: astore_2
    //   333: goto -259 -> 74
    //   336: astore 10
    //   338: goto -264 -> 74
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	341	0	this	HCTopicMessageProcessor
    //   0	341	1	paramInt	int
    //   0	341	2	paramVarArgs	Object[]
    //   54	27	3	i	int
    //   98	145	4	l1	long
    //   146	3	6	l2	long
    //   153	122	8	bool	boolean
    //   35	220	9	localObject1	Object
    //   67	8	10	localException1	Exception
    //   127	198	10	localObject2	Object
    //   329	1	10	localException2	Exception
    //   336	1	10	localException3	Exception
    //   157	84	11	str1	String
    //   248	11	11	localException4	Exception
    //   268	1	11	localObject3	Object
    //   292	1	11	localException5	Exception
    //   302	1	11	localException6	Exception
    //   317	1	11	localException7	Exception
    //   135	188	12	str2	String
    // Exception table:
    //   from	to	target	type
    //   29	37	67	java/lang/Exception
    //   100	109	248	java/lang/Exception
    //   109	129	292	java/lang/Exception
    //   129	137	302	java/lang/Exception
    //   137	148	317	java/lang/Exception
    //   37	44	329	java/lang/Exception
    //   44	53	336	java/lang/Exception
  }
  
  protected void a(List paramList)
  {
    if ((paramList == null) || (paramList.size() == 0)) {}
    for (;;)
    {
      return;
      try
      {
        PttShowRoomMng localPttShowRoomMng = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b.a(true).a(true);
        paramList = paramList.iterator();
        while (paramList.hasNext()) {
          localPttShowRoomMng.a((MessageRecord)paramList.next());
        }
        return;
      }
      catch (Exception paramList)
      {
        paramList.printStackTrace();
      }
    }
  }
  
  protected void a(msg_comm.Msg paramMsg, String paramString)
  {
    NearbyUtils.a("HCTopicMsgProc", "processPush", new Object[] { paramString, paramMsg });
    if ((paramMsg == null) || (!msg_head.has())) {
      if (QLog.isColorLevel()) {
        NearbyUtils.a("HCTopicMsgProc", new Object[] { "processPush invalidate params" });
      }
    }
    Object localObject1;
    Object localObject2;
    long l1;
    int j;
    long l4;
    int i;
    for (;;)
    {
      return;
      localObject1 = (msg_comm.MsgHead)msg_head.get();
      if (!group_info.has())
      {
        if (QLog.isColorLevel()) {
          NearbyUtils.a("HCTopicMsgProc", new Object[] { "<---handleMsgPush_PB_Group: no groupInfo." });
        }
      }
      else
      {
        localObject2 = (msg_comm.GroupInfo)group_info.get();
        l1 = msg_seq.get();
        long l2 = msg_uid.get();
        long l3 = group_code.get();
        j = group_type.get();
        l4 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).longValue();
        if (l3 != 0L) {
          paramString = String.valueOf(l3);
        }
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
        if (((MessageCacheItem)localObject1).a(paramString) == 2) {}
        for (i = 1; i == 0; i = 0)
        {
          ((MessageCacheItem)localObject1).a(paramString, new Object[] { paramMsg, paramString });
          return;
        }
        localObject2 = new ArrayList();
        ArrayList localArrayList = new ArrayList();
        Object localObject3 = new PBDecodeContext();
        jdField_e_of_type_Long = l3;
        d = 1026;
        jdField_e_of_type_Int = j;
        try
        {
          a(paramMsg, (ArrayList)localObject2, (PBDecodeContext)localObject3, false, null);
          a((List)localObject2);
          MessageHandlerUtils.a((List)localObject2);
          if (((ArrayList)localObject2).size() == 0)
          {
            if (!QLog.isColorLevel()) {
              continue;
            }
            QLog.d("HCTopicMsgProc", 2, "<---handleMsgPush_PB_Group : msg list is empty after decode.");
          }
        }
        catch (Exception paramMsg)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("HCTopicMsgProc", 2, "decodeSinglePbMsg_GroupDis error,", paramMsg);
            }
          }
          i = 0;
          while (i < ((ArrayList)localObject2).size())
          {
            paramMsg = (MessageRecord)((ArrayList)localObject2).get(i);
            if ((paramMsg != null) && (senderuin != null) && (senderuin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) {
              a(paramMsg);
            }
            i += 1;
          }
          a((ArrayList)localObject2, localArrayList, true);
          ((ArrayList)localObject2).clear();
          int k = localArrayList.size();
          i = 0;
          if (i < k)
          {
            paramMsg = (MessageRecord)localArrayList.get(i);
            if (msgUid == 0L) {
              msgUid = l2;
            }
            if (QLog.isColorLevel())
            {
              localObject3 = new StringBuilder("<---handleMsgPush_PB_Group : after analysis :");
              ((StringBuilder)localObject3).append("mr.senderuin:").append(senderuin).append(" mr.msgtype:").append(msgtype).append(" mr.msgUid:").append(msgUid).append(" mr.frienduin:").append(frienduin).append(" mr.shmsgseq:").append(shmsgseq).append(" mr.time:").append(time).append(" mr.msg:").append(paramMsg.getLogColorContent());
              QLog.d("HCTopicMsgProc", 2, ((StringBuilder)localObject3).toString());
            }
            if ((senderuin != null) && (senderuin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) {
              if (!a(paramMsg)) {}
            }
            for (;;)
            {
              i += 1;
              break;
              isread = true;
              issend = 2;
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, 1026, shmsgseq);
              ((ArrayList)localObject2).add(paramMsg);
            }
          }
          bool = MessageHandlerUtils.a((ArrayList)localObject2);
          MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (ArrayList)localObject2);
          i = MsgProxyUtils.a((List)localObject2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          paramMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          if (!bool) {
            break label795;
          }
        }
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Pause) {}
    label795:
    for (boolean bool = true;; bool = false)
    {
      paramMsg.a((ArrayList)localObject2, String.valueOf(l4), bool);
      if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
      {
        HotChatUtil.a((MessageCacheItem)localObject1, l1, paramString, 1);
        ((MessageCacheItem)localObject1).a(1, paramString, l1, 2);
      }
      if (j == 127) {
        break;
      }
      a("handleMsgPush_PB_Group", true, i, false, false);
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b((ArrayList)localObject2);
      return;
    }
  }
  
  protected void a(boolean paramBoolean, String paramString1, ArrayList paramArrayList, String paramString2, long paramLong)
  {
    if (paramArrayList != null)
    {
      paramString2 = Integer.valueOf(paramArrayList.size());
      NearbyUtils.a("HCTopicMsgProc", "processGetMsgs", new Object[] { Boolean.valueOf(paramBoolean), paramString1, paramString2 });
      if (paramArrayList == null) {
        break label599;
      }
    }
    label119:
    label503:
    label599:
    for (paramArrayList = a(paramArrayList, paramString1);; paramArrayList = null)
    {
      long l2 = Long.MIN_VALUE;
      long l1 = Long.MAX_VALUE;
      String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f();
      MessageCacheItem localMessageCacheItem = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      int i;
      int j;
      if ((paramArrayList != null) && (paramArrayList.size() > 0))
      {
        Collections.sort(paramArrayList, b);
        paramString2 = new ArrayList();
        i = paramArrayList.size() - 1;
        Object localObject;
        long l3;
        if (i >= 0)
        {
          localObject = (MessageRecord)paramArrayList.get(i);
          l3 = l2;
          if (l2 < shmsgseq) {
            l3 = shmsgseq;
          }
          l2 = l1;
          if (l1 > shmsgseq) {
            l2 = shmsgseq;
          }
          if ((senderuin != null) && (senderuin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) && (a((MessageRecord)localObject))) {}
          for (;;)
          {
            i -= 1;
            l1 = l2;
            l2 = l3;
            break label119;
            paramString2 = "null";
            break;
            paramString2.add(0, localObject);
          }
        }
        if (paramString2.size() > 0)
        {
          l3 = localMessageCacheItem.a(2, paramString1);
          paramArrayList = (BaseMessageManagerForTroopAndDisc)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(1026);
          localObject = paramString2.iterator();
          while (((Iterator)localObject).hasNext())
          {
            MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
            if (localMessageRecord != null)
            {
              if ((senderuin != null) && (senderuin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())))
              {
                isread = true;
                issend = 2;
              }
              if (l3 >= shmsgseq) {
                isread = true;
              }
            }
          }
          paramBoolean = MessageHandlerUtils.a(paramString2);
          j = MsgProxyUtils.a(paramString2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          if ((paramBoolean) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Pause))
          {
            paramBoolean = true;
            ((QQMessageFacade)localObject).a(paramString2, str, paramBoolean, false);
            paramArrayList.c(paramString1, 1026, l3);
            paramArrayList.a(paramString1, paramString2);
            if (l2 != Long.MIN_VALUE) {
              HotChatUtil.a(localMessageCacheItem, l2, paramString1, 3);
            }
            if (l1 != Long.MAX_VALUE)
            {
              localMessageCacheItem.a(1, paramString1, l1, 2);
              if (paramLong == 0L) {
                localMessageCacheItem.a(3, paramString1, l1, 1);
              }
            }
            i = 0;
            paramArrayList = paramString2;
          }
        }
      }
      for (;;)
      {
        if ((i != 0) && (localMessageCacheItem.a(paramString1) == 1))
        {
          paramLong = localMessageCacheItem.a(2, paramString1);
          ((BaseMessageManagerForTroopAndDisc)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(1026)).c(paramString1, 1026, paramLong);
        }
        a("processGetMsgs", true, j, false, false);
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramArrayList);
        return;
        paramBoolean = false;
        break;
        i = 1;
        j = 0;
        break label503;
        i = 1;
        j = 0;
      }
    }
  }
  
  protected boolean a(MessageRecord paramMessageRecord)
  {
    boolean bool = false;
    MessageRecord localMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, 1026, paramMessageRecord);
    if (localMessageRecord != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(localMessageRecord)) {
        a(localMessageRecord);
      }
      if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().e()) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(frienduin, istroop, uniseq);
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(frienduin, 1026, uniseq, shmsgseq, time);
      HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(), shmsgseq, frienduin, 2);
      bool = true;
    }
    return bool;
  }
}
