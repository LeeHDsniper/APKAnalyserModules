package com.tencent.mobileqq.app.message;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.activity.aio.item.PaWeatherItemFactory;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageRoamManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import mqq.app.MobileQQ;
import njj;
import njk;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class C2CMessageManager
  extends BaseMessageManager
{
  public C2CMessageManager(QQAppInterface paramQQAppInterface, QQMessageFacade paramQQMessageFacade)
  {
    super(paramQQAppInterface, paramQQMessageFacade);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private MessageRecord a(MessageRecord paramMessageRecord)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a(frienduin, istroop, time, senderuin, msg);
  }
  
  private ArrayList a(String paramString, List paramList1, List paramList2, long paramLong1, long paramLong2)
  {
    ArrayList localArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("C2CMsgFilter basetime=" + paramLong1 + ",lowtime=" + paramLong2, "");
    if ((paramList1 == null) || (paramList1.isEmpty())) {
      return localArrayList;
    }
    Object localObject1 = paramList1.iterator();
    long l1 = -1L;
    long l2 = Long.MAX_VALUE;
    Object localObject2;
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (MessageRecord)((Iterator)localObject1).next();
      if (l2 < time) {
        break label768;
      }
      l2 = time;
    }
    label391:
    label763:
    label768:
    for (;;)
    {
      if (l1 <= time) {
        l1 = time;
      }
      for (;;)
      {
        break;
        localObject2 = b(paramString, 0, l2 - 30L, l1 + 30L);
        MessageRecord localMessageRecord1;
        MessageRecord localMessageRecord2;
        if (paramList2 == null)
        {
          localObject1 = null;
          localMessageRecord1 = MessageRecordFactory.a(64536);
          localMessageRecord2 = MessageRecordFactory.a(64536);
          paramList1 = paramList1.iterator();
        }
        for (;;)
        {
          MessageRecord localMessageRecord3;
          boolean bool;
          if (paramList1.hasNext())
          {
            localMessageRecord3 = (MessageRecord)paramList1.next();
            time -= 30L;
            time += 30L;
            Object localObject3 = a((List)localObject2, time, time);
            if ((localObject2 == null) || (((List)localObject2).size() == 0))
            {
              localArrayList.add(localMessageRecord3);
              if (localObject1 == null) {
                continue;
              }
              ((List)localObject1).add(localMessageRecord3);
              continue;
              localObject1 = new ArrayList();
              break;
            }
            Object localObject4 = ((List)localObject3).iterator();
            for (;;)
            {
              if (((Iterator)localObject4).hasNext())
              {
                localObject3 = (MessageRecord)((Iterator)localObject4).next();
                if (MsgProxyUtils.a((MessageRecord)localObject3, localMessageRecord3, true)) {
                  if (QLog.isColorLevel())
                  {
                    localObject4 = new StringBuilder().append("C2CMsgFilter shmsgseq equals?");
                    if (shmsgseq == shmsgseq)
                    {
                      bool = true;
                      QLog.i("Q.msg.BaseMessageManager", 2, bool + ",msg=" + localMessageRecord3.getLogColorContent() + "time:" + time + "<->" + time + ", type=" + msgtype + "-" + msgtype);
                    }
                  }
                  else if ((localObject1 != null) && (paramLong1 != -1L) && (time <= paramLong1))
                  {
                    ((List)localObject1).add(localObject3);
                  }
                }
              }
            }
          }
          for (int i = 1;; i = 0)
          {
            if (i != 0) {
              break label763;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageManager", 2, "C2CMsgFilter not eq: msg=" + localMessageRecord3.getLogColorContent() + "time:" + time + ",type:" + msgtype + ",msg.con : " + localMessageRecord3.getLogColorContent());
            }
            if (localObject1 != null) {
              ((List)localObject1).add(localMessageRecord3);
            }
            localArrayList.add(localMessageRecord3);
            break;
            bool = false;
            break label391;
            if ((paramLong1 > 0L) && (localObject1 != null))
            {
              time = paramLong2;
              time = paramLong1;
              paramString = b(paramString, 0, paramLong2, paramLong1).iterator();
              while (paramString.hasNext())
              {
                paramList1 = (MessageRecord)paramString.next();
                if ((!MsgProxyUtils.f(msgtype)) && (time <= paramLong1))
                {
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("addmsg ptt = " + paramList1.getId(), "");
                  MsgProxyUtils.b((List)localObject1, paramList1, true);
                }
              }
            }
            if (paramList2 != null) {
              paramList2.addAll((Collection)localObject1);
            }
            return localArrayList;
          }
        }
      }
    }
  }
  
  private List a(String paramString, List paramList, long paramLong1, long paramLong2)
  {
    ArrayList localArrayList = new ArrayList();
    paramString = a(paramString, paramList, localArrayList, paramLong1, paramLong2);
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("needSave", paramString);
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("msgInDB", localArrayList);
    if ((paramString != null) && (!paramString.isEmpty())) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(get0istroop).a(paramString, null);
    }
    paramList = paramString.iterator();
    while (paramList.hasNext())
    {
      MessageRecord localMessageRecord1 = (MessageRecord)paramList.next();
      if (localMessageRecord1.getId() < 0L)
      {
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refresh C2C insert db error ! , mr.seq = " + shmsgseq + " , mr.uniseq = " + uniseq + ", mr.uid=" + msgUid, "mr.msg = " + localMessageRecord1.getLogColorContent());
        MessageRecord localMessageRecord2 = a(localMessageRecord1);
        if (localMessageRecord2 == null)
        {
          localArrayList.remove(localMessageRecord1);
        }
        else
        {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refresh C2C insert db error ! , m.seq = " + shmsgseq + " , mr.uniseq = " + uniseq + ", m.uid=" + msgUid, "");
          localArrayList.set(localArrayList.indexOf(localMessageRecord1), localMessageRecord2);
        }
      }
      else
      {
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refresh C2C roam step 3 , mr.seq = " + shmsgseq + " , mr.uniseq = " + uniseq, "mr.msg = " + localMessageRecord1.getLogColorContent());
      }
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("setC2CRoamMessageResult needsave=" + paramString.size(), "");
    return localArrayList;
  }
  
  private List a(List paramList, long paramLong1, long paramLong2)
  {
    ArrayList localArrayList = new ArrayList();
    if ((paramList == null) || (paramList.isEmpty())) {
      return localArrayList;
    }
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)paramList.next();
      if ((time > paramLong1) && (time < paramLong2)) {
        localArrayList.add(localMessageRecord);
      }
    }
    return localArrayList;
  }
  
  private void a(MessageRecord paramMessageRecord, String paramString1, String paramString2)
  {
    MessageRecord localMessageRecord = MessageRecordFactory.a(msgtype);
    MessageRecord.copyMessageRecordBaseField(localMessageRecord, paramMessageRecord);
    senderuin = paramString2;
    frienduin = paramString1;
    istroop = istroop;
    if (!MsgProxyUtils.g(msgtype))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a(frienduin, istroop, senderuin, selfuin);
      a(localMessageRecord, null, false, true, 1);
    }
  }
  
  private List b(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    return a(paramString, paramInt, Math.min(paramLong1, paramLong2), Math.max(paramLong1, paramLong2));
  }
  
  private void b(String paramString, int paramInt)
  {
    if ((1000 == paramInt) || (1004 == paramInt))
    {
      paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt);
      if ((paramString != null) && (!paramString.isEmpty())) {
        break label41;
      }
    }
    label41:
    ChatMessage localChatMessage;
    do
    {
      return;
      Iterator localIterator;
      while (!localIterator.hasNext()) {
        localIterator = paramString.iterator();
      }
      localChatMessage = (ChatMessage)localIterator.next();
    } while ((localChatMessage.isSend()) || (MsgProxyUtils.g(msgtype)));
    get0mNeedGrayTips = true;
  }
  
  public long a(MessageRecord paramMessageRecord)
  {
    return time;
  }
  
  List a(String paramString, int paramInt, long paramLong1, long paramLong2)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).b(paramString, paramInt);
    ArrayList localArrayList = new ArrayList();
    if (localObject != null) {
      localObject = ((List)localObject).iterator();
    }
    for (;;)
    {
      MessageRecord localMessageRecord;
      if (((Iterator)localObject).hasNext())
      {
        localMessageRecord = (MessageRecord)((Iterator)localObject).next();
        if ((time < paramLong1) || (time > paramLong2)) {}
      }
      else
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "getTempListFromDB fromCache=" + localArrayList.size());
        }
        paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt, paramLong2, -1, String.format("time>=%d or time=%d", new Object[] { Long.valueOf(paramLong1), Long.valueOf(paramLong2) }));
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "getTempListFromDB from=" + paramLong1 + ",to=" + paramLong2 + ",size=" + paramString.size());
        }
        paramString = MsgProxyUtils.a(localArrayList, paramString).iterator();
        while (paramString.hasNext()) {
          MsgProxyUtils.b(localArrayList, (MessageRecord)paramString.next(), false);
        }
      }
      localArrayList.add(localMessageRecord);
    }
    return localArrayList;
  }
  
  public void a(MessageRecord paramMessageRecord, EntityManager paramEntityManager, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, BaseMessageManager.AddMessageContext paramAddMessageContext)
  {
    if (paramMessageRecord == null) {
      return;
    }
    Map localMap = jdField_a_of_type_JavaUtilMap;
    RecentUserProxy localRecentUserProxy = jdField_a_of_type_ComTencentMobileqqAppProxyRecentUserProxy;
    ConversationFacade localConversationFacade = jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade;
    if (time == 0L) {
      time = MessageCache.a();
    }
    if (msgseq == 0L) {
      msgseq = ((int)time);
    }
    String str1 = frienduin;
    String str2 = senderuin;
    int i = istroop;
    long l = time;
    Object localObject1;
    if ((i != 3000) && (i != 1) && (i != 7000))
    {
      localObject1 = frienduin;
      if (!String.valueOf(AppConstants.aq).equals(localObject1)) {
        break label2969;
      }
      localObject1 = senderuin;
    }
    label366:
    label442:
    label799:
    label902:
    label1190:
    label1212:
    label1234:
    label1312:
    label1366:
    label1984:
    label2490:
    label2503:
    label2960:
    label2963:
    label2966:
    label2969:
    for (;;)
    {
      if (i == 7100) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80050D4", "0X80050D4", 0, 0, "", "", "", "");
      }
      if ((i == 1001) && (!paramMessageRecord.isSend()) && (MessageForQQWalletMsg.isRedPacketMsg(paramMessageRecord)))
      {
        if (MsgProxyUtils.c(paramMessageRecord)) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005C8E", "0X8005C8E", 0, 0, "", "", "", "");
        }
      }
      else
      {
        if ((MsgProxyUtils.a(i) != 1009) && (localConversationFacade.a((String)localObject1, 1009)))
        {
          localConversationFacade.a(AppConstants.af, 1009, (String)localObject1, istroop);
          a(AppConstants.af, 1009, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        }
        if ((MsgProxyUtils.a(i) != 1001) && (localConversationFacade.a((String)localObject1, 1001)))
        {
          localConversationFacade.a(AppConstants.aq, 1001, (String)localObject1, istroop);
          if (!localConversationFacade.a((String)localObject1, 1001, AppConstants.aN)) {
            break label1190;
          }
          a(AppConstants.aN, 1001, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        }
        if ((MsgProxyUtils.a(i) != 1010) && (localConversationFacade.a((String)localObject1, 1010)))
        {
          localConversationFacade.a(AppConstants.aG, 1010, (String)localObject1, istroop);
          if (!localConversationFacade.a((String)localObject1, 1010, AppConstants.aO)) {
            break label1212;
          }
          a(AppConstants.aO, 1010, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        }
        if ((i == 1008) && (PAWeatherItemBuilder.a(frienduin)))
        {
          localObject1 = BaseApplicationImpl.getContext().getSharedPreferences("public_account_weather", 0).edit();
          if (!(paramMessageRecord instanceof MessageForPubAccount)) {
            break label1234;
          }
          Object localObject4 = (MessageForPubAccount)paramMessageRecord;
          ((SharedPreferences.Editor)localObject1).putLong("pa_send_time" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), System.currentTimeMillis());
          ((SharedPreferences.Editor)localObject1).putLong("pa_time_stamp" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), mPAMessage.sendTime);
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageManager", 2, "receive tianqi");
          }
          ((SharedPreferences.Editor)localObject1).putLong("pa_send_time", System.currentTimeMillis());
          ((SharedPreferences.Editor)localObject1).putBoolean("show_flag", true);
          if (mPAMessage.items.size() > 0)
          {
            PaWeatherItemFactory localPaWeatherItemFactory = new PaWeatherItemFactory(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationContext());
            String[] arrayOfString1 = localPaWeatherItemFactory.a(mPAMessage.items.get(0)).weaTemper);
            String[] arrayOfString2 = localPaWeatherItemFactory.a(mPAMessage.items.get(0)).weather);
            localObject4 = localPaWeatherItemFactory.a(mPAMessage.items.get(0)).weaArea);
            if ((localObject4 != null) && (localObject4.length >= 1)) {
              ((SharedPreferences.Editor)localObject1).putString("cur_city", localObject4[0]);
            }
            if ((arrayOfString1 != null) && (arrayOfString1.length >= 2)) {
              ((SharedPreferences.Editor)localObject1).putString("cur_temp", arrayOfString1[1]);
            }
            if ((arrayOfString2 != null) && (arrayOfString2.length >= 1)) {
              ((SharedPreferences.Editor)localObject1).putString("cur_code", arrayOfString2[0]);
            }
          }
          ((SharedPreferences.Editor)localObject1).commit();
        }
        if (MsgProxyUtils.a(istroop) != 1010) {
          break label1366;
        }
        if ((localConversationFacade.b(str1)) || (localMap.containsKey(MsgProxyUtils.a(frienduin, istroop)))) {
          localRecentUserProxy.a(frienduin);
        }
        if (!MsgProxyUtils.c(paramMessageRecord)) {
          break label1312;
        }
        a(paramMessageRecord, AppConstants.aO, frienduin);
        a(paramMessageRecord, AppConstants.aG, AppConstants.aO);
        localConversationFacade.a(1010, frienduin);
        str1 = AppConstants.aG;
        i = istroop;
        l = time;
      }
      int k;
      for (;;)
      {
        if (((paramMessageRecord instanceof MessageForVideo)) && (istroop != 3000) && (istroop != 1)) {
          k = -1;
        }
        try
        {
          localObject1 = msg.split("\\|");
          j = k;
          if (localObject1 != null)
          {
            j = k;
            if (localObject1.length >= 2) {
              j = Integer.valueOf(localObject1[1]).intValue();
            }
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            int j = -1;
            continue;
            localException.a((MessageForVideo)paramMessageRecord, false);
            continue;
            if ((i == 1009) && (str1.equals(AppConstants.af)))
            {
              if (l > lastmsgtime) {
                lastmsgtime = l;
              }
              type = MsgProxyUtils.a(type);
              localRecentUserProxy.a(localException);
            }
            else if ((i == 1008) && ((TroopBarAssistantManager.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str1)) || ("1".equals(paramMessageRecord.getExtInfoFromExtStr("inter_num")))))
            {
              str1 = MsgProxyUtils.a(str1, i);
              if (e.containsKey(str1))
              {
                ((List)e.get(str1)).add(paramMessageRecord);
              }
              else
              {
                localArrayList = new ArrayList();
                localArrayList.add(paramMessageRecord);
                e.put(str1, localArrayList);
              }
            }
            else if ((i == 1008) && (((EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87)).a(str1)))
            {
              f.put(MsgProxyUtils.a(str1, i), paramMessageRecord);
            }
            else if (msgtype == 64502)
            {
              if (localRecentUserProxy.a(str1))
              {
                uin = str1;
                type = MsgProxyUtils.a(type);
                if (l > lastmsgtime) {
                  lastmsgtime = l;
                }
                localMap.put(MsgProxyUtils.a(str1, i), localArrayList);
              }
            }
            else if ((msgtype != 60526) || (!paramMessageRecord.isSend()))
            {
              uin = str1;
              if (((i == 1000) || (i == 1020) || (i == 1004)) && (!TextUtils.equals(str2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount())) && (!TextUtils.equals(str2, str1))) {
                troopUin = str2;
              }
              type = MsgProxyUtils.a(type);
              if ((!isBlessMsg) || (!paramMessageRecord.isSend()))
              {
                if (l > lastmsgtime) {
                  lastmsgtime = l;
                }
                localMap.put(MsgProxyUtils.a(str1, i), localArrayList);
              }
            }
          }
        }
        localObject1 = (QCallFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(37);
        if (j != 6) {
          break label2490;
        }
        ((QCallFacade)localObject1).a((MessageForVideo)paramMessageRecord, true);
        ((QCallFacade)localObject1).a((MessageForVideo)paramMessageRecord);
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new njj(this));
        }
        localObject1 = localRecentUserProxy.a(str1, istroop);
        if (!localMap.containsKey(MsgProxyUtils.a(uin, type))) {
          break label2960;
        }
        localObject1 = (RecentUser)localMap.get(MsgProxyUtils.a(uin, type));
        if ((!MsgProxyUtils.g(msgtype)) && ((i != 1008) || (a(str1)))) {
          break label2503;
        }
        super.a(paramMessageRecord, paramEntityManager, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, paramAddMessageContext);
        return;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005C8F", "0X8005C8F", 0, 0, "", "", "", "");
        break;
        a(AppConstants.aq, 1001, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        break label366;
        a(AppConstants.aG, 1010, (String)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        break label442;
        if (!(paramMessageRecord instanceof MessageForText)) {
          break label799;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "brief_weather_push", 0, 0, "", "", "", "");
        ((SharedPreferences.Editor)localObject1).putLong("pa_list_send_time" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), System.currentTimeMillis());
        break label799;
        if (localConversationFacade.a(frienduin, 1010, AppConstants.aO)) {
          a(AppConstants.aO, 1010, frienduin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        }
        a(paramMessageRecord, AppConstants.aG, frienduin);
        break label902;
        if (MsgProxyUtils.a(istroop) == 1009)
        {
          if ((localConversationFacade.b(str1)) || (localMap.containsKey(MsgProxyUtils.a(frienduin, istroop)))) {
            localRecentUserProxy.a(frienduin);
          }
          a(paramMessageRecord, AppConstants.af, frienduin);
          str1 = AppConstants.af;
          i = istroop;
          l = time;
        }
        else
        {
          if (String.valueOf(AppConstants.aq).equals(frienduin))
          {
            if ((localConversationFacade.b(senderuin)) || (localMap.containsKey(MsgProxyUtils.a(senderuin, istroop)))) {
              localRecentUserProxy.a(senderuin);
            }
            localObject1 = MessageRecordFactory.a(msgtype);
            MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject1, paramMessageRecord);
            frienduin = senderuin;
            istroop = 1001;
            if (!MsgProxyUtils.g(msgtype))
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a(AppConstants.aq, 1001, senderuin, selfuin);
              a((MessageRecord)localObject1, null, false, true, 1);
            }
            if (MsgProxyUtils.c(paramMessageRecord))
            {
              a(paramMessageRecord, AppConstants.aN, senderuin);
              senderuin = AppConstants.aN;
              localConversationFacade.a(1001, senderuin);
            }
            for (;;)
            {
              break;
              if (localConversationFacade.a(frienduin, 1001, AppConstants.aN)) {
                a(AppConstants.aN, 1001, senderuin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
              }
            }
          }
          if ((MsgProxyUtils.a(istroop) == 1001) && (MsgProxyUtils.a(istroop, msgtype)))
          {
            if ((localConversationFacade.b(str1)) || (localMap.containsKey(MsgProxyUtils.a(frienduin, istroop)))) {
              localRecentUserProxy.a(frienduin);
            }
            if (MsgProxyUtils.c(paramMessageRecord))
            {
              a(paramMessageRecord, AppConstants.aN, frienduin);
              a(paramMessageRecord, AppConstants.aq, AppConstants.aN);
              localConversationFacade.a(1001, frienduin);
            }
            for (;;)
            {
              if ((!paramMessageRecord.isSend()) && (msgtype == 63511) && (MessageForQQWalletMsg.isRedPacketMsg(paramMessageRecord))) {
                localConversationFacade.a(senderuin, msg, 1001, 0);
              }
              str1 = AppConstants.aq;
              i = istroop;
              l = time;
              break;
              if (localConversationFacade.a(frienduin, 1001, AppConstants.aN)) {
                a(AppConstants.aN, 1001, frienduin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
              }
              a(paramMessageRecord, AppConstants.aq, frienduin);
            }
          }
          if (!String.valueOf(AppConstants.ap).equals(frienduin)) {
            break label1984;
          }
          if ((SystemMsgController.a().a() == null) && (SystemMsgController.a().a())) {
            SystemMsgController.a().a((MessageForSystemMsg)paramMessageRecord);
          }
          if (!(paramMessageRecord instanceof MessageForSystemMsg)) {
            break label2963;
          }
          localObject1 = ((MessageForSystemMsg)paramMessageRecord).getSystemMsg();
          if (localObject1 != null) {
            time = msg_time.get();
          }
          l = time;
        }
      }
      if (String.valueOf(AppConstants.au).equals(frienduin))
      {
        if (!(paramMessageRecord instanceof MessageForSystemMsg)) {
          break label2966;
        }
        localObject1 = ((MessageForSystemMsg)paramMessageRecord).getSystemMsg();
        if (localObject1 != null) {
          time = msg_time.get();
        }
        l = time;
      }
      for (;;)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(frienduin, istroop);
        int m = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        if (m > 0)
        {
          k = 0;
          j = k;
          if (!paramMessageRecord.isSendFromLocal())
          {
            j = k;
            if (time < time) {
              j = 1;
            }
          }
          if (j == 0)
          {
            MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject1, paramMessageRecord);
            msgData = msgData;
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b((QQMessageFacade.Message)localObject1);
          }
        }
        for (;;)
        {
          try
          {
            a((QQMessageFacade.Message)localObject1);
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().unReadNum = m;
          }
          catch (Throwable localThrowable1)
          {
            if (!QLog.isColorLevel()) {
              continue;
            }
            QLog.d("Q.msg.BaseMessageManager", 2, "addMessageRecord ERROR", localThrowable1);
            continue;
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(null);
        }
        if (String.valueOf(AppConstants.av).equals(frienduin))
        {
          if ((paramMessageRecord instanceof MessageForSystemMsg))
          {
            localObject2 = ((MessageForSystemMsg)paramMessageRecord).getSystemMsg();
            if (localObject2 != null) {
              time = msg_time.get();
            }
            l = time;
          }
          Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(frienduin, istroop);
          m = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          if (m > 0)
          {
            k = 0;
            j = k;
            if (!paramMessageRecord.isSendFromLocal())
            {
              j = k;
              if (time < time) {
                j = 1;
              }
            }
            if (j == 0)
            {
              MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject2, paramMessageRecord);
              msgData = msgData;
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b((QQMessageFacade.Message)localObject2);
            }
          }
          for (;;)
          {
            try
            {
              a((QQMessageFacade.Message)localObject2);
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().unReadNum = m;
            }
            catch (Throwable localThrowable2)
            {
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d("Q.msg.BaseMessageManager", 2, "addMessageRecord ERROR", localThrowable2);
              continue;
            }
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(null);
          }
        }
        if (AppConstants.an.equals(frienduin))
        {
          try
          {
            Object localObject3 = paramEntityManager.a(MessageRecord.class, paramMessageRecord.getTableName(), false, null, null, null, null, null, null);
            if (localObject3 != null)
            {
              localObject3 = ((List)localObject3).iterator();
              while (((Iterator)localObject3).hasNext()) {
                paramEntityManager.b((MessageRecord)((Iterator)localObject3).next());
              }
            }
          }
          finally {}
          break;
        }
        ArrayList localArrayList;
        break;
      }
    }
  }
  
  public void a(MessageRecord paramMessageRecord, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (Looper.myLooper() != Looper.getMainLooper()) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "removeMsgByMessageRecord in SubThread!");
      }
    }
    for (;;)
    {
      ((MessageRoamManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(91)).b(paramMessageRecord);
      super.a(paramMessageRecord, paramBoolean1, paramBoolean2);
      return;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "removeMsgByMessageRecord in MainThread!");
      }
    }
  }
  
  public void a(String paramString, int paramInt1, long paramLong, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext, ArrayList paramArrayList)
  {
    MessageRecord localMessageRecord1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, paramLong);
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
    Object localObject2 = new StringBuilder().append("loadFromLocal uniseq=").append(paramLong).append(",count=").append(paramInt2).append(", fromtime=");
    label140:
    MessageRecord localMessageRecord2;
    if (localMessageRecord1 == null)
    {
      paramLong = -1L;
      ((QQMessageFacade)localObject1).a(paramLong, "");
      if (localMessageRecord1 == null) {
        break label517;
      }
      long l3 = time;
      long l2 = localMessageRecord1.getId();
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).b(paramString, paramInt1);
      localObject1 = new ArrayList();
      if (localObject2 != null)
      {
        localObject2 = ((List)localObject2).iterator();
        if (((Iterator)localObject2).hasNext())
        {
          localMessageRecord2 = (MessageRecord)((Iterator)localObject2).next();
          if ((time <= l3) && (!MsgProxyUtils.a(localMessageRecord1, localMessageRecord2, true))) {
            break label465;
          }
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("loadFromLocal load from Cache", (Collection)localObject1);
      }
      long l1 = l2;
      paramLong = l3;
      if (paramArrayList.size() < paramInt2)
      {
        l1 = l2;
        paramLong = l3;
        if (((List)localObject1).size() > 0)
        {
          paramArrayList.addAll(0, ((List)localObject1).subList(Math.max(((List)localObject1).size() - (paramInt2 - paramArrayList.size()), 0), ((List)localObject1).size()));
          l1 = l2;
          paramLong = l3;
          if (paramArrayList.size() > 0)
          {
            paramLong = Math.min(l3, get0time);
            l1 = Math.max(Math.min(l2, ((MessageRecord)paramArrayList.get(0)).getId()), 0L);
          }
        }
      }
      if (paramArrayList.size() < paramInt2)
      {
        paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, l1, versionCode, paramLong, paramInt2, String.format(" or (time=%d and _id<%d) ", new Object[] { Long.valueOf(paramLong), Long.valueOf(l1) }));
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("queryTimedMessageDBUnion list size" + paramString.size() + ", getID=" + localMessageRecord1.getId(), "");
        if (!paramString.isEmpty()) {
          break label478;
        }
        jdField_a_of_type_Boolean = true;
      }
    }
    for (;;)
    {
      c = true;
      return;
      paramLong = time;
      break;
      label465:
      ((List)localObject1).add(localMessageRecord2);
      break label140;
      label478:
      if (paramString.size() < paramInt2) {
        jdField_a_of_type_Boolean = true;
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("loadFromLocal load from DB", paramString);
      paramArrayList.addAll(0, paramString);
    }
    label517:
    c = true;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("loadFromLocal complete", "");
  }
  
  public void a(String paramString, int paramInt, List paramList1, List paramList2, Bundle paramBundle)
  {
    boolean bool1 = paramBundle.getBoolean("success");
    boolean bool2 = paramBundle.getBoolean("complete");
    List localList = (List)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(Integer.valueOf(paramBundle.getInt("counter")));
    paramBundle.putBoolean("timeout", false);
    long l1 = paramBundle.getLong("baseTime");
    long l2 = paramBundle.getLong("lowTime");
    paramBundle = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
    Object localObject = new StringBuilder().append("setC2CRoamMessageResult success=").append(bool1).append(",complete=").append(bool2).append(",res_size=");
    if (paramList1 == null)
    {
      paramInt = -1;
      paramBundle.a(paramInt + ",baseT=" + l1 + ",lowTime=" + l2, "");
      if (paramList1 != null) {
        break label526;
      }
    }
    label446:
    label526:
    for (paramBundle = new ArrayList();; paramBundle = paramList1)
    {
      paramList1 = paramList2;
      if (paramList2 == null) {
        paramList1 = new ArrayList();
      }
      if (bool1)
      {
        paramList2 = a(paramString, paramBundle, l1, l2);
        if ((localList != null) && (!localList.isEmpty()))
        {
          l1 = get0time;
          paramString = new ArrayList();
          paramBundle = localList.iterator();
          for (;;)
          {
            if (paramBundle.hasNext())
            {
              localObject = (MessageRecord)paramBundle.next();
              if (time == l1)
              {
                paramString.add(localObject);
                continue;
                paramInt = paramList1.size();
                break;
              }
            }
          }
          paramList2 = paramList2.iterator();
          paramInt = 0;
          if (!paramList2.hasNext()) {
            break label446;
          }
          paramBundle = (MessageRecord)paramList2.next();
          localObject = paramString.iterator();
          do
          {
            if (!((Iterator)localObject).hasNext()) {
              break;
            }
          } while (!MsgProxyUtils.a((MessageRecord)((Iterator)localObject).next(), paramBundle, true));
        }
      }
      for (int j = 1;; j = 0)
      {
        int i = paramInt;
        if (localList != null)
        {
          i = paramInt;
          if (j == 0)
          {
            localList.add(paramInt, paramBundle);
            i = paramInt + 1;
            paramList1.add(paramBundle);
          }
        }
        paramInt = i;
        break;
        if (localList != null) {
          localList.addAll(paramList2);
        }
        paramString = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
        paramList1 = new StringBuilder().append("setC2CRoamMessageResult locallist:");
        if (localList == null) {}
        for (paramInt = -1;; paramInt = localList.size())
        {
          paramString.a(paramInt, "");
          if (localList != null) {}
          try
          {
            localList.notify();
            return;
          }
          finally {}
        }
      }
    }
  }
  
  protected boolean a(String paramString)
  {
    paramString = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).b(paramString);
    if (paramString != null) {
      return paramString.isVisible();
    }
    return true;
  }
  
  public void b(String paramString, int paramInt1, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    if ((paramInt1 != 0) && (paramInt1 != 1000) && (paramInt1 != 1004))
    {
      if (paramInt1 == 1008)
      {
        c(paramString, paramInt1, paramInt2, paramRefreshMessageContext);
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "refreshMessageListHead TYPE ERROR! TYPE = " + paramInt1);
      }
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_JavaUtilList = null;
      a(paramRefreshMessageContext, paramInt1);
      return;
    }
    Object localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).e(paramString, paramInt1);
    if ((localObject3 == null) || (((List)localObject3).isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead ERROR: AIO is closed !!");
      }
      jdField_a_of_type_JavaUtilList = null;
      a(paramRefreshMessageContext, paramInt1);
      return;
    }
    if (localObject3 != null) {
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("current Aio", ((List)localObject3).subList(0, Math.min(paramInt2, ((List)localObject3).size())));
    }
    long l2 = get0uniseq;
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString);
    long l1;
    Object localObject4;
    ArrayList localArrayList;
    int i;
    if (localObject1 == null)
    {
      l1 = 0L;
      localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).b(paramString, paramInt1);
      localArrayList = new ArrayList();
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refreshC2CMessageListHead isLocalOnly=" + c + ",uniseq=" + l2 + ",ect=" + l1, " ,getC2CRoamingSetting" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f());
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f() == 0) {
        c = true;
      }
      i = 0;
      label339:
      if (i >= ((List)localObject3).size()) {
        break label2635;
      }
      if (getuniseq != l2) {
        break label602;
      }
      label372:
      if (i >= ((List)localObject3).size()) {
        break label2629;
      }
      if (!MsgProxyUtils.f(getmsgtype)) {
        break label593;
      }
      l2 = getuniseq;
      i = 1;
    }
    for (;;)
    {
      if ((c) || (l1 == 0L) || (i == 0))
      {
        a(paramString, paramInt1, l2, paramInt2, paramRefreshMessageContext, localArrayList);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, localArrayList);
        jdField_a_of_type_JavaUtilList = localArrayList;
        if (jdField_a_of_type_Boolean) {
          b(paramString, paramInt1);
        }
        paramString = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
        localObject1 = new StringBuilder().append("refresh load local C2C msg only FIN , context = ").append(paramRefreshMessageContext).append(", size = ");
        if (localArrayList == null) {}
        for (paramInt1 = -1;; paramInt1 = localArrayList.size())
        {
          paramString.a(paramInt1, ", timestamp = " + System.currentTimeMillis());
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
          return;
          l1 = ((Long)first).longValue();
          break;
          label593:
          i += 1;
          break label372;
          label602:
          i += 1;
          break label339;
        }
      }
      i = 0;
      if (i < ((List)localObject4).size())
      {
        localObject1 = (MessageRecord)((List)localObject4).get(i);
        if (uniseq != l2) {}
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead cacheIndex:" + i + ", itemList:" + ((List)localObject4).size());
        }
        long l3;
        if (localObject1 == null)
        {
          localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, l2);
          if (localObject1 == null)
          {
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refresh from empty C2C msg", "");
            jdField_a_of_type_Boolean = true;
            c = true;
            jdField_a_of_type_JavaUtilList = new ArrayList();
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
            return;
            i += 1;
            break;
          }
          l3 = time;
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refreshC2CMessageListHead uniseq=" + l2 + ", aioBase.getId():" + ((MessageRecord)localObject1).getId(), "");
          localArrayList.addAll(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, l3, paramInt2, String.format("time>=%d or (time=%d and _id<%d)", new Object[] { Long.valueOf(l1), Long.valueOf(l3), Long.valueOf(((MessageRecord)localObject1).getId()) })));
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("refreshC2CMessageListHead Db fromTime:" + l3, "");
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("only load in db", localArrayList);
          l2 = l3;
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead locallist size " + localArrayList.size());
          }
          if (l1 <= l2) {
            break label2614;
          }
          l1 = Math.min(l2, jdField_a_of_type_Long);
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("ect > fromTime!! newEct:" + l1, "");
        }
        label2307:
        label2517:
        label2534:
        label2545:
        label2614:
        for (boolean bool1 = false;; bool1 = true)
        {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("before pull locallist", localArrayList);
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("before pull locallist" + localArrayList.size(), "");
          if (localArrayList.size() < paramInt2)
          {
            localObject4 = new Bundle();
            i = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.addAndGet(1);
            ((Bundle)localObject4).putInt("counter", i);
            ((Bundle)localObject4).putBoolean("timeout", true);
            ((Bundle)localObject4).putLong("UIN", Long.valueOf(paramString).longValue());
            ((Bundle)localObject4).putBoolean("canUpdateEct", bool1);
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Integer.valueOf(i), localArrayList);
            Object localObject5 = new ArrayList();
            i = 0;
            Object localObject6;
            while (i < ((List)localObject3).size())
            {
              localObject6 = (MessageRecord)((List)localObject3).get(i);
              if (time == time)
              {
                ((ArrayList)localObject5).add(localObject6);
                i += 1;
                continue;
                l2 = time;
                if (i >= paramInt2)
                {
                  j = i - paramInt2;
                  while (j < i)
                  {
                    localObject5 = (MessageRecord)((List)localObject4).get(j);
                    if (time >= l1) {
                      localArrayList.add(localObject5);
                    }
                    j += 1;
                  }
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("all in cache", localArrayList);
                }
                for (;;)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead fromTime:" + l2);
                  }
                  break;
                  localObject5 = (MessageRecord)((List)localObject4).get(0);
                  localObject4 = ((List)localObject4).subList(0, i).iterator();
                  while (((Iterator)localObject4).hasNext())
                  {
                    localObject6 = (MessageRecord)((Iterator)localObject4).next();
                    if (time >= l1) {
                      localArrayList.add(localObject6);
                    }
                  }
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("cache part", localArrayList);
                  i = paramInt2 - localArrayList.size();
                  localArrayList.addAll(0, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, time, i, String.format("time>=%d or (time=%d and _id<%d)", new Object[] { Long.valueOf(l1), Long.valueOf(time), Long.valueOf(((MessageRecord)localObject5).getId()) })));
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("cache + db", localArrayList);
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead memdb:size:" + localArrayList.size() + ",miss:" + i);
                  }
                }
              }
            }
            l2 = uniseq;
            i = localArrayList.size();
            if (localArrayList.isEmpty()) {
              i = paramInt2;
            }
            for (;;)
            {
              ((Bundle)localObject4).putLong("baseTime", l1);
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.BaseMessageManager", 2, "pull roam " + i + ",time=" + l1 + ",timeFilterList:" + ((ArrayList)localObject5).size());
              }
              l3 = 0L;
              if (!bool1) {
                l3 = b;
              }
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, l1, (short)i, (Bundle)localObject4, l3);
              ((Bundle)localObject4).putInt("size_req", i);
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b.put(MsgProxyUtils.a(paramString, paramInt1), Boolean.valueOf(false));
              try
              {
                localArrayList.wait(35000L);
                if ((jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b.containsKey(MsgProxyUtils.a(paramString, paramInt1))) && (((Boolean)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b.get(MsgProxyUtils.a(paramString, paramInt1))).booleanValue()))
                {
                  jdField_a_of_type_JavaUtilList = null;
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("get auto pull C2C msg when pull refresh !", ", timestamp = " + System.currentTimeMillis());
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
                  return;
                  i = paramInt2 - i;
                }
              }
              catch (InterruptedException localInterruptedException)
              {
                for (;;)
                {
                  localInterruptedException.printStackTrace();
                }
              }
              finally {}
            }
            if ((((Bundle)localObject4).getBoolean("timeout")) && (QLog.isColorLevel())) {
              QLog.w("Q.msg.BaseMessageManager", 2, "timeout!");
            }
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("after pull locallist" + localArrayList.size(), "");
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("after pull locallist", localArrayList);
            localObject2 = new ArrayList();
            int j = localArrayList.size() - 1;
            while (j >= 0)
            {
              localObject3 = (MessageRecord)localArrayList.get(j);
              localObject6 = ((ArrayList)localObject5).iterator();
              while (((Iterator)localObject6).hasNext())
              {
                MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject6).next();
                if (MsgProxyUtils.a(localMessageRecord, (MessageRecord)localObject3, true))
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead filterMr " + localMessageRecord.getLogColorContent() + ",uniseq=" + uniseq);
                  }
                  ((ArrayList)localObject2).add(localObject3);
                }
                else if (QLog.isColorLevel())
                {
                  QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead not find filterMr " + localMessageRecord.getLogColorContent() + ",mr=" + ((MessageRecord)localObject3).getLogColorContent());
                }
              }
              j -= 1;
            }
            localArrayList.removeAll((Collection)localObject2);
            if (((Bundle)localObject4).getBoolean("timeout")) {
              break label2545;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead " + localArrayList.size());
            }
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, l2, localArrayList);
            boolean bool2 = ((Bundle)localObject4).getBoolean("success");
            boolean bool3 = ((Bundle)localObject4).getBoolean("complete");
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.BaseMessageManager", 2, "success ?" + bool2 + ", complete?" + bool3);
            }
            if ((!bool2) || (bool3))
            {
              c = true;
              if (!localArrayList.isEmpty()) {
                break label2517;
              }
              if (!localArrayList.isEmpty()) {
                break label2534;
              }
              a(paramString, paramInt1, l2, paramInt2, paramRefreshMessageContext, localArrayList);
            }
            if (!bool1)
            {
              jdField_a_of_type_Long = ((Bundle)localObject4).getLong("tempEct");
              b = ((Bundle)localObject4).getLong("tempRandom");
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("update tempEct:" + jdField_a_of_type_Long + ", rand=" + b, "");
            }
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, localArrayList);
          jdField_a_of_type_JavaUtilList = localArrayList;
          if (jdField_a_of_type_Boolean) {
            b(paramString, paramInt1);
          }
          paramString = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
          localObject2 = new StringBuilder().append("refresh C2C finish , context = ").append(paramRefreshMessageContext).append(" , size = ");
          if (localArrayList == null) {}
          for (paramInt1 = -1;; paramInt1 = localArrayList.size())
          {
            paramString.a(paramInt1, ", timestamp = " + System.currentTimeMillis());
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
            return;
            l2 = get0uniseq;
            break;
            paramInt2 -= localArrayList.size();
            break label2307;
            jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("pull timeout", "");
            c = true;
            if (localArrayList.isEmpty()) {}
            for (;;)
            {
              a(paramString, paramInt1, l2, i, paramRefreshMessageContext, localArrayList);
              break;
              l2 = get0uniseq;
            }
          }
        }
        i = 0;
        Object localObject2 = null;
      }
      label2629:
      i = 0;
      continue;
      label2635:
      i = 0;
    }
  }
  
  public void c(MessageRecord paramMessageRecord)
  {
    ThreadManager.a(new njk(this, paramMessageRecord), 8, null, true);
  }
  
  public void c(String paramString, int paramInt1, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).e(paramString, paramInt1);
    if ((localObject == null) || (((List)localObject).isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "refreshC2CMessageListHead ERROR: AIO is closed !!");
      }
      jdField_a_of_type_JavaUtilList = null;
      a(paramRefreshMessageContext, paramInt1);
    }
    long l;
    do
    {
      return;
      if (localObject != null) {
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a("current Aio", ((List)localObject).subList(0, Math.min(15, ((List)localObject).size())));
      }
      l = get0uniseq;
      localObject = new ArrayList();
      c = true;
    } while (!c);
    a(paramString, paramInt1, l, paramInt2, paramRefreshMessageContext, (ArrayList)localObject);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(paramString, paramInt1, (List)localObject);
    jdField_a_of_type_JavaUtilList = ((List)localObject);
    if (PublicAccountUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString))
    {
      if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_JavaUtilList.size() == 0))
      {
        l = PublicAccountManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString);
        ((PublicAccountHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(11)).a(paramString, l, 1);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", paramString, "0X8005C99", "0X8005C99", 0, 1, 0, "new", "2", "", "");
        return;
      }
      jdField_a_of_type_Boolean = false;
      g = false;
    }
    paramString = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
    StringBuilder localStringBuilder = new StringBuilder().append("refresh load local C2C msg only FIN , context = ").append(paramRefreshMessageContext).append(", size = ");
    if (localObject == null) {}
    for (paramInt1 = -1;; paramInt1 = ((ArrayList)localObject).size())
    {
      paramString.a(paramInt1, ", timestamp = " + System.currentTimeMillis());
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
      return;
    }
  }
}
