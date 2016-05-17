package com.tencent.mobileqq.app.message;

import android.os.Bundle;
import android.text.TextUtils;
import com.qq.taf.jce.HexUtil;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.ims.bankcode_info.BankcodeCtrlInfo;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.proxy.ProxyListener;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.data.MessageForGrayTips;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForReplyText.SourceMsgInfo;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForText.AtTroopMemberInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.revokemsg.RevokeMsgInfo;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.troop.data.TroopTipsEntity;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import niz;
import njb;

public abstract class BaseMessageManager
  extends Observable
  implements IMessageManager
{
  protected static final long a = 35000L;
  public static final String a = "Q.msg.BaseMessageManager";
  protected static final long b = 40000L;
  protected static final long c = 15000L;
  public QQAppInterface a;
  public QQMessageFacade a;
  private Object a;
  private Object b;
  
  public BaseMessageManager(QQAppInterface paramQQAppInterface, QQMessageFacade paramQQMessageFacade)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangObject = new Object();
    b = new Object();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade = paramQQMessageFacade;
  }
  
  private long a(String paramString, int paramInt)
  {
    if (paramString == null) {
      return 0L;
    }
    Object localObject1 = null;
    Object localObject2;
    if (MsgProxyUtils.a(paramInt) == 1009)
    {
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(AppConstants.af, 1009);
      localObject2 = "";
    }
    for (;;)
    {
      int j = 0;
      int i = j;
      if (localObject1 != null)
      {
        i = j;
        if (!((List)localObject1).isEmpty())
        {
          localObject1 = ((List)localObject1).iterator();
          i = 0;
          if (((Iterator)localObject1).hasNext())
          {
            MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject1).next();
            if (paramString.equals(senderuin))
            {
              return uniseq;
              if (MsgProxyUtils.a(paramInt) == 1001)
              {
                localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(AppConstants.aq, 1001);
                localObject2 = AppConstants.aN;
                continue;
              }
              if (MsgProxyUtils.a(paramInt) != 1010) {
                break label324;
              }
              localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(AppConstants.aG, 1010);
              localObject2 = AppConstants.aO;
              continue;
            }
            if ((TextUtils.isEmpty((CharSequence)localObject2)) || ((!AppConstants.aN.equals(senderuin)) && (!AppConstants.aO.equals(senderuin)))) {
              break label321;
            }
            i = 1;
          }
        }
      }
      label321:
      for (;;)
      {
        break;
        if (i != 0)
        {
          localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a((String)localObject2, MsgProxyUtils.a(paramInt));
          if ((localObject1 != null) && (!((List)localObject1).isEmpty()))
          {
            localObject1 = ((List)localObject1).iterator();
            while (((Iterator)localObject1).hasNext())
            {
              localObject2 = (MessageRecord)((Iterator)localObject1).next();
              if (paramString.equals(senderuin)) {
                return uniseq;
              }
            }
          }
        }
        return 0L;
      }
      label324:
      localObject2 = "";
    }
  }
  
  private boolean a(String paramString)
  {
    if (paramString.charAt(0) == '\026')
    {
      paramString = paramString.split("\026")[1].split("\\|");
      if (paramString.length < 2) {
        return true;
      }
      if (paramString.length > 3) {
        try
        {
          Long.valueOf(paramString[1]);
          Integer.valueOf(paramString[2]);
          Boolean.valueOf(paramString[3]);
          return true;
        }
        catch (NumberFormatException paramString)
        {
          return false;
        }
      }
      return false;
    }
    return false;
  }
  
  private void e(MessageRecord paramMessageRecord)
  {
    long l = System.currentTimeMillis();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new njb(this, paramMessageRecord, l));
  }
  
  public int a(int paramInt, ConversationInfo paramConversationInfo)
  {
    if (ConversationFacade.a(paramConversationInfo) > 0) {
      if (paramInt == 2)
      {
        if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(uin, type)) && (!MsgProxyUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin, type)) && (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().b(uin, type))) {
          return ConversationFacade.a(paramConversationInfo);
        }
      }
      else if (paramInt == 6)
      {
        if ((type == 1001) && (AppConstants.aq.equals(uin)) && (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().b(uin, type))) {
          return ConversationFacade.a(paramConversationInfo);
        }
      }
      else if (paramInt == 7)
      {
        if ((type == 1009) && (uin.equals(AppConstants.af)) && (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().b(uin, type))) {
          return ConversationFacade.a(paramConversationInfo);
        }
      }
      else if (paramInt == 8)
      {
        if ((type == 1010) && (uin.equals(AppConstants.aG)) && (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().b(uin, type))) {
          return ConversationFacade.a(paramConversationInfo);
        }
      }
      else if (paramInt == 9)
      {
        if ((type == 1008) && (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().b(uin, type))) {
          return ConversationFacade.a(paramConversationInfo);
        }
      }
      else {
        return ConversationFacade.a(paramConversationInfo);
      }
    }
    return 0;
  }
  
  public int a(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "clearHistory uin = " + paramString + ", type = " + paramInt + ", needDeleteDB = " + paramBoolean1);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt);
    QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt);
    int i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt, paramBoolean1);
    Object localObject;
    switch (paramInt)
    {
    default: 
      if ((3000 != paramInt) && (1 != paramInt) && (5000 != paramInt)) {
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString);
      }
      if (i > 0) {
        localMessage.cleanMessageRecordBaseField();
      }
      if ((paramInt != 3000) && (paramInt != 1) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, MsgProxyUtils.a(paramInt))))
      {
        if (MsgProxyUtils.a(paramInt) != 1009) {
          break label328;
        }
        a(AppConstants.af, 1009, paramString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.af, 1009);
        if ((senderuin != null) && (senderuin.equals(paramString))) {
          ((QQMessageFacade.Message)localObject).cleanMessageRecordBaseField();
        }
      }
      break;
    }
    for (;;)
    {
      if (paramBoolean2)
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramString, istroop);
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a((RecentUser)localObject);
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.remove(MsgProxyUtils.a(paramString, paramInt));
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localMessage);
      return i;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, 0);
      break;
      label328:
      if (MsgProxyUtils.a(paramInt) == 1001)
      {
        a(AppConstants.aq, 1001, paramString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aq, 1001);
        if ((senderuin != null) && (senderuin.equals(paramString))) {
          ((QQMessageFacade.Message)localObject).cleanMessageRecordBaseField();
        }
      }
      else if (MsgProxyUtils.a(paramInt) == 1010)
      {
        a(AppConstants.aG, 1010, paramString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aG, 1010);
        if ((senderuin != null) && (senderuin.equals(paramString))) {
          ((QQMessageFacade.Message)localObject).cleanMessageRecordBaseField();
        }
      }
    }
  }
  
  public abstract long a(MessageRecord paramMessageRecord);
  
  public QQMessageFacade.Message a(String paramString, int paramInt, EntityManager paramEntityManager)
  {
    if (paramString == null)
    {
      paramString = new QQMessageFacade.Message();
      return paramString;
    }
    String str = MsgProxyUtils.a(paramString, paramInt);
    Object localObject1 = null;
    Object localObject2 = (QQMessageFacade.Message)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(str);
    StringBuilder localStringBuilder = new StringBuilder("CACHE : refreshSingleLastMsg:uin:" + paramString + " uinType:" + paramInt);
    if ((localObject2 == null) || (!isCacheValid))
    {
      localObject1 = MessageRecord.getTableName(paramString, paramInt);
      if (paramString.equals(String.valueOf(AppConstants.ai))) {
        localObject1 = DataLineMsgRecord.tableName();
      }
      if (paramString.equals(String.valueOf(AppConstants.aj))) {
        localObject1 = DataLineMsgRecord.tableName(1);
      }
      QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a((String)localObject1, paramEntityManager);
      Object localObject3 = localObject1;
      localObject2 = localMessage;
      if (localMessage == null) {
        if ((!MsgProxyUtils.c(paramInt)) && (paramInt != 1))
        {
          localObject3 = localObject1;
          localObject2 = localMessage;
          if (paramInt != 3000) {}
        }
        else
        {
          localObject3 = MessageRecord.getOldTableName(paramString, paramInt);
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a((String)localObject3, paramEntityManager);
        }
      }
      if (QLog.isColorLevel()) {
        localStringBuilder.append(" message:" + localObject2);
      }
      localObject1 = localObject2;
      if (localObject2 != null)
      {
        localObject1 = localObject2;
        if (uniseq == 0L)
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).b(frienduin, istroop);
          paramEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a((String)localObject3, paramEntityManager);
          localObject1 = paramEntityManager;
          if (QLog.isColorLevel())
          {
            QLog.d("Q.msg.BaseMessageManager", 2, "CACHE : requeryLastMessage = " + paramEntityManager);
            localObject1 = paramEntityManager;
          }
        }
      }
      if (localObject1 != null)
      {
        if (((paramString.equals(String.valueOf(AppConstants.ai))) || (paramString.equals(String.valueOf(AppConstants.aj)))) && (msgData != null))
        {
          paramString = new DataLineMsgRecord();
          DataLineMsgRecord.unpackMsgData(paramString, msgData, versionCode);
          msg = msg;
        }
        if ((AppConstants.aq.equals(frienduin)) || (MsgProxyUtils.a(istroop) != 1001))
        {
          paramString = (String)localObject1;
          if (!AppConstants.aG.equals(frienduin))
          {
            paramString = (String)localObject1;
            if (MsgProxyUtils.a(istroop) != 1010) {}
          }
        }
        else
        {
          paramEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).b(frienduin, istroop);
          paramString = (String)localObject1;
          if (paramEntityManager != null)
          {
            paramString = (String)localObject1;
            if (paramEntityManager.size() > 0)
            {
              paramEntityManager = paramEntityManager.iterator();
              do
              {
                paramString = (String)localObject1;
                if (!paramEntityManager.hasNext()) {
                  break;
                }
                paramString = (MessageRecord)paramEntityManager.next();
              } while ((senderuin == null) || (!senderuin.equals(frienduin)) || (MessageUtils.a(msgtype)));
              hasReply = true;
              paramString = (String)localObject1;
              if (QLog.isColorLevel())
              {
                QLog.d("Q.msg.BaseMessageManager", 2, "refreshSingleLastMsg = " + localObject1 + ",hasReply=" + hasReply);
                paramString = (String)localObject1;
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      try
      {
        paramEntityManager = (QQMessageFacade.Message)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(str);
        if (paramEntityManager != null) {
          continue;
        }
        if (QLog.isColorLevel()) {
          localStringBuilder.append(" : case 1 : null inplace");
        }
        a(paramString);
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.put(str, paramString);
        paramEntityManager = paramString;
      }
      catch (Throwable localThrowable)
      {
        paramEntityManager = paramString;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Q.msg.BaseMessageManager", 2, "refreshSingleLastMsg ERROR", localThrowable);
        paramEntityManager = paramString;
        continue;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, localStringBuilder.toString());
      }
      paramString = paramEntityManager;
      if (paramEntityManager == null) {
        break;
      }
      paramString = paramEntityManager;
      if (!MsgProxyUtils.a(frienduin, istroop)) {
        break;
      }
      istroop = MsgProxyUtils.a(istroop);
      return paramEntityManager;
      paramEntityManager = new QQMessageFacade.Message();
      frienduin = paramString;
      istroop = paramInt;
      paramString = paramEntityManager;
      continue;
      if (a(paramEntityManager) < a(paramString))
      {
        if (QLog.isColorLevel()) {
          localStringBuilder.append(" : case 2 : new inplace");
        }
        a(paramString);
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.put(str, paramString);
      }
      else if ((!isCacheValid) && (isCacheValid))
      {
        if (QLog.isColorLevel()) {
          localStringBuilder.append(" : case 3 : valid inplace");
        }
        a(paramString);
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.put(str, paramString);
      }
      else
      {
        if (QLog.isColorLevel()) {
          localStringBuilder.append(" : case 4 :invalid inplace");
        }
        isCacheValid = true;
        paramString = paramEntityManager;
        continue;
        paramEntityManager = localThrowable;
        if (QLog.isColorLevel())
        {
          localStringBuilder.append(" : case 5 : not null or isValid : " + localObject2);
          paramEntityManager = localThrowable;
        }
      }
    }
  }
  
  public List a(String paramString, int paramInt)
  {
    return a(paramString, paramInt, -1L);
  }
  
  protected List a(String paramString, int paramInt1, int paramInt2)
  {
    return new ArrayList();
  }
  
  public List a(String paramString, int paramInt, long paramLong)
  {
    if (paramLong >= 0L) {}
    for (Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt, paramLong); localObject1 == null; localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt, true, true)) {
      return new ArrayList();
    }
    Object localObject2 = (List)((ArrayList)localObject1).clone();
    if (paramInt == 1008) {
      MsgProxyUtils.b(paramString, paramInt, (List)localObject2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    MsgProxyUtils.a((List)localObject2);
    MsgProxyUtils.a(paramString, paramInt, (List)localObject2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if ((!((List)localObject2).isEmpty()) && ((((List)localObject2).get(((List)localObject2).size() - 1) instanceof MessageForLongMsg)) && (MsgProxyUtils.a((MessageRecord)((List)localObject2).get(((List)localObject2).size() - 1), jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt))))
    {
      localObject1 = (MessageForLongMsg)((List)localObject2).get(((List)localObject2).size() - 1);
      if ((longMsgFragmentList != null) && (!longMsgFragmentList.isEmpty()) && (longMsgFragmentList.get(0)).longMsgIndex < jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt).longMsgIndex))
      {
        a((MessageRecord)longMsgFragmentList.get(0), true, 2);
        b(paramString, paramInt, (MessageRecord)longMsgFragmentList.get(0), 2);
        a((MessageRecord)localObject1, true, 3);
        b(paramString, paramInt, (MessageRecord)localObject1, 3);
      }
    }
    Object localObject3;
    if (QLog.isColorLevel())
    {
      localObject3 = new StringBuilder().append("newAIOCursor clone ");
      if (localObject2 != null)
      {
        localObject1 = Integer.valueOf(((List)localObject2).size());
        QLog.d("Q.msg.BaseMessageManager", 2, localObject1);
      }
    }
    else
    {
      localObject1 = new ArrayList();
      localObject2 = ((List)localObject2).iterator();
    }
    for (;;)
    {
      if (!((Iterator)localObject2).hasNext()) {
        break label770;
      }
      localObject3 = (MessageRecord)((Iterator)localObject2).next();
      ((List)localObject1).add((ChatMessage)localObject3);
      Object localObject4 = ((MessageRecord)localObject3).getExtInfoFromExtStr("sens_msg_ctrl_info");
      Object localObject5;
      if (!TextUtils.isEmpty((CharSequence)localObject4))
      {
        if (((MessageRecord)localObject3).isSend())
        {
          ((MessageRecord)localObject3).saveExtInfoToExtStr("sens_msg_need_parse", Boolean.toString(false));
          continue;
          localObject1 = "clone is null";
          break;
        }
        localObject5 = new bankcode_info.BankcodeCtrlInfo();
      }
      try
      {
        ((bankcode_info.BankcodeCtrlInfo)localObject5).mergeFrom(HexUtil.hexStr2Bytes((String)localObject4));
        int i = 0;
        if (msgtail_id.has()) {
          i = msgtail_id.get();
        }
        if (i != 1) {
          continue;
        }
        ((ChatMessage)localObject3).parse();
        localObject4 = MessageRecordFactory.a(64522);
        msgtype = 64490;
        senderuin = selfuin;
        frienduin = paramString;
        istroop = istroop;
        msg = "";
        isread = true;
        shmsgseq = shmsgseq;
        time = time;
        ((MessageRecord)localObject4).saveExtInfoToExtStr("sens_msg_uniseq", Long.toString(uniseq));
        ((List)localObject1).add((ChatMessage)localObject4);
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
      if ((paramInt == 1008) && ((localObject3 instanceof MessageForStructing)))
      {
        localObject5 = ((MessageRecord)localObject3).getExtInfoFromExtStr("pa_phone_msg_tip");
        if (!TextUtils.isEmpty((CharSequence)localObject5))
        {
          localObject4 = new TroopTipsEntity();
          optContent = ((String)localObject5);
          ((TroopTipsMsgMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(80)).a((TroopTipsEntity)localObject4);
          localObject5 = new MessageForGrayTips();
          paramLong = time;
          localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          ((MessageForGrayTips)localObject5).init((String)localObject3, paramString, (String)localObject3, optContent, paramLong, 64488, paramInt, paramLong);
          isread = true;
          TroopTipsMsgMgr.a((MessageForGrayTips)localObject5, highlightItems);
          ((List)localObject1).add(localObject5);
        }
      }
    }
    label770:
    return localObject1;
  }
  
  public List a(List paramList, String paramString, int paramInt, ArrayList paramArrayList)
  {
    if ((paramInt == 3000) || (paramInt == 1)) {}
    for (paramInt = 1;; paramInt = 0)
    {
      paramString = new ArrayList();
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        RevokeMsgInfo localRevokeMsgInfo = (RevokeMsgInfo)paramArrayList.next();
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
          if ((paramInt != 0) && (shmsgseq == jdField_a_of_type_Long))
          {
            if (((!localMessageRecord.isSendFromLocal()) || (extraflag == 0)) && (!MsgProxyUtils.q(msgtype))) {
              paramString.add(localMessageRecord);
            }
          }
          else if ((paramInt == 0) && (shmsgseq == jdField_a_of_type_Long) && (msgUid == jdField_b_of_type_Long)) {
            paramString.add(localMessageRecord);
          }
        }
      }
    }
    return paramString;
  }
  
  public void a()
  {
    synchronized (b)
    {
      try
      {
        b.wait(15000L);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeRequest wait over");
        }
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeRequest wait interrupted");
          }
        }
      }
    }
  }
  
  /* Error */
  public void a(QQMessageFacade.Message paramMessage)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aload_1
    //   4: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   7: sipush 64533
    //   10: if_icmpeq +23 -> 33
    //   13: aload_1
    //   14: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   17: sipush 64504
    //   20: if_icmpeq +13 -> 33
    //   23: aload_1
    //   24: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   27: sipush 201
    //   30: if_icmpne +27 -> 57
    //   33: aload_1
    //   34: getfield 262	com/tencent/mobileqq/app/message/QQMessageFacade$Message:istroop	I
    //   37: sipush 1001
    //   40: if_icmpne +17 -> 57
    //   43: aload_1
    //   44: aload_1
    //   45: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   48: invokestatic 612	com/tencent/mobileqq/utils/ActionMsgUtil:a	(Ljava/lang/String;)LActionMsg/MsgBody;
    //   51: getfield 615	ActionMsg/MsgBody:msg	Ljava/lang/String;
    //   54: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   57: aload_1
    //   58: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   61: sipush 63518
    //   64: if_icmpne +619 -> 683
    //   67: new 617	tencent/mobileim/structmsg/structmsg$StructMsg
    //   70: dup
    //   71: invokespecial 618	tencent/mobileim/structmsg/structmsg$StructMsg:<init>	()V
    //   74: astore 7
    //   76: aload 7
    //   78: aload_1
    //   79: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   82: invokevirtual 619	tencent/mobileim/structmsg/structmsg$StructMsg:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   85: pop
    //   86: aload 7
    //   88: getfield 623	tencent/mobileim/structmsg/structmsg$StructMsg:msg_type	Lcom/tencent/mobileqq/pb/PBEnumField;
    //   91: invokevirtual 626	com/tencent/mobileqq/pb/PBEnumField:get	()I
    //   94: iconst_1
    //   95: if_icmpne +374 -> 469
    //   98: aload 7
    //   100: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   103: getfield 634	tencent/mobileim/structmsg/structmsg$SystemMsg:sub_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   106: invokevirtual 512	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   109: tableswitch	default:+2474->2583, 1:+276->385, 2:+39->148, 3:+39->148, 4:+297->406, 5:+318->427, 6:+339->448
    //   148: aload 7
    //   150: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   153: getfield 638	tencent/mobileim/structmsg/structmsg$SystemMsg:msg_describe	Lcom/tencent/mobileqq/pb/PBStringField;
    //   156: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   159: astore 5
    //   161: new 201	java/lang/StringBuilder
    //   164: dup
    //   165: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   168: aload 7
    //   170: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   173: getfield 645	tencent/mobileim/structmsg/structmsg$SystemMsg:req_uin_nick	Lcom/tencent/mobileqq/pb/PBStringField;
    //   176: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   179: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   182: aload 5
    //   184: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   187: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   190: astore 5
    //   192: aload_1
    //   193: aload 5
    //   195: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   198: aload_1
    //   199: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   202: invokestatic 646	com/tencent/mobileqq/utils/ActionMsgUtil:a	(I)Z
    //   205: ifne +33 -> 238
    //   208: aload_1
    //   209: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   212: sipush 62535
    //   215: if_icmpeq +23 -> 238
    //   218: aload_1
    //   219: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   222: sipush 35534
    //   225: if_icmpeq +13 -> 238
    //   228: aload_1
    //   229: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   232: sipush 35533
    //   235: if_icmpne +48 -> 283
    //   238: aload_1
    //   239: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   242: invokestatic 612	com/tencent/mobileqq/utils/ActionMsgUtil:a	(Ljava/lang/String;)LActionMsg/MsgBody;
    //   245: astore 5
    //   247: aload_1
    //   248: aload 5
    //   250: getfield 615	ActionMsg/MsgBody:msg	Ljava/lang/String;
    //   253: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   256: aload_1
    //   257: aload 5
    //   259: getfield 649	ActionMsg/MsgBody:action	Ljava/lang/String;
    //   262: putfield 650	com/tencent/mobileqq/app/message/QQMessageFacade$Message:action	Ljava/lang/String;
    //   265: aload_1
    //   266: aload 5
    //   268: getfield 653	ActionMsg/MsgBody:shareAppID	J
    //   271: putfield 654	com/tencent/mobileqq/app/message/QQMessageFacade$Message:shareAppID	J
    //   274: aload_1
    //   275: aload 5
    //   277: getfield 657	ActionMsg/MsgBody:actMsgContentValue	Ljava/lang/String;
    //   280: putfield 658	com/tencent/mobileqq/app/message/QQMessageFacade$Message:actMsgContentValue	Ljava/lang/String;
    //   283: getstatic 661	com/tencent/mobileqq/app/AppConstants:ar	Ljava/lang/String;
    //   286: aload_1
    //   287: getfield 251	com/tencent/mobileqq/app/message/QQMessageFacade$Message:senderuin	Ljava/lang/String;
    //   290: invokevirtual 98	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   293: ifeq +13 -> 306
    //   296: aload_1
    //   297: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   300: sipush 63525
    //   303: if_icmpeq +2274 -> 2577
    //   306: aload_0
    //   307: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   310: aload_1
    //   311: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   314: aload_1
    //   315: getfield 251	com/tencent/mobileqq/app/message/QQMessageFacade$Message:senderuin	Ljava/lang/String;
    //   318: aload_1
    //   319: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   322: invokestatic 667	com/tencent/mobileqq/data/SystemMsg:decode	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;I)Lcom/tencent/mobileqq/data/SystemMsg;
    //   325: astore 5
    //   327: aload_0
    //   328: aload_1
    //   329: invokevirtual 669	com/tencent/mobileqq/app/message/BaseMessageManager:b	(Lcom/tencent/mobileqq/app/message/QQMessageFacade$Message;)V
    //   332: aload 5
    //   334: ifnull +488 -> 822
    //   337: aload_1
    //   338: aload 5
    //   340: getfield 672	com/tencent/mobileqq/data/SystemMsg:message	Ljava/lang/String;
    //   343: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   346: invokestatic 675	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   349: ifeq +32 -> 381
    //   352: ldc 13
    //   354: iconst_4
    //   355: new 201	java/lang/StringBuilder
    //   358: dup
    //   359: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   362: ldc_w 677
    //   365: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   368: aload_1
    //   369: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   372: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   375: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   378: invokestatic 226	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   381: return
    //   382: astore_1
    //   383: aload_1
    //   384: athrow
    //   385: aload_0
    //   386: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   389: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   392: invokevirtual 686	com/tencent/qphone/base/util/BaseApplication:getResources	()Landroid/content/res/Resources;
    //   395: ldc_w 687
    //   398: invokevirtual 692	android/content/res/Resources:getString	(I)Ljava/lang/String;
    //   401: astore 5
    //   403: goto -242 -> 161
    //   406: aload_0
    //   407: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   410: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   413: invokevirtual 686	com/tencent/qphone/base/util/BaseApplication:getResources	()Landroid/content/res/Resources;
    //   416: ldc_w 693
    //   419: invokevirtual 692	android/content/res/Resources:getString	(I)Ljava/lang/String;
    //   422: astore 5
    //   424: goto -263 -> 161
    //   427: aload_0
    //   428: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   431: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   434: invokevirtual 686	com/tencent/qphone/base/util/BaseApplication:getResources	()Landroid/content/res/Resources;
    //   437: ldc_w 694
    //   440: invokevirtual 692	android/content/res/Resources:getString	(I)Ljava/lang/String;
    //   443: astore 5
    //   445: goto -284 -> 161
    //   448: aload_0
    //   449: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   452: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   455: invokevirtual 686	com/tencent/qphone/base/util/BaseApplication:getResources	()Landroid/content/res/Resources;
    //   458: ldc_w 695
    //   461: invokevirtual 692	android/content/res/Resources:getString	(I)Ljava/lang/String;
    //   464: astore 5
    //   466: goto -305 -> 161
    //   469: ldc 68
    //   471: astore 5
    //   473: aload 7
    //   475: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   478: getfield 698	tencent/mobileim/structmsg/structmsg$SystemMsg:group_msg_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   481: invokevirtual 512	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   484: istore_2
    //   485: invokestatic 199	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   488: ifeq +109 -> 597
    //   491: ldc 13
    //   493: iconst_2
    //   494: new 201	java/lang/StringBuilder
    //   497: dup
    //   498: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   501: ldc_w 700
    //   504: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   507: iload_2
    //   508: invokevirtual 213	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   511: ldc_w 702
    //   514: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   517: aload 7
    //   519: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   522: getfield 645	tencent/mobileim/structmsg/structmsg$SystemMsg:req_uin_nick	Lcom/tencent/mobileqq/pb/PBStringField;
    //   525: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   528: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   531: ldc_w 704
    //   534: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   537: aload 7
    //   539: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   542: getfield 707	tencent/mobileim/structmsg/structmsg$SystemMsg:actor_uin_nick	Lcom/tencent/mobileqq/pb/PBStringField;
    //   545: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   548: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   551: ldc_w 709
    //   554: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   557: aload 7
    //   559: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   562: getfield 712	tencent/mobileim/structmsg/structmsg$SystemMsg:action_uin_nick	Lcom/tencent/mobileqq/pb/PBStringField;
    //   565: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   568: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   571: ldc_w 714
    //   574: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   577: aload 7
    //   579: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   582: getfield 638	tencent/mobileim/structmsg/structmsg$SystemMsg:msg_describe	Lcom/tencent/mobileqq/pb/PBStringField;
    //   585: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   588: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   591: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   594: invokestatic 226	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   597: iload_2
    //   598: invokestatic 717	com/tencent/mobileqq/troop/utils/TroopUtils:a	(I)I
    //   601: istore_2
    //   602: iload_2
    //   603: iconst_1
    //   604: if_icmpne +55 -> 659
    //   607: aload 7
    //   609: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   612: getfield 712	tencent/mobileim/structmsg/structmsg$SystemMsg:action_uin_nick	Lcom/tencent/mobileqq/pb/PBStringField;
    //   615: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   618: astore 5
    //   620: aload 7
    //   622: new 201	java/lang/StringBuilder
    //   625: dup
    //   626: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   629: aload 5
    //   631: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   634: aload 7
    //   636: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   639: getfield 638	tencent/mobileim/structmsg/structmsg$SystemMsg:msg_describe	Lcom/tencent/mobileqq/pb/PBStringField;
    //   642: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   645: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   648: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   651: invokestatic 720	com/tencent/mobileqq/troop/utils/TroopUtils:a	(Ltencent/mobileim/structmsg/structmsg$StructMsg;Ljava/lang/String;)Ljava/lang/String;
    //   654: astore 5
    //   656: goto -464 -> 192
    //   659: iload_2
    //   660: iconst_2
    //   661: if_icmpne -41 -> 620
    //   664: aload 7
    //   666: getfield 629	tencent/mobileim/structmsg/structmsg$StructMsg:msg	Ltencent/mobileim/structmsg/structmsg$SystemMsg;
    //   669: getfield 645	tencent/mobileim/structmsg/structmsg$SystemMsg:req_uin_nick	Lcom/tencent/mobileqq/pb/PBStringField;
    //   672: invokevirtual 642	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   675: astore 5
    //   677: goto -57 -> 620
    //   680: astore_1
    //   681: aload_1
    //   682: athrow
    //   683: aload_1
    //   684: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   687: sipush 63525
    //   690: if_icmpne +37 -> 727
    //   693: aload_1
    //   694: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   697: invokestatic 725	com/tencent/mobileqq/structmsg/StructMsgFactory:a	([B)Lcom/tencent/mobileqq/structmsg/AbsStructMsg;
    //   700: astore 7
    //   702: ldc 68
    //   704: astore 5
    //   706: aload 7
    //   708: ifnull +10 -> 718
    //   711: aload 7
    //   713: getfield 730	com/tencent/mobileqq/structmsg/AbsStructMsg:mMsgBrief	Ljava/lang/String;
    //   716: astore 5
    //   718: aload_1
    //   719: aload 5
    //   721: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   724: goto -526 -> 198
    //   727: aload_1
    //   728: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   731: sipush 60527
    //   734: if_icmpne +37 -> 771
    //   737: aload_1
    //   738: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   741: invokestatic 735	com/tencent/bitapp/BitAppMsgFactory:a	([B)Lcom/tencent/bitapp/BitAppMsg;
    //   744: astore 7
    //   746: ldc 68
    //   748: astore 5
    //   750: aload 7
    //   752: ifnull +10 -> 762
    //   755: aload 7
    //   757: getfield 738	com/tencent/bitapp/BitAppMsg:mMsgBrief	Ljava/lang/String;
    //   760: astore 5
    //   762: aload_1
    //   763: aload 5
    //   765: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   768: goto -570 -> 198
    //   771: aload_1
    //   772: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   775: sipush 60533
    //   778: if_icmpne -580 -> 198
    //   781: new 740	tencent/im/s2c/msgtype0x210/submsgtype0x76/SubMsgType0x76$MsgBody
    //   784: dup
    //   785: invokespecial 741	tencent/im/s2c/msgtype0x210/submsgtype0x76/SubMsgType0x76$MsgBody:<init>	()V
    //   788: astore 5
    //   790: aload 5
    //   792: aload_1
    //   793: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   796: invokevirtual 742	tencent/im/s2c/msgtype0x210/submsgtype0x76/SubMsgType0x76$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   799: pop
    //   800: aload_1
    //   801: aload_0
    //   802: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   805: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   808: aload 5
    //   810: invokestatic 747	com/tencent/mobileqq/app/activateFriends/ActivateFriendsManager:a	(Landroid/content/Context;Ltencent/im/s2c/msgtype0x210/submsgtype0x76/SubMsgType0x76$MsgBody;)Ljava/lang/String;
    //   813: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   816: goto -618 -> 198
    //   819: astore_1
    //   820: aload_1
    //   821: athrow
    //   822: aload_1
    //   823: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   826: sipush 63529
    //   829: if_icmpne +21 -> 850
    //   832: aload_1
    //   833: aload_0
    //   834: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   837: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   840: ldc_w 748
    //   843: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   846: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   849: return
    //   850: aload_1
    //   851: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   854: sipush 64501
    //   857: if_icmpne +73 -> 930
    //   860: new 751	com/tencent/mobileqq/data/MessageForMixedMsg
    //   863: dup
    //   864: invokespecial 752	com/tencent/mobileqq/data/MessageForMixedMsg:<init>	()V
    //   867: astore 5
    //   869: aload 5
    //   871: aload_1
    //   872: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   875: putfield 753	com/tencent/mobileqq/data/MessageForMixedMsg:msgData	[B
    //   878: aload 5
    //   880: invokevirtual 754	com/tencent/mobileqq/data/MessageForMixedMsg:parse	()V
    //   883: aload_1
    //   884: aload 5
    //   886: getfield 755	com/tencent/mobileqq/data/MessageForMixedMsg:msg	Ljava/lang/String;
    //   889: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   892: aload_1
    //   893: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   896: ifnull -515 -> 381
    //   899: ldc 68
    //   901: aload_1
    //   902: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   905: invokevirtual 98	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   908: ifne -527 -> 381
    //   911: aload_1
    //   912: new 757	com/tencent/mobileqq/text/QQText
    //   915: dup
    //   916: aload_1
    //   917: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   920: iconst_3
    //   921: bipush 16
    //   923: invokespecial 760	com/tencent/mobileqq/text/QQText:<init>	(Ljava/lang/CharSequence;II)V
    //   926: putfield 764	com/tencent/mobileqq/app/message/QQMessageFacade$Message:emoRecentMsg	Ljava/lang/CharSequence;
    //   929: return
    //   930: aload_1
    //   931: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   934: sipush 60536
    //   937: if_icmpeq +13 -> 950
    //   940: aload_1
    //   941: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   944: sipush 60535
    //   947: if_icmpne +73 -> 1020
    //   950: new 766	com/tencent/mobileqq/data/MessageForNewGrayTips
    //   953: dup
    //   954: invokespecial 767	com/tencent/mobileqq/data/MessageForNewGrayTips:<init>	()V
    //   957: astore 5
    //   959: aload 5
    //   961: aload_1
    //   962: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   965: putfield 768	com/tencent/mobileqq/data/MessageForNewGrayTips:msgData	[B
    //   968: aload 5
    //   970: invokevirtual 769	com/tencent/mobileqq/data/MessageForNewGrayTips:parse	()V
    //   973: aload_1
    //   974: aload 5
    //   976: getfield 770	com/tencent/mobileqq/data/MessageForNewGrayTips:msg	Ljava/lang/String;
    //   979: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   982: aload_1
    //   983: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   986: ifnull -605 -> 381
    //   989: ldc 68
    //   991: aload_1
    //   992: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   995: invokevirtual 98	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   998: ifne -617 -> 381
    //   1001: aload_1
    //   1002: new 757	com/tencent/mobileqq/text/QQText
    //   1005: dup
    //   1006: aload_1
    //   1007: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1010: iconst_3
    //   1011: bipush 16
    //   1013: invokespecial 760	com/tencent/mobileqq/text/QQText:<init>	(Ljava/lang/CharSequence;II)V
    //   1016: putfield 764	com/tencent/mobileqq/app/message/QQMessageFacade$Message:emoRecentMsg	Ljava/lang/CharSequence;
    //   1019: return
    //   1020: aload_1
    //   1021: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1024: sipush 61036
    //   1027: if_icmpeq +43 -> 1070
    //   1030: aload_1
    //   1031: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1034: sipush 61034
    //   1037: if_icmpeq +33 -> 1070
    //   1040: aload_1
    //   1041: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1044: sipush 61033
    //   1047: if_icmpeq +23 -> 1070
    //   1050: aload_1
    //   1051: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1054: sipush 61035
    //   1057: if_icmpeq +13 -> 1070
    //   1060: aload_1
    //   1061: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1064: sipush 61027
    //   1067: if_icmpne +245 -> 1312
    //   1070: aload_1
    //   1071: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1074: ifnull -693 -> 381
    //   1077: aload_1
    //   1078: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1081: lookupswitch	default:+59->1140, -5001:+173->1254, -4509:+161->1242, -4503:+149->1230, -4502:+125->1206, -4501:+137->1218, -4500:+113->1194
    //   1140: aconst_null
    //   1141: astore 5
    //   1143: aload 5
    //   1145: ifnull -764 -> 381
    //   1148: aload 5
    //   1150: aload_1
    //   1151: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1154: putfield 771	com/tencent/mobileqq/data/ChatMessage:msgData	[B
    //   1157: aload 5
    //   1159: invokevirtual 515	com/tencent/mobileqq/data/ChatMessage:parse	()V
    //   1162: aload_1
    //   1163: aload 5
    //   1165: getfield 772	com/tencent/mobileqq/data/ChatMessage:msg	Ljava/lang/String;
    //   1168: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1171: aload_1
    //   1172: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1175: sipush 61035
    //   1178: if_icmpne +88 -> 1266
    //   1181: aload_1
    //   1182: aload 5
    //   1184: checkcast 774	com/tencent/device/msg/data/MessageForDevPtt
    //   1187: invokevirtual 777	com/tencent/device/msg/data/MessageForDevPtt:getSummary	()Ljava/lang/String;
    //   1190: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1193: return
    //   1194: new 779	com/tencent/mobileqq/data/MessageForDeviceFile
    //   1197: dup
    //   1198: invokespecial 780	com/tencent/mobileqq/data/MessageForDeviceFile:<init>	()V
    //   1201: astore 5
    //   1203: goto -60 -> 1143
    //   1206: new 782	com/tencent/mobileqq/data/MessageForDeviceSingleStruct
    //   1209: dup
    //   1210: invokespecial 783	com/tencent/mobileqq/data/MessageForDeviceSingleStruct:<init>	()V
    //   1213: astore 5
    //   1215: goto -72 -> 1143
    //   1218: new 774	com/tencent/device/msg/data/MessageForDevPtt
    //   1221: dup
    //   1222: invokespecial 784	com/tencent/device/msg/data/MessageForDevPtt:<init>	()V
    //   1225: astore 5
    //   1227: goto -84 -> 1143
    //   1230: new 786	com/tencent/device/msg/data/MessageForDevShortVideo
    //   1233: dup
    //   1234: invokespecial 787	com/tencent/device/msg/data/MessageForDevShortVideo:<init>	()V
    //   1237: astore 5
    //   1239: goto -96 -> 1143
    //   1242: new 789	com/tencent/device/msg/data/MessageForDevLittleVideo
    //   1245: dup
    //   1246: invokespecial 790	com/tencent/device/msg/data/MessageForDevLittleVideo:<init>	()V
    //   1249: astore 5
    //   1251: goto -108 -> 1143
    //   1254: new 766	com/tencent/mobileqq/data/MessageForNewGrayTips
    //   1257: dup
    //   1258: invokespecial 767	com/tencent/mobileqq/data/MessageForNewGrayTips:<init>	()V
    //   1261: astore 5
    //   1263: goto -120 -> 1143
    //   1266: aload_1
    //   1267: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1270: sipush 61033
    //   1273: if_icmpne +16 -> 1289
    //   1276: aload_1
    //   1277: aload 5
    //   1279: checkcast 786	com/tencent/device/msg/data/MessageForDevShortVideo
    //   1282: invokevirtual 791	com/tencent/device/msg/data/MessageForDevShortVideo:getSummary	()Ljava/lang/String;
    //   1285: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1288: return
    //   1289: aload_1
    //   1290: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1293: sipush 61027
    //   1296: if_icmpne -915 -> 381
    //   1299: aload_1
    //   1300: aload 5
    //   1302: checkcast 789	com/tencent/device/msg/data/MessageForDevLittleVideo
    //   1305: invokevirtual 792	com/tencent/device/msg/data/MessageForDevLittleVideo:getSummary	()Ljava/lang/String;
    //   1308: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1311: return
    //   1312: aload_1
    //   1313: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1316: sipush 62530
    //   1319: if_icmpeq +13 -> 1332
    //   1322: aload_1
    //   1323: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1326: sipush 60532
    //   1329: if_icmpne +67 -> 1396
    //   1332: aload_1
    //   1333: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1336: sipush 62530
    //   1339: if_icmpne +39 -> 1378
    //   1342: aload_1
    //   1343: aload_0
    //   1344: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1347: aload_1
    //   1348: iconst_0
    //   1349: invokestatic 798	com/tencent/mobileqq/data/MessageForPubAccount:getMsgSummary	(Lcom/tencent/mobileqq/app/QQAppInterface;Lcom/tencent/mobileqq/data/MessageRecord;Z)Ljava/lang/String;
    //   1352: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1355: aload_1
    //   1356: getfield 262	com/tencent/mobileqq/app/message/QQMessageFacade$Message:istroop	I
    //   1359: iconst_1
    //   1360: if_icmpne -979 -> 381
    //   1363: aload_1
    //   1364: aload_0
    //   1365: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1368: invokestatic 803	com/tencent/common/app/BaseApplicationImpl:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1371: invokestatic 808	com/tencent/biz/pubaccount/util/PublicAccountConfigUtil:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Landroid/content/Context;)Ljava/lang/String;
    //   1374: putfield 811	com/tencent/mobileqq/app/message/QQMessageFacade$Message:nickName	Ljava/lang/String;
    //   1377: return
    //   1378: aload_1
    //   1379: aload_0
    //   1380: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1383: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1386: ldc_w 812
    //   1389: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1392: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1395: return
    //   1396: aload_1
    //   1397: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1400: sipush 63526
    //   1403: if_icmpne +124 -> 1527
    //   1406: new 814	com/tencent/mobileqq/data/FunnyFaceMessage
    //   1409: dup
    //   1410: invokespecial 815	com/tencent/mobileqq/data/FunnyFaceMessage:<init>	()V
    //   1413: astore 5
    //   1415: aload 5
    //   1417: new 817	java/io/ObjectInputStream
    //   1420: dup
    //   1421: new 819	java/io/ByteArrayInputStream
    //   1424: dup
    //   1425: aload_1
    //   1426: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1429: invokespecial 822	java/io/ByteArrayInputStream:<init>	([B)V
    //   1432: invokespecial 825	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   1435: invokevirtual 829	com/tencent/mobileqq/data/FunnyFaceMessage:readExternal	(Ljava/io/ObjectInput;)V
    //   1438: aload 5
    //   1440: ifnull -1059 -> 381
    //   1443: aload 5
    //   1445: getfield 832	com/tencent/mobileqq/data/FunnyFaceMessage:faceId	I
    //   1448: iconst_1
    //   1449: if_icmpne +51 -> 1500
    //   1452: aload_1
    //   1453: aload_0
    //   1454: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1457: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1460: ldc_w 833
    //   1463: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1466: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1469: return
    //   1470: astore 7
    //   1472: aload 6
    //   1474: astore 5
    //   1476: invokestatic 199	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1479: ifeq -41 -> 1438
    //   1482: ldc 13
    //   1484: iconst_2
    //   1485: aload 7
    //   1487: invokevirtual 834	java/lang/Exception:toString	()Ljava/lang/String;
    //   1490: invokestatic 836	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1493: aload 6
    //   1495: astore 5
    //   1497: goto -59 -> 1438
    //   1500: aload 5
    //   1502: getfield 832	com/tencent/mobileqq/data/FunnyFaceMessage:faceId	I
    //   1505: iconst_2
    //   1506: if_icmpne -1125 -> 381
    //   1509: aload_1
    //   1510: aload_0
    //   1511: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1514: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1517: ldc_w 837
    //   1520: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1523: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1526: return
    //   1527: aload_1
    //   1528: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1531: sipush 63536
    //   1534: if_icmpne +21 -> 1555
    //   1537: aload_1
    //   1538: aload_0
    //   1539: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1542: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1545: ldc_w 838
    //   1548: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1551: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1554: return
    //   1555: aload_1
    //   1556: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1559: sipush 63531
    //   1562: if_icmpne +21 -> 1583
    //   1565: aload_1
    //   1566: aload_0
    //   1567: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1570: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1573: ldc_w 839
    //   1576: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1579: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1582: return
    //   1583: aload_1
    //   1584: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1587: sipush 63516
    //   1590: if_icmpne +92 -> 1682
    //   1593: aload_1
    //   1594: aload_0
    //   1595: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1598: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1601: ldc_w 840
    //   1604: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1607: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1610: aload_1
    //   1611: getfield 843	com/tencent/mobileqq/app/message/QQMessageFacade$Message:issend	I
    //   1614: invokestatic 846	com/tencent/mobileqq/utils/MsgUtils:a	(I)Z
    //   1617: ifeq +47 -> 1664
    //   1620: aload_0
    //   1621: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1624: aload_1
    //   1625: getfield 346	com/tencent/mobileqq/app/message/QQMessageFacade$Message:frienduin	Ljava/lang/String;
    //   1628: ldc 68
    //   1630: iconst_0
    //   1631: iconst_0
    //   1632: invokestatic 851	com/tencent/mobileqq/utils/ContactUtils:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;
    //   1635: astore 5
    //   1637: aload_1
    //   1638: aload_0
    //   1639: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1642: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1645: ldc_w 852
    //   1648: iconst_1
    //   1649: anewarray 35	java/lang/Object
    //   1652: dup
    //   1653: iconst_0
    //   1654: aload 5
    //   1656: aastore
    //   1657: invokevirtual 855	com/tencent/qphone/base/util/BaseApplication:getString	(I[Ljava/lang/Object;)Ljava/lang/String;
    //   1660: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1663: return
    //   1664: aload_1
    //   1665: aload_0
    //   1666: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1669: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1672: ldc_w 840
    //   1675: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1678: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1681: return
    //   1682: aload_1
    //   1683: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1686: sipush 63534
    //   1689: if_icmpeq +13 -> 1702
    //   1692: aload_1
    //   1693: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1696: sipush 64505
    //   1699: if_icmpne +56 -> 1755
    //   1702: aload_1
    //   1703: aload_0
    //   1704: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1707: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   1710: ldc_w 856
    //   1713: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   1716: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1719: aload_1
    //   1720: aload_0
    //   1721: getfield 44	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade	Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   1724: aload_1
    //   1725: getfield 346	com/tencent/mobileqq/app/message/QQMessageFacade$Message:frienduin	Ljava/lang/String;
    //   1728: aload_1
    //   1729: getfield 262	com/tencent/mobileqq/app/message/QQMessageFacade$Message:istroop	I
    //   1732: aload_1
    //   1733: getfield 343	com/tencent/mobileqq/app/message/QQMessageFacade$Message:uniseq	J
    //   1736: invokevirtual 859	com/tencent/mobileqq/app/message/QQMessageFacade:a	(Ljava/lang/String;IJ)Lcom/tencent/mobileqq/data/MessageRecord;
    //   1739: checkcast 861	com/tencent/mobileqq/data/MessageForPtt
    //   1742: getfield 864	com/tencent/mobileqq/data/MessageForPtt:url	Ljava/lang/String;
    //   1745: putfield 867	com/tencent/mobileqq/app/message/QQMessageFacade$Message:pttUrl	Ljava/lang/String;
    //   1748: return
    //   1749: astore_1
    //   1750: aload_1
    //   1751: invokevirtual 575	java/lang/Exception:printStackTrace	()V
    //   1754: return
    //   1755: aload_1
    //   1756: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1759: sipush 63511
    //   1762: if_icmpne +61 -> 1823
    //   1765: aload_1
    //   1766: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1769: ifnull -1388 -> 381
    //   1772: new 869	com/tencent/mobileqq/data/MessageForQQWalletMsg
    //   1775: dup
    //   1776: invokespecial 870	com/tencent/mobileqq/data/MessageForQQWalletMsg:<init>	()V
    //   1779: astore 5
    //   1781: aload 5
    //   1783: aload_1
    //   1784: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1787: putfield 871	com/tencent/mobileqq/data/MessageForQQWalletMsg:msgData	[B
    //   1790: aload 5
    //   1792: invokevirtual 872	com/tencent/mobileqq/data/MessageForQQWalletMsg:parse	()V
    //   1795: aload_1
    //   1796: aload 5
    //   1798: invokevirtual 874	com/tencent/mobileqq/data/MessageForQQWalletMsg:getMsgSummary	()Ljava/lang/String;
    //   1801: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1804: return
    //   1805: astore_1
    //   1806: invokestatic 199	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1809: ifeq -1428 -> 381
    //   1812: ldc 13
    //   1814: iconst_2
    //   1815: aload_1
    //   1816: invokevirtual 834	java/lang/Exception:toString	()Ljava/lang/String;
    //   1819: invokestatic 836	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1822: return
    //   1823: aload_1
    //   1824: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1827: sipush 63497
    //   1830: if_icmpne +99 -> 1929
    //   1833: aload_1
    //   1834: ldc_w 876
    //   1837: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1840: aload_1
    //   1841: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1844: ifnull -1463 -> 381
    //   1847: new 878	com/tencent/mobileqq/data/MessageForApollo
    //   1850: dup
    //   1851: invokespecial 879	com/tencent/mobileqq/data/MessageForApollo:<init>	()V
    //   1854: astore 5
    //   1856: aload 5
    //   1858: aload_1
    //   1859: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1862: putfield 880	com/tencent/mobileqq/data/MessageForApollo:msgData	[B
    //   1865: aload 5
    //   1867: invokevirtual 881	com/tencent/mobileqq/data/MessageForApollo:parse	()V
    //   1870: aload 5
    //   1872: getfield 885	com/tencent/mobileqq/data/MessageForApollo:mApolloMessage	Lcom/tencent/mobileqq/data/ApolloMessage;
    //   1875: ifnull -1494 -> 381
    //   1878: aload 5
    //   1880: getfield 885	com/tencent/mobileqq/data/MessageForApollo:mApolloMessage	Lcom/tencent/mobileqq/data/ApolloMessage;
    //   1883: getfield 890	com/tencent/mobileqq/data/ApolloMessage:name	[B
    //   1886: ifnull -1505 -> 381
    //   1889: aload_1
    //   1890: new 201	java/lang/StringBuilder
    //   1893: dup
    //   1894: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   1897: aload_1
    //   1898: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1901: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1904: new 94	java/lang/String
    //   1907: dup
    //   1908: aload 5
    //   1910: getfield 885	com/tencent/mobileqq/data/MessageForApollo:mApolloMessage	Lcom/tencent/mobileqq/data/ApolloMessage;
    //   1913: getfield 890	com/tencent/mobileqq/data/ApolloMessage:name	[B
    //   1916: invokespecial 891	java/lang/String:<init>	([B)V
    //   1919: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1922: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1925: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1928: return
    //   1929: aload_1
    //   1930: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   1933: sipush 60528
    //   1936: if_icmpne +39 -> 1975
    //   1939: aload_1
    //   1940: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1943: ifnull -1562 -> 381
    //   1946: new 893	com/tencent/mobileqq/data/ArkAppMessage
    //   1949: dup
    //   1950: invokespecial 894	com/tencent/mobileqq/data/ArkAppMessage:<init>	()V
    //   1953: astore 5
    //   1955: aload 5
    //   1957: aload_1
    //   1958: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   1961: invokevirtual 898	com/tencent/mobileqq/data/ArkAppMessage:fromBytes	([B)Z
    //   1964: pop
    //   1965: aload_1
    //   1966: aload 5
    //   1968: invokevirtual 901	com/tencent/mobileqq/data/ArkAppMessage:getSummery	()Ljava/lang/String;
    //   1971: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1974: return
    //   1975: aload_1
    //   1976: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1979: ifnull -1598 -> 381
    //   1982: ldc 68
    //   1984: aload_1
    //   1985: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1988: invokevirtual 98	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1991: ifne -1610 -> 381
    //   1994: aload_1
    //   1995: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   1998: astore 5
    //   2000: aload_0
    //   2001: aload 5
    //   2003: invokespecial 903	com/tencent/mobileqq/app/message/BaseMessageManager:a	(Ljava/lang/String;)Z
    //   2006: ifeq +254 -> 2260
    //   2009: aload 5
    //   2011: ldc 127
    //   2013: invokevirtual 131	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2016: iconst_1
    //   2017: aaload
    //   2018: ldc -123
    //   2020: invokevirtual 131	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2023: astore 5
    //   2025: aload 5
    //   2027: ifnull -1646 -> 381
    //   2030: aload 5
    //   2032: arraylength
    //   2033: iconst_2
    //   2034: if_icmpge +97 -> 2131
    //   2037: iconst_1
    //   2038: istore_2
    //   2039: aload_1
    //   2040: iload_2
    //   2041: putfield 906	com/tencent/mobileqq/app/message/QQMessageFacade$Message:fileType	I
    //   2044: aload 5
    //   2046: arraylength
    //   2047: iconst_2
    //   2048: if_icmpge +97 -> 2145
    //   2051: ldc2_w 411
    //   2054: lstore_3
    //   2055: aload_1
    //   2056: lload_3
    //   2057: putfield 909	com/tencent/mobileqq/app/message/QQMessageFacade$Message:fileSize	J
    //   2060: iload_2
    //   2061: lookupswitch	default:+51->2112, 0:+52->2113, 1:+127->2188, 2:+173->2234, 3:+-1680->381, 65538:+127->2188
    //   2112: return
    //   2113: aload_1
    //   2114: aload_0
    //   2115: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2118: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2121: ldc_w 839
    //   2124: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2127: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2130: return
    //   2131: aload 5
    //   2133: iconst_2
    //   2134: aaload
    //   2135: invokestatic 144	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   2138: invokevirtual 912	java/lang/Integer:intValue	()I
    //   2141: istore_2
    //   2142: goto -103 -> 2039
    //   2145: aload 5
    //   2147: iconst_1
    //   2148: aaload
    //   2149: invokestatic 139	java/lang/Long:valueOf	(Ljava/lang/String;)Ljava/lang/Long;
    //   2152: invokevirtual 915	java/lang/Long:longValue	()J
    //   2155: lstore_3
    //   2156: goto -101 -> 2055
    //   2159: astore 6
    //   2161: invokestatic 199	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2164: ifeq +14 -> 2178
    //   2167: ldc 13
    //   2169: iconst_2
    //   2170: ldc_w 917
    //   2173: aload 6
    //   2175: invokestatic 920	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   2178: aload_1
    //   2179: ldc2_w 411
    //   2182: putfield 909	com/tencent/mobileqq/app/message/QQMessageFacade$Message:fileSize	J
    //   2185: goto -125 -> 2060
    //   2188: aload_1
    //   2189: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   2192: sipush 62535
    //   2195: if_icmpne +21 -> 2216
    //   2198: aload_1
    //   2199: aload_0
    //   2200: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2203: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2206: ldc_w 921
    //   2209: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2212: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2215: return
    //   2216: aload_1
    //   2217: aload_0
    //   2218: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2221: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2224: ldc_w 838
    //   2227: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2230: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2233: return
    //   2234: aload_1
    //   2235: aload_0
    //   2236: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2239: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2242: ldc_w 856
    //   2245: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2248: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2251: aload_1
    //   2252: aload 5
    //   2254: iconst_0
    //   2255: aaload
    //   2256: putfield 867	com/tencent/mobileqq/app/message/QQMessageFacade$Message:pttUrl	Ljava/lang/String;
    //   2259: return
    //   2260: aload_1
    //   2261: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   2264: sipush 63530
    //   2267: if_icmpne +55 -> 2322
    //   2270: invokestatic 199	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2273: ifeq +12 -> 2285
    //   2276: ldc 13
    //   2278: iconst_2
    //   2279: ldc_w 923
    //   2282: invokestatic 836	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   2285: aload_1
    //   2286: new 201	java/lang/StringBuilder
    //   2289: dup
    //   2290: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   2293: aload_0
    //   2294: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2297: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2300: ldc_w 856
    //   2303: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2306: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2309: ldc_w 925
    //   2312: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2315: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2318: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2321: return
    //   2322: aload_1
    //   2323: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   2326: sipush 63528
    //   2329: if_icmpne +21 -> 2350
    //   2332: aload_1
    //   2333: aload_0
    //   2334: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2337: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2340: ldc_w 926
    //   2343: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2346: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2349: return
    //   2350: aload_1
    //   2351: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2354: ldc_w 928
    //   2357: invokevirtual 932	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2360: iconst_m1
    //   2361: if_icmpeq +97 -> 2458
    //   2364: aload_1
    //   2365: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2368: invokestatic 934	com/tencent/mobileqq/service/message/MessageUtils:a	(Ljava/lang/String;)[Ljava/lang/String;
    //   2371: astore 7
    //   2373: ldc 68
    //   2375: astore 6
    //   2377: aload 6
    //   2379: astore 5
    //   2381: aload 7
    //   2383: ifnull +20 -> 2403
    //   2386: aload 6
    //   2388: astore 5
    //   2390: aload 7
    //   2392: iconst_2
    //   2393: aaload
    //   2394: ifnull +9 -> 2403
    //   2397: aload 7
    //   2399: iconst_2
    //   2400: aaload
    //   2401: astore 5
    //   2403: aload_1
    //   2404: ldc_w 935
    //   2407: putfield 906	com/tencent/mobileqq/app/message/QQMessageFacade$Message:fileType	I
    //   2410: aload_1
    //   2411: new 201	java/lang/StringBuilder
    //   2414: dup
    //   2415: invokespecial 202	java/lang/StringBuilder:<init>	()V
    //   2418: ldc_w 937
    //   2421: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2424: aload_0
    //   2425: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2428: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2431: ldc_w 938
    //   2434: invokevirtual 749	com/tencent/qphone/base/util/BaseApplication:getString	(I)Ljava/lang/String;
    //   2437: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2440: ldc_w 940
    //   2443: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2446: aload 5
    //   2448: invokevirtual 208	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2451: invokevirtual 222	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2454: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2457: return
    //   2458: aload_1
    //   2459: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   2462: sipush 63507
    //   2465: if_icmpne +93 -> 2558
    //   2468: new 942	com/tencent/mobileqq/data/MessageForQQWalletTips
    //   2471: dup
    //   2472: invokespecial 943	com/tencent/mobileqq/data/MessageForQQWalletTips:<init>	()V
    //   2475: astore 5
    //   2477: aload 5
    //   2479: aload_1
    //   2480: getfield 944	com/tencent/mobileqq/app/message/QQMessageFacade$Message:selfuin	Ljava/lang/String;
    //   2483: aload_1
    //   2484: getfield 346	com/tencent/mobileqq/app/message/QQMessageFacade$Message:frienduin	Ljava/lang/String;
    //   2487: aload_1
    //   2488: getfield 251	com/tencent/mobileqq/app/message/QQMessageFacade$Message:senderuin	Ljava/lang/String;
    //   2491: ldc_w 946
    //   2494: invokestatic 950	com/tencent/mobileqq/service/message/MessageCache:a	()J
    //   2497: aload_1
    //   2498: getfield 607	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgtype	I
    //   2501: aload_1
    //   2502: getfield 262	com/tencent/mobileqq/app/message/QQMessageFacade$Message:istroop	I
    //   2505: invokestatic 950	com/tencent/mobileqq/service/message/MessageCache:a	()J
    //   2508: invokevirtual 951	com/tencent/mobileqq/data/MessageForQQWalletTips:init	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    //   2511: aload 5
    //   2513: aload_1
    //   2514: getfield 354	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msgData	[B
    //   2517: putfield 952	com/tencent/mobileqq/data/MessageForQQWalletTips:msgData	[B
    //   2520: aload 5
    //   2522: iconst_1
    //   2523: putfield 953	com/tencent/mobileqq/data/MessageForQQWalletTips:isread	Z
    //   2526: aload 5
    //   2528: invokevirtual 954	com/tencent/mobileqq/data/MessageForQQWalletTips:parse	()V
    //   2531: aload 5
    //   2533: aload_0
    //   2534: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2537: aload_0
    //   2538: getfield 42	com/tencent/mobileqq/app/message/BaseMessageManager:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2541: invokevirtual 680	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2544: aconst_null
    //   2545: invokevirtual 958	com/tencent/mobileqq/data/MessageForQQWalletTips:buildQQWalletTips	(Lcom/tencent/mobileqq/app/QQAppInterface;Landroid/content/Context;Landroid/widget/TextView;)V
    //   2548: aload_1
    //   2549: aload 5
    //   2551: getfield 961	com/tencent/mobileqq/data/MessageForQQWalletTips:summary	Ljava/lang/String;
    //   2554: putfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2557: return
    //   2558: aload_1
    //   2559: new 757	com/tencent/mobileqq/text/QQText
    //   2562: dup
    //   2563: aload_1
    //   2564: getfield 366	com/tencent/mobileqq/app/message/QQMessageFacade$Message:msg	Ljava/lang/String;
    //   2567: iconst_3
    //   2568: bipush 16
    //   2570: invokespecial 760	com/tencent/mobileqq/text/QQText:<init>	(Ljava/lang/CharSequence;II)V
    //   2573: putfield 764	com/tencent/mobileqq/app/message/QQMessageFacade$Message:emoRecentMsg	Ljava/lang/CharSequence;
    //   2576: return
    //   2577: aconst_null
    //   2578: astore 5
    //   2580: goto -2253 -> 327
    //   2583: goto -2435 -> 148
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	2586	0	this	BaseMessageManager
    //   0	2586	1	paramMessage	QQMessageFacade.Message
    //   484	1658	2	i	int
    //   2054	102	3	l	long
    //   159	2420	5	localObject1	Object
    //   1	1493	6	localObject2	Object
    //   2159	15	6	localException1	Exception
    //   2375	12	6	str	String
    //   74	682	7	localObject3	Object
    //   1470	16	7	localException2	Exception
    //   2371	27	7	arrayOfString	String[]
    // Exception table:
    //   from	to	target	type
    //   43	57	382	java/lang/Exception
    //   67	148	680	java/lang/Exception
    //   148	161	680	java/lang/Exception
    //   161	192	680	java/lang/Exception
    //   192	198	680	java/lang/Exception
    //   385	403	680	java/lang/Exception
    //   406	424	680	java/lang/Exception
    //   427	445	680	java/lang/Exception
    //   448	466	680	java/lang/Exception
    //   473	597	680	java/lang/Exception
    //   597	602	680	java/lang/Exception
    //   607	620	680	java/lang/Exception
    //   620	656	680	java/lang/Exception
    //   664	677	680	java/lang/Exception
    //   238	283	819	java/lang/Exception
    //   1415	1438	1470	java/lang/Exception
    //   1719	1748	1749	java/lang/Exception
    //   1772	1804	1805	java/lang/Exception
    //   2044	2051	2159	java/lang/Exception
    //   2055	2060	2159	java/lang/Exception
    //   2145	2156	2159	java/lang/Exception
  }
  
  public void a(QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (h)
      {
        h = false;
        jdField_a_of_type_JavaLangObject.notify();
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "refreshMessageListHead notify");
        }
      }
      return;
    }
  }
  
  protected void a(QQMessageFacade.RefreshMessageContext paramRefreshMessageContext, int paramInt)
  {
    int j;
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
    {
      j = 1;
      MsgProxyUtils.a(jdField_a_of_type_JavaUtilList);
      i = j;
      if (jdField_a_of_type_JavaUtilList.size() > 0) {
        MsgProxyUtils.a(jdField_a_of_type_JavaLangString, jdField_c_of_type_Int, jdField_a_of_type_JavaUtilList, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
    }
    for (int i = j;; i = 0)
    {
      String str = jdField_a_of_type_JavaLangString;
      j = jdField_d_of_type_Int;
      if ((jdField_d_of_type_Boolean) && (i != 0) && (jdField_a_of_type_JavaUtilList.isEmpty()) && (jdField_a_of_type_Int < 9))
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "refreshHeadComplete : the list is empty after the filter, trying to get more. [ index:" + jdField_a_of_type_Int + " ]");
        }
        jdField_a_of_type_Int += 1;
        b(str, paramInt, j, paramRefreshMessageContext);
      }
      do
      {
        return;
        jdField_a_of_type_Int = 0;
        b = 0;
      } while (!f);
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
      return;
    }
  }
  
  public void a(MessageRecord paramMessageRecord)
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(frienduin, istroop);
    if (localObject1 != null)
    {
      a((MessageRecord)localObject1, true, 4);
      b(frienduin, istroop, (MessageRecord)localObject1, 4);
    }
    for (;;)
    {
      return;
      Object localObject2 = null;
      Object localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      if (MsgProxyUtils.a(istroop) == 1001) {
        if (MsgProxyUtils.c(paramMessageRecord))
        {
          a(AppConstants.aN, 1001, frienduin, (String)localObject3);
          localObject3 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aN, 1001);
          localObject1 = localObject2;
          if (localObject3 != null)
          {
            localObject1 = localObject2;
            if (senderuin != null)
            {
              localObject1 = localObject2;
              if (senderuin.equals(frienduin))
              {
                ((QQMessageFacade.Message)localObject3).cleanMessageRecordBaseField();
                localObject1 = localObject2;
              }
            }
          }
        }
      }
      while ((localObject1 != null) && (senderuin != null) && (senderuin.equals(frienduin)))
      {
        ((QQMessageFacade.Message)localObject1).cleanMessageRecordBaseField();
        return;
        a(AppConstants.aq, 1001, frienduin, (String)localObject3);
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aq, 1001);
        continue;
        if (MsgProxyUtils.a(istroop) == 1009)
        {
          a(AppConstants.af, 1009, frienduin, (String)localObject3);
          localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.af, 1009);
        }
        else
        {
          localObject1 = localObject2;
          if (MsgProxyUtils.a(istroop) == 1010) {
            if (MsgProxyUtils.c(paramMessageRecord))
            {
              a(AppConstants.aO, 1010, frienduin, (String)localObject3);
              localObject3 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aO, 1010);
              localObject1 = localObject2;
              if (localObject3 != null)
              {
                localObject1 = localObject2;
                if (senderuin != null)
                {
                  localObject1 = localObject2;
                  if (senderuin.equals(frienduin))
                  {
                    ((QQMessageFacade.Message)localObject3).cleanMessageRecordBaseField();
                    localObject1 = localObject2;
                  }
                }
              }
            }
            else
            {
              a(AppConstants.aG, 1010, frienduin, (String)localObject3);
              localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aG, 1010);
            }
          }
        }
      }
    }
  }
  
  protected void a(MessageRecord paramMessageRecord, ProxyListener paramProxyListener, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a(frienduin, istroop, paramMessageRecord, paramProxyListener, paramBoolean1, paramBoolean2, true);
    a(paramMessageRecord, true, paramInt);
  }
  
  public void a(MessageRecord paramMessageRecord, EntityManager paramEntityManager, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, BaseMessageManager.AddMessageContext paramAddMessageContext)
  {
    if (paramMessageRecord == null) {}
    int i;
    MessageRecord localMessageRecord;
    do
    {
      do
      {
        return;
        paramEntityManager = c;
        if (time == 0L) {
          time = MessageCache.a();
        }
        if (msgseq == 0L) {
          msgseq = ((int)time);
        }
        paramAddMessageContext = frienduin;
        i = istroop;
        if ((paramMessageRecord.isSendFromLocal()) && ((istroop == 3000) || (istroop == 1) || (istroop == 0)) && (extraflag == 0))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageManager", 2, "addMessage set sendmsg extra " + paramMessageRecord.getBaseInfoString());
          }
          extraflag = 32772;
          sendFailCode = 0;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a(frienduin, istroop, paramMessageRecord, null, paramBoolean1, paramBoolean2, paramBoolean4);
        if ((istroop != 3000) && (istroop != 1) && (istroop != 0)) {
          break;
        }
      } while (!a(paramMessageRecord, false, 1));
      if ((!paramEntityManager.containsKey(MsgProxyUtils.a(paramAddMessageContext, i))) || (paramMessageRecord.isSendFromLocal()))
      {
        paramEntityManager.put(MsgProxyUtils.a(paramAddMessageContext, i), paramMessageRecord);
        return;
      }
      localMessageRecord = (MessageRecord)paramEntityManager.get(MsgProxyUtils.a(paramAddMessageContext, i));
    } while (a(paramMessageRecord) < a(localMessageRecord));
    paramEntityManager.put(MsgProxyUtils.a(paramAddMessageContext, i), paramMessageRecord);
    return;
    a(paramMessageRecord, true, 1);
  }
  
  public void a(MessageRecord paramMessageRecord, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = 1;
    int j = 0;
    ArrayList localArrayList = new ArrayList();
    if ((paramMessageRecord instanceof MessageForLongMsg))
    {
      localArrayList.addAll(longMsgFragmentList);
      if (!MsgProxyUtils.a(paramMessageRecord, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(frienduin, istroop))) {
        break label346;
      }
      i = 1;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "-->removeMsgByMessageRecord :" + paramMessageRecord);
      }
      Object localObject = MsgProxyUtils.a(frienduin, istroop);
      if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.containsKey(localObject))
      {
        localObject = (QQMessageFacade.Message)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(localObject);
        if ((!isread) && (localObject != null)) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, (MessageRecord)localObject);
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramMessageRecord);
      int k = localArrayList.size();
      for (;;)
      {
        if (j < k)
        {
          localObject = (MessageRecord)localArrayList.get(j);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a((MessageRecord)localObject, paramBoolean2);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c((MessageRecord)localObject);
          j += 1;
          continue;
          localArrayList.add(paramMessageRecord);
          if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramMessageRecord)) {
            break;
          }
          i = 0;
          break;
        }
      }
      if (paramBoolean1) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramMessageRecord);
      }
      if (i != 0)
      {
        if (!MsgProxyUtils.s(istroop)) {
          break label338;
        }
        a(paramMessageRecord);
      }
      for (;;)
      {
        if (paramBoolean2) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).f();
        }
        return;
        label338:
        b(paramMessageRecord);
      }
      label346:
      i = 0;
    }
  }
  
  public void a(String paramString, int paramInt) {}
  
  public void a(String paramString, int paramInt1, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    jdField_d_of_type_Boolean = true;
    jdField_a_of_type_JavaLangString = paramString;
    jdField_c_of_type_Int = paramInt1;
    jdField_d_of_type_Int = paramInt2;
    if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b.containsKey(MsgProxyUtils.a(paramString, paramInt1)))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "refreshMessageListHead UNFINISHED ERROR uin = " + paramString + ", type = " + paramInt1);
      }
      if ((h) && (QLog.isColorLevel())) {
        QLog.d("Q.msg.BaseMessageManager", 2, "numTroopRefresh = " + h + ", refreshActionMap[" + MsgProxyUtils.a(paramString, paramInt1) + "] = " + jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b.get(MsgProxyUtils.a(paramString, paramInt1)));
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramRefreshMessageContext);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b.put(MsgProxyUtils.a(paramString, paramInt1), Boolean.valueOf(true));
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new niz(this, paramString, paramInt1, paramInt2, paramRefreshMessageContext));
  }
  
  public void a(String paramString, int paramInt, long paramLong)
  {
    int j = 1;
    List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt, false, false);
    if ((localList == null) || (localList.size() == 0)) {
      return;
    }
    int i = j;
    long l;
    if (paramInt != 3000)
    {
      if (paramInt == 1) {
        i = j;
      }
    }
    else
    {
      if (i == 0) {
        break label122;
      }
      l = get0shmsgseq;
      label77:
      if (i == 0) {
        break label141;
      }
    }
    label122:
    label141:
    for (localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).c(paramString, paramInt, paramLong, l);; localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).d(paramString, paramInt, paramLong, l))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt, localList);
      return;
      i = 0;
      break;
      l = get0time;
      break label77;
    }
  }
  
  public void a(String paramString, int paramInt, long paramLong, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "setReadFrom uin=" + paramString + ",type=" + paramInt + ",from=" + paramLong + ",force=" + paramBoolean);
    }
    if (paramLong < 0L) {}
    do
    {
      return;
      if (paramString != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.msg.BaseMessageManager", 2, "setReadFrom return : uin=null");
    return;
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt) <= 0) && (!paramBoolean))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "setReadFrom return : unread=0");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt, paramLong, true);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt, paramLong);
    b(paramString, paramInt, paramLong);
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt));
  }
  
  public void a(String paramString, int paramInt1, MessageRecord paramMessageRecord, int paramInt2)
  {
    List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).b(paramString, paramInt1);
    QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt1);
    if ((paramMessageRecord != null) && (paramMessageRecord.isLongMsg())) {
      if ((MsgProxyUtils.a(paramMessageRecord, localMessage)) && (((paramInt2 == 3) && (extraflag == 32768)) || (longMsgIndex == longMsgIndex)))
      {
        a(paramMessageRecord, true, paramInt2);
        b(paramString, paramInt1, paramMessageRecord, paramInt2);
      }
    }
    while ((paramMessageRecord == null) || (localList == null) || (localList.isEmpty()) || (uniseq != getsize1uniseq)) {
      return;
    }
    a(paramMessageRecord, true, paramInt2);
    b(paramString, paramInt1, paramMessageRecord, paramInt2);
  }
  
  public void a(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    a(paramString1, paramInt, paramString2, paramString3, true);
  }
  
  public void a(String paramString1, int paramInt, String paramString2, String paramString3, long paramLong)
  {
    if ((paramInt == 1008) && (TroopBarAssistantManager.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1))) {}
    while ((paramInt == 1008) && (((EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87)).a(paramString1))) {
      return;
    }
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString1, paramInt)) || (!MsgProxyUtils.s(paramInt)))
    {
      paramString3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      if (0L == paramLong)
      {
        paramString1 = paramString3.b(paramString1, paramInt);
        paramString2 = paramString1;
        if (paramString1 != null)
        {
          lastmsgdrafttime = paramLong;
          if ((0L != paramLong) || (lastmsgtime != 0L)) {
            break label158;
          }
          paramString3.b(paramString1);
          paramString2 = paramString1;
        }
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString2);
      return;
      paramString1 = paramString3.a(paramString1, paramInt);
      troopUin = paramString2;
      break;
      label158:
      HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString1);
      paramString3.a(paramString1);
      paramString2 = paramString1;
      continue;
      paramString2 = null;
    }
  }
  
  public void a(String paramString1, int paramInt, String paramString2, String paramString3, boolean paramBoolean)
  {
    String str;
    if (MsgProxyUtils.c(paramString1))
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString1, paramInt, paramString2, paramString3);
      if (paramInt == 1010) {
        str = AppConstants.aG;
      }
    }
    for (;;)
    {
      if (TextUtils.isEmpty(str)) {}
      label535:
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  for (;;)
                  {
                    return;
                    if (paramInt != 1001) {
                      break label581;
                    }
                    str = AppConstants.aq;
                    break;
                    QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString1, paramInt);
                    if ((senderuin != null) && (senderuin.equals(paramString2)))
                    {
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(str, paramInt, paramString1, paramString3);
                      paramString2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).b(paramString1, paramInt);
                      if ((paramString2 != null) && (!paramString2.isEmpty()))
                      {
                        paramString2 = (MessageRecord)paramString2.get(paramString2.size() - 1);
                        paramString3 = MessageRecordFactory.a(msgtype);
                        MessageRecord.copyMessageRecordBaseField(paramString3, paramString2);
                        frienduin = str;
                        senderuin = paramString1;
                        if (!MsgProxyUtils.g(msgtype)) {
                          a(paramString3, null, false, true, 1);
                        }
                        MessageRecord.copyMessageRecordBaseField(localMessage, paramString2);
                        frienduin = paramString1;
                        emoRecentMsg = null;
                      }
                      try
                      {
                        a(localMessage);
                        paramString2 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(str, paramInt);
                        if ((senderuin != null) && (senderuin.equals(paramString1)))
                        {
                          paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).b(str, paramInt);
                          if ((paramString1 != null) && (!paramString1.isEmpty()))
                          {
                            MessageRecord.copyMessageRecordBaseField(paramString2, (MessageRecord)paramString1.get(paramString1.size() - 1));
                            frienduin = str;
                            emoRecentMsg = null;
                            try
                            {
                              a(paramString2);
                              return;
                            }
                            catch (Throwable paramString1) {}
                            if (!QLog.isColorLevel()) {
                              continue;
                            }
                            QLog.d("Q.msg.BaseMessageManager", 2, "removeMsgFromMsgBox ERROR", paramString1);
                          }
                        }
                      }
                      catch (Throwable paramString2)
                      {
                        for (;;)
                        {
                          if (QLog.isColorLevel()) {
                            QLog.d("Q.msg.BaseMessageManager", 2, "removeMsgFromMsgBox decode msgInLBSBox ERROR", paramString2);
                          }
                        }
                        emoRecentMsg = null;
                        msg = null;
                      }
                    }
                  }
                } while (!paramBoolean);
                paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(str, paramInt);
              } while (paramString1 == null);
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString1);
              return;
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString1, paramInt, paramString2, paramString3);
              paramString3 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString1, paramInt);
            } while ((senderuin == null) || (!senderuin.equals(paramString2)));
            paramString2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).b(paramString1, paramInt);
            if ((paramString2 == null) || (paramString2.isEmpty())) {
              break label535;
            }
            MessageRecord.copyMessageRecordBaseField(paramString3, (MessageRecord)paramString2.get(paramString2.size() - 1));
            frienduin = paramString1;
            emoRecentMsg = null;
            try
            {
              a(paramString3);
              return;
            }
            catch (Throwable paramString1) {}
          } while (!QLog.isColorLevel());
          QLog.d("Q.msg.BaseMessageManager", 2, "removeMsgFromMsgBox ERROR", paramString1);
          return;
          emoRecentMsg = null;
          msg = null;
        } while (!paramBoolean);
        paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramString1, paramInt);
      } while (paramString1 == null);
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString1);
      return;
      label581:
      str = "";
    }
  }
  
  public abstract void a(String paramString, int paramInt, List paramList1, List paramList2, Bundle paramBundle);
  
  public void a(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "setReaded uin=" + paramString + ",type=" + paramInt + ",needDelMark=" + paramBoolean2);
    }
    if (paramString == null) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "setReaded return : uin=null");
      }
    }
    do
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt) > 0) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.msg.BaseMessageManager", 2, "setReaded return : unread=0");
    return;
    MessageRecord localMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt);
    ConversationFacade localConversationFacade = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    if (localMessageRecord != null) {}
    for (long l = a(localMessageRecord);; l = 0L)
    {
      localConversationFacade.a(paramString, paramInt, l, paramBoolean1, paramBoolean2);
      a(paramString, paramInt);
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt));
      return;
    }
  }
  
  public void a(ArrayList paramArrayList)
  {
    Object localObject3 = (RevokeMsgInfo)paramArrayList.get(0);
    int i = jdField_a_of_type_Int;
    Object localObject1 = jdField_a_of_type_JavaLangString;
    if (QLog.isColorLevel()) {
      QLog.w("Q.msg.BaseMessageManager", 2, "doReplaceRevokedMsgAndNotify frienduin = " + (String)localObject1 + ", istroop = " + i);
    }
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(i).e((String)localObject1, i);
    if ((localObject2 == null) || (((List)localObject2).isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "doReplaceRevokedMsgAndNotify error: AIO is empty");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a((String)localObject1, i, UncommonMessageProcessor.g, UncommonMessageProcessor.l);
    }
    do
    {
      return;
      localObject2 = a((List)localObject2, (String)localObject1, i, paramArrayList);
      if ((localObject2 == null) || (((List)localObject2).isEmpty()))
      {
        if (QLog.isColorLevel()) {
          QLog.w("Q.msg.BaseMessageManager", 2, "doReplaceRevokedMsgAndNotify error: can't find previous msg in AIO");
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a((String)localObject1, i, UncommonMessageProcessor.g, UncommonMessageProcessor.m);
        return;
      }
    } while ((localObject2 != null) && (((List)localObject2).size() == 1) && (get0msgtype == 63505));
    paramArrayList = (MessageRecord)((List)localObject2).get(0);
    Object localObject4 = ((List)localObject2).iterator();
    while (((Iterator)localObject4).hasNext())
    {
      localObject1 = (MessageRecord)((Iterator)localObject4).next();
      if ((shmsgseq == jdField_a_of_type_Long) && (msgUid == jdField_b_of_type_Long)) {
        paramArrayList = (ArrayList)localObject1;
      }
    }
    for (;;)
    {
      localObject3 = "你" + BaseApplicationImpl.a().getString(2131371843);
      localObject1 = (MessageForGrayTips)MessageRecordFactory.a(63505);
      ((MessageForGrayTips)localObject1).init(selfuin, frienduin, senderuin, (String)localObject3, time, 63505, istroop, msgseq);
      msgUid = msgUid;
      shmsgseq = shmsgseq;
      isread = true;
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject4 = (MessageRecord)((Iterator)localObject2).next();
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq, false);
        if (msgtype == 63531)
        {
          localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          localObject4 = ((FileManagerDataCenter)localObject3).a(uniseq, frienduin, istroop);
          if (localObject4 != null)
          {
            ((FileManagerDataCenter)localObject3).b((FileManagerEntity)localObject4);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(nSessionId);
          }
          if (istroop == 3000) {
            FileManagerReporter.a("0X8005E50");
          }
          for (;;)
          {
            FileManagerReporter.a("0X8005E4C");
            break;
            FileManagerReporter.a("0X8005E4D");
          }
        }
      }
      paramArrayList = new ArrayList();
      paramArrayList.add(localObject1);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramArrayList, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(null, true);
      return;
    }
  }
  
  public void a(List paramList, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramList.size() == 0) {}
    label475:
    label482:
    for (;;)
    {
      return;
      ArrayList localArrayList = new ArrayList();
      MessageRecord localMessageRecord1 = (MessageRecord)paramList.get(paramList.size() - 1);
      Object localObject1 = paramList.iterator();
      Object localObject2;
      if (((Iterator)localObject1).hasNext())
      {
        localObject2 = (MessageRecord)((Iterator)localObject1).next();
        if ((localObject2 instanceof MessageForLongMsg)) {
          localArrayList.addAll(longMsgFragmentList);
        }
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageManager", 2, "-->removeMsgByMessageRecord :" + localObject2);
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a((MessageRecord)localObject2);
          break;
          localArrayList.add(localObject2);
        }
      }
      localObject1 = MsgProxyUtils.a(frienduin, istroop);
      if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.containsKey(localObject1))
      {
        localObject1 = (QQMessageFacade.Message)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.get(localObject1);
        if (localObject1 != null)
        {
          localObject2 = new ArrayList();
          paramList = paramList.iterator();
          while (paramList.hasNext())
          {
            MessageRecord localMessageRecord2 = (MessageRecord)paramList.next();
            if (!isread) {
              ((List)localObject2).add(localMessageRecord2);
            }
          }
          if (((List)localObject2).size() != 0) {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, (List)localObject2);
          }
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).a(localArrayList, paramBoolean2);
      paramList = localArrayList.iterator();
      while (paramList.hasNext())
      {
        localObject1 = (MessageRecord)paramList.next();
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c((MessageRecord)localObject1);
      }
      if (paramBoolean1) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(localArrayList);
      }
      int i = 0;
      if ((localMessageRecord1 instanceof MessageForLongMsg))
      {
        if (MsgProxyUtils.a(localMessageRecord1, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(frienduin, istroop))) {
          i = 1;
        }
        if (i != 0)
        {
          if (!MsgProxyUtils.s(istroop)) {
            break label475;
          }
          a(localMessageRecord1);
        }
      }
      for (;;)
      {
        if (!paramBoolean2) {
          break label482;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).f();
        return;
        if (!jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localMessageRecord1)) {
          break;
        }
        i = 1;
        break;
        b(localMessageRecord1);
      }
    }
  }
  
  public boolean a(MessageRecord paramMessageRecord)
  {
    if ((paramMessageRecord instanceof MessageForShortVideo))
    {
      MessageForShortVideo localMessageForShortVideo = (MessageForShortVideo)paramMessageRecord;
      if (busiType == 0)
      {
        if ((videoFileStatus == 1007) || ((videoFileStatus == 1003) && (extraflag == 32772))) {}
        for (boolean bool = true; !bool; bool = false) {
          return false;
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeReqForRichMsg, holdFlag: " + bool);
        }
        e(paramMessageRecord);
        return true;
      }
    }
    else if ((paramMessageRecord instanceof MessageForPic))
    {
      paramMessageRecord = (MessageForPic)paramMessageRecord;
      if (extraflag == 32772)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeReqForRichMsg, msgForPic");
        }
        e(paramMessageRecord);
        return true;
      }
    }
    return false;
  }
  
  public boolean a(MessageRecord paramMessageRecord, boolean paramBoolean, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab " + paramMessageRecord.getBaseInfoString() + ",reason " + paramInt);
    }
    boolean bool;
    if (paramMessageRecord == null)
    {
      bool = false;
      return bool;
    }
    if (paramMessageRecord.isLongMsg())
    {
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessageRecord))
      {
        if ((paramInt == 1) && (!paramMessageRecord.isSendFromLocal()) && (!isread) && (!String.valueOf(AppConstants.am).equals(frienduin))) {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(null);
        }
        return false;
      }
      paramMessageRecord = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramMessageRecord);
    }
    for (;;)
    {
      if ((isValid) && (!MsgProxyUtils.g(msgtype)))
      {
        QQMessageFacade.Message localMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(frienduin, istroop);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab getLastMessage " + localMessage.getBaseInfoString());
        }
        if (paramInt == 1)
        {
          int i = 0;
          if ((istroop == 3000) || (istroop == 1))
          {
            paramInt = i;
            if (!paramMessageRecord.isSendFromLocal())
            {
              paramInt = i;
              if (shmsgseq < shmsgseq) {
                paramInt = 1;
              }
            }
          }
          while (MsgProxyUtils.a(paramMessageRecord, localMessage)) {
            if (longMsgIndex >= longMsgIndex)
            {
              return false;
              paramInt = i;
              if (MsgProxyUtils.c(istroop))
              {
                paramInt = i;
                if (!paramMessageRecord.isSendFromLocal())
                {
                  paramInt = i;
                  if (time < time) {
                    paramInt = 1;
                  }
                }
              }
            }
            else
            {
              paramInt = 0;
            }
          }
        }
        for (;;)
        {
          if (paramInt == 0)
          {
            MessageRecord.copyMessageRecordBaseField(localMessage, paramMessageRecord);
            emoRecentMsg = null;
            fileType = -1;
            if (!paramBoolean) {}
          }
          for (;;)
          {
            try
            {
              a(localMessage);
              Object localObject;
              if ((paramMessageRecord instanceof MessageForReplyText))
              {
                localObject = (MessageForReplyText)paramMessageRecord;
                if ((atInfoList != null) && (atInfoList.size() > 0) && (TextUtils.isEmpty(mSourceMsgInfo.mAnonymousNickName)))
                {
                  localObject = (MessageForText.AtTroopMemberInfo)atInfoList.get(0);
                  msg = msg.substring(textLen + 1);
                }
              }
              bool = true;
              if ((!paramMessageRecord.isSend()) && (!MessageUtils.a(msgtype)))
              {
                hasReply = true;
                if (QLog.isColorLevel()) {
                  QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab = " + localMessage + ",hasReply=" + hasReply);
                }
              }
              if (((paramMessageRecord.isSendFromLocal()) || (isread)) && (msgtype != 64523) && (msgtype != 64517))
              {
                paramBoolean = bool;
                if (msgtype != 64518) {}
              }
              else
              {
                if ((msgtype == 64523) || (msgtype == 64517) || (msgtype == 64518)) {
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(localMessage);
                }
                if ((!String.valueOf(AppConstants.am).equals(frienduin)) && ((!MsgProxyUtils.c(localMessage)) || (MsgProxyUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramMessageRecord))) && (istroop != 7100)) {
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(localMessage);
                }
                if (((msgtype == 63527) || (msgtype == 63520)) && (paramInt != 0))
                {
                  localObject = new QQMessageFacade.Message();
                  MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject, paramMessageRecord);
                  emoRecentMsg = null;
                  fileType = -1;
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b((QQMessageFacade.Message)localObject);
                }
                if (AppConstants.ap.equals(frienduin))
                {
                  paramInt = SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                  if (paramInt <= 0) {
                    continue;
                  }
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().unReadNum = paramInt;
                }
                if (AppConstants.au.equals(frienduin))
                {
                  paramInt = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                  if (paramInt <= 0) {
                    continue;
                  }
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().unReadNum = paramInt;
                }
                paramBoolean = bool;
                if (AppConstants.av.equals(frienduin))
                {
                  paramInt = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                  if (paramInt <= 0) {
                    continue;
                  }
                  jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().unReadNum = paramInt;
                  paramBoolean = bool;
                }
              }
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab fin " + localMessage.getBaseInfoString() + " , result = " + paramBoolean);
              }
              bool = paramBoolean;
              if (!MsgProxyUtils.a(frienduin, istroop)) {
                break;
              }
              istroop = MsgProxyUtils.a(istroop);
              return paramBoolean;
            }
            catch (Throwable localThrowable)
            {
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab ERROR", localThrowable);
              continue;
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(null);
              continue;
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(null);
              continue;
              jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b(null);
              paramBoolean = bool;
              continue;
            }
            if ((paramInt == 4) || (paramInt == 2))
            {
              MessageRecord.copyMessageRecordBaseField(localMessage, paramMessageRecord);
              emoRecentMsg = null;
              fileType = -1;
              if (paramBoolean) {}
              try
              {
                a(localMessage);
                paramBoolean = true;
              }
              catch (Throwable paramMessageRecord)
              {
                for (;;)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab ERROR", paramMessageRecord);
                  }
                }
              }
            }
            else
            {
              if (paramInt == 3)
              {
                if (uniseq == uniseq) {
                  MessageRecord.copyMessageRecordStatusField(localMessage, paramMessageRecord);
                }
                for (;;)
                {
                  paramBoolean = true;
                  break;
                  MessageRecord.copyMessageRecordBaseField(localMessage, paramMessageRecord);
                  emoRecentMsg = null;
                  fileType = -1;
                  try
                  {
                    a(localMessage);
                  }
                  catch (Throwable paramMessageRecord) {}
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTab ERROR", paramMessageRecord);
                  }
                }
              }
              paramBoolean = false;
              continue;
              bool = false;
            }
          }
        }
      }
      return false;
    }
  }
  
  public void b()
  {
    synchronized (b)
    {
      b.notify();
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeRequest notify");
      }
      return;
    }
  }
  
  protected void b(QQMessageFacade.Message paramMessage) {}
  
  public void b(QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      boolean bool = h;
      if (bool) {}
      try
      {
        jdField_a_of_type_JavaLangObject.wait(40000L);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "refreshTroopUnreadMessage wait over");
        }
        return;
      }
      catch (InterruptedException paramRefreshMessageContext)
      {
        for (;;)
        {
          paramRefreshMessageContext.printStackTrace();
        }
      }
    }
  }
  
  public void b(MessageRecord paramMessageRecord)
  {
    Object localObject = frienduin;
    int j = istroop;
    paramMessageRecord = MsgProxyUtils.a((String)localObject, j);
    if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.containsKey(paramMessageRecord)) {
      if (j != 1026) {
        break label237;
      }
    }
    label237:
    for (int i = 1;; i = j)
    {
      RecentUser localRecentUser = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a((String)localObject, i);
      localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a((String)localObject, j);
      if (localObject != null)
      {
        a((MessageRecord)localObject, true, 4);
        if (localRecentUser != null)
        {
          if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004)) {
            troopUin = senderuin;
          }
          type = i;
          lastmsgtime = time;
          HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localRecentUser);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(localRecentUser);
        }
      }
      for (;;)
      {
        if (localRecentUser != null) {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localRecentUser);
        }
        return;
        if (localRecentUser != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageManager", 2, "updateMsgTabAfterDelMsg : No MessageRecord for replacing the mstTab, delete the ru.");
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(localRecentUser);
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a.remove(paramMessageRecord);
        }
      }
    }
  }
  
  public abstract void b(String paramString, int paramInt1, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext);
  
  public void b(String paramString, int paramInt, long paramLong) {}
  
  public void b(String paramString, int paramInt1, MessageRecord paramMessageRecord, int paramInt2)
  {
    long l;
    Object localObject;
    if ((paramInt1 != 3000) && (paramInt1 != 1))
    {
      l = a(paramString, paramInt1);
      if (l != 0L)
      {
        if (MsgProxyUtils.a(paramInt1) != 1009) {
          break label272;
        }
        localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.af, 1009);
        if ((senderuin != null) && (senderuin.equals(paramString)))
        {
          paramString = MessageRecordFactory.a(msgtype);
          MessageRecord.copyMessageRecordBaseField(paramString, paramMessageRecord);
          selfuin = selfuin;
          senderuin = frienduin;
          frienduin = AppConstants.af;
          if (paramInt2 != 3) {
            break label181;
          }
          a(paramString, true, paramInt2);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.af, 1009, l, extraflag, sendFailCode);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.af, 1009, l, time, shmsgseq);
        }
      }
    }
    label181:
    label272:
    label1068:
    do
    {
      do
      {
        MessageRecord localMessageRecord;
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              do
                              {
                                do
                                {
                                  do
                                  {
                                    return;
                                    if (paramInt2 == 2)
                                    {
                                      a(paramString, true, paramInt2);
                                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.af, 1009, l, msg);
                                      return;
                                    }
                                  } while (paramInt2 != 4);
                                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.af, 1009, senderuin, selfuin);
                                  a(paramString, null, false, true, paramInt2);
                                  a(paramString, true, paramInt2);
                                  return;
                                  if (MsgProxyUtils.a(paramInt1) != 1001) {
                                    break label1068;
                                  }
                                  localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
                                  bool2 = MsgProxyUtils.c(paramMessageRecord);
                                  bool1 = false;
                                  if (bool2) {
                                    bool1 = ((ConversationFacade)localObject).a(paramString, 1001, AppConstants.aq);
                                  }
                                  if ((!bool2) || (bool1)) {
                                    break;
                                  }
                                  localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aN, 1001);
                                } while ((senderuin == null) || (!senderuin.equals(paramString)));
                                paramString = MessageRecordFactory.a(msgtype);
                                MessageRecord.copyMessageRecordBaseField(paramString, paramMessageRecord);
                                frienduin = AppConstants.aN;
                                senderuin = frienduin;
                                istroop = istroop;
                                localMessageRecord = MessageRecordFactory.a(msgtype);
                                MessageRecord.copyMessageRecordBaseField(localMessageRecord, paramMessageRecord);
                                frienduin = AppConstants.aq;
                                senderuin = AppConstants.aN;
                                istroop = istroop;
                                localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aq, 1001);
                                if (paramInt2 != 3) {
                                  break;
                                }
                                a(paramString, true, paramInt2);
                                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aN, 1001, l, extraflag, sendFailCode);
                                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aN, 1001, l, time, shmsgseq);
                              } while ((senderuin == null) || (!senderuin.equals(AppConstants.aN)));
                              a(localMessageRecord, true, paramInt2);
                              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, l, extraflag, sendFailCode);
                              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, l, time, shmsgseq);
                              return;
                              if (paramInt2 != 2) {
                                break;
                              }
                              a(paramString, true, paramInt2);
                              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aN, 1001, l, msg);
                            } while ((senderuin == null) || (!senderuin.equals(AppConstants.aN)));
                            a(localMessageRecord, true, paramInt2);
                            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, l, msg);
                            return;
                          } while (paramInt2 != 4);
                          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aN, 1001, senderuin, selfuin);
                          a(paramString, null, false, true, 1);
                          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, senderuin, selfuin);
                          a(localMessageRecord, null, false, true, 1);
                          a(paramString, true, paramInt2);
                        } while ((senderuin == null) || (!senderuin.equals(AppConstants.aN)));
                        a(localMessageRecord, true, paramInt2);
                        return;
                        localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aq, 1001);
                      } while ((senderuin == null) || (!senderuin.equals(paramString)));
                      paramString = MessageRecordFactory.a(msgtype);
                      MessageRecord.copyMessageRecordBaseField(paramString, paramMessageRecord);
                      selfuin = selfuin;
                      senderuin = frienduin;
                      frienduin = AppConstants.aq;
                      if (paramInt2 == 3)
                      {
                        a(paramString, true, paramInt2);
                        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, l, extraflag, sendFailCode);
                        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, l, time, shmsgseq);
                        return;
                      }
                      if (paramInt2 == 2)
                      {
                        a(paramString, true, paramInt2);
                        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, l, msg);
                        return;
                      }
                    } while (paramInt2 != 4);
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aq, 1001, senderuin, selfuin);
                    a(paramString, null, false, true, paramInt2);
                    a(paramString, true, paramInt2);
                    return;
                  } while (MsgProxyUtils.a(paramInt1) != 1010);
                  localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
                  boolean bool2 = MsgProxyUtils.c(paramMessageRecord);
                  boolean bool1 = false;
                  if (bool2) {
                    bool1 = ((ConversationFacade)localObject).a(paramString, 1010, AppConstants.aG);
                  }
                  if ((!bool2) || (bool1)) {
                    break;
                  }
                  localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aO, 1010);
                } while ((senderuin == null) || (!senderuin.equals(paramString)));
                paramString = MessageRecordFactory.a(msgtype);
                MessageRecord.copyMessageRecordBaseField(paramString, paramMessageRecord);
                frienduin = AppConstants.aO;
                senderuin = frienduin;
                istroop = istroop;
                localMessageRecord = MessageRecordFactory.a(msgtype);
                MessageRecord.copyMessageRecordBaseField(localMessageRecord, paramMessageRecord);
                frienduin = AppConstants.aG;
                senderuin = AppConstants.aO;
                istroop = istroop;
                localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aG, 1010);
                if (paramInt2 != 3) {
                  break;
                }
                a(paramString, true, paramInt2);
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aO, 1010, l, extraflag, sendFailCode);
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aO, 1010, l, time, shmsgseq);
              } while ((senderuin == null) || (!senderuin.equals(AppConstants.aO)));
              a(localMessageRecord, true, paramInt2);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, l, extraflag, sendFailCode);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, l, time, shmsgseq);
              return;
              if (paramInt2 != 2) {
                break;
              }
              a(paramString, true, paramInt2);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aO, 1010, l, msg);
            } while ((senderuin == null) || (!senderuin.equals(AppConstants.aO)));
            a(localMessageRecord, true, paramInt2);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, l, msg);
            return;
          } while (paramInt2 != 4);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aO, 1010, senderuin, selfuin);
          a(paramString, null, false, true, 1);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, senderuin, selfuin);
          a(localMessageRecord, null, false, true, 1);
          a(paramString, true, paramInt2);
        } while ((senderuin == null) || (!senderuin.equals(AppConstants.aO)));
        a(localMessageRecord, true, paramInt2);
        return;
        localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(AppConstants.aG, 1010);
      } while ((senderuin == null) || (!senderuin.equals(paramString)));
      paramString = MessageRecordFactory.a(msgtype);
      MessageRecord.copyMessageRecordBaseField(paramString, paramMessageRecord);
      selfuin = selfuin;
      senderuin = frienduin;
      frienduin = AppConstants.aG;
      if (paramInt2 == 3)
      {
        a(paramString, true, paramInt2);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, l, extraflag, sendFailCode);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, l, time, shmsgseq);
        return;
      }
      if (paramInt2 == 2)
      {
        a(paramString, true, paramInt2);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, l, msg);
        return;
      }
    } while (paramInt2 != 4);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt1).a(AppConstants.aG, 1010, senderuin, selfuin);
    a(paramString, null, false, true, paramInt2);
    a(paramString, true, paramInt2);
  }
  
  public void b(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    long l = 0L;
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "setBoxReaded boxUin=" + paramString + ",boxType=" + paramInt + ",needDelMark=" + paramBoolean2);
    }
    if (paramString == null) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager", 2, "setBoxReaded return : boxUin=null");
      }
    }
    for (;;)
    {
      return;
      if (!MsgProxyUtils.a(paramString, paramInt))
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "setBoxReaded return : is not msgbox");
        }
      }
      else
      {
        Object localObject = null;
        int j = 0;
        if (paramString.equals(AppConstants.aq)) {
          localObject = AppConstants.aN;
        }
        ConversationFacade localConversationFacade;
        while (localObject != null) {
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((String)localObject, paramInt) > 0)
          {
            paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a((String)localObject, paramInt);
            localConversationFacade = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
            if (paramString != null) {
              l = a(paramString);
            }
            localConversationFacade.a((String)localObject, paramInt, l, paramBoolean1, paramBoolean2);
            a((String)localObject, paramInt);
            return;
            if (paramString.equals(AppConstants.aG)) {
              localObject = AppConstants.aO;
            }
          }
          else if (QLog.isColorLevel())
          {
            QLog.d("Q.msg.BaseMessageManager", 2, "setBoxReaded return : childbox unread = 0");
          }
        }
        int i;
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt) > 0)
        {
          localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString, paramInt);
          localConversationFacade = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          if (localObject != null) {
            l = a((MessageRecord)localObject);
          }
          localConversationFacade.a(paramString, paramInt, l, paramBoolean1, paramBoolean2);
          a(paramString, paramInt);
          i = 1;
        }
        while (i != 0)
        {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(paramString, paramInt));
          return;
          i = j;
          if (QLog.isColorLevel())
          {
            QLog.d("Q.msg.BaseMessageManager", 2, "setBoxReaded return : box unread = 0");
            i = j;
          }
        }
      }
    }
  }
  
  public void b(ArrayList paramArrayList)
  {
    RevokeMsgInfo localRevokeMsgInfo = (RevokeMsgInfo)paramArrayList.get(0);
    int i;
    int k;
    Object localObject1;
    Object localObject3;
    Object localObject2;
    String str;
    label118:
    boolean bool;
    if (jdField_c_of_type_Int > 1)
    {
      i = 1;
      k = jdField_a_of_type_Int;
      localObject1 = jdField_b_of_type_JavaLangString;
      localObject3 = jdField_a_of_type_JavaLangString;
      localObject2 = jdField_c_of_type_JavaLangString;
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "doHandleRevokedNotifyAndNotify fromUin = " + (String)localObject1 + ", istroop = " + k);
      }
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      if ((k != 1004) && (k != 1000)) {
        break label241;
      }
      bool = TextUtils.equals(str, (CharSequence)localObject1);
      if ((k != 3000) && (k != 1)) {
        break label248;
      }
      localObject1 = localObject3;
    }
    ArrayList localArrayList;
    Object localObject5;
    for (;;)
    {
      localArrayList = new ArrayList();
      localObject3 = paramArrayList.iterator();
      while (((Iterator)localObject3).hasNext())
      {
        localObject5 = (RevokeMsgInfo)((Iterator)localObject3).next();
        localObject5 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((String)localObject1, k, jdField_a_of_type_Long, jdField_b_of_type_Long);
        if ((localObject5 != null) && (!((List)localObject5).isEmpty())) {
          localArrayList.addAll((Collection)localObject5);
        }
      }
      i = 0;
      break;
      label241:
      localObject2 = localObject1;
      break label118;
      label248:
      if (bool) {
        localObject1 = localObject3;
      }
    }
    if (i != 0) {}
    try
    {
      Collections.sort(localArrayList, MsgProxyUtils.a);
      if ((localArrayList != null) && (localArrayList.size() == 1) && (get0msgtype == 63505)) {
        return;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageManager", 2, "sort long msg error", localException);
        }
      }
      int j = 1;
      if ((localArrayList == null) || (localArrayList.isEmpty()))
      {
        j = 0;
        if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a.c())
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramArrayList);
          return;
        }
      }
      localObject5 = (MessageForGrayTips)MessageRecordFactory.a(63505);
      Object localObject4;
      if (bool)
      {
        paramArrayList = "你";
        localObject4 = paramArrayList;
        if (paramArrayList.length() > 12) {
          localObject4 = paramArrayList.substring(0, 11) + "...";
        }
        paramArrayList = ((String)localObject4).concat(BaseApplicationImpl.a().getString(2131371843));
        if (j == 0) {
          break label865;
        }
        localObject1 = (MessageRecord)localArrayList.get(0);
        ((MessageForGrayTips)localObject5).init(selfuin, frienduin, senderuin, paramArrayList, time, 63505, istroop, msgseq);
        if (msgtype == 63530) {
          time = jdField_c_of_type_Long;
        }
        msgUid = msgUid;
        shmsgseq = shmsgseq;
        label547:
        isread = true;
        if (j == 0) {
          break label960;
        }
        paramArrayList = localArrayList.iterator();
      }
      for (;;)
      {
        if (!paramArrayList.hasNext()) {
          break label960;
        }
        localObject1 = (MessageRecord)paramArrayList.next();
        if ((i != 0) && (!isread) && (localObject1 != localArrayList.get(0))) {
          isread = true;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq, false);
        if (msgtype == 63531)
        {
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          localObject4 = ((FileManagerDataCenter)localObject2).a(uniseq, frienduin, istroop);
          if (localObject4 != null)
          {
            if (QLog.isColorLevel()) {
              QLog.i("Q.msg.BaseMessageManager", 2, "find fileEntity");
            }
            ((FileManagerDataCenter)localObject2).b((FileManagerEntity)localObject4);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(nSessionId);
            continue;
            if (k == 1)
            {
              paramArrayList = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).d((String)localObject1);
              localObject4 = new Bundle();
              ((Bundle)localObject4).putInt(ContactUtils.jdField_a_of_type_JavaLangString, ContactUtils.y);
              ((Bundle)localObject4).putLong(ContactUtils.jdField_b_of_type_JavaLangString, uniseq);
              localObject4 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject2, (String)localObject1, paramArrayList, true, (Bundle)localObject4);
              paramArrayList = (ArrayList)localObject4;
              if (!TextUtils.isEmpty((CharSequence)localObject4)) {
                break;
              }
              paramArrayList = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject2, (String)localObject1, 1, 0);
              break;
            }
            if (k == 3000)
            {
              paramArrayList = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject2, (String)localObject1, 2, 0);
              break;
            }
            paramArrayList = "对方";
            break;
            label865:
            ((MessageForGrayTips)localObject5).init(str, (String)localObject1, (String)localObject2, paramArrayList, jdField_c_of_type_Long, 63505, k, jdField_c_of_type_Long);
            msgUid = jdField_b_of_type_Long;
            shmsgseq = jdField_a_of_type_Long;
            break label547;
          }
          if (QLog.isColorLevel()) {
            QLog.i("Q.msg.BaseMessageManager", 2, "can't find fileEntity,uniseq[" + uniseq + "],");
          }
        }
      }
      label960:
      paramArrayList = new ArrayList();
      paramArrayList.add(localObject5);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramArrayList, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      if ((j != 0) && (!get0isread)) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.G();
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(localArrayList, bool);
    }
  }
  
  public void c(MessageRecord paramMessageRecord) {}
  
  public void d(MessageRecord paramMessageRecord)
  {
    MessageForGrayTips localMessageForGrayTips = (MessageForGrayTips)MessageRecordFactory.a(63505);
    localMessageForGrayTips.init(selfuin, frienduin, senderuin, "你撤回了一条消息", time, 63505, istroop, msgseq);
    msgUid = msgUid;
    shmsgseq = shmsgseq;
    isread = true;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop, uniseq, false);
    List localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(istroop).e(frienduin, istroop);
    if ((localList == null) || (localList.isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.BaseMessageManager", 2, "doRevokeFakeMsgToGrayTips error: AIO is empty");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(frienduin, istroop, UncommonMessageProcessor.g, UncommonMessageProcessor.n);
      return;
    }
    paramMessageRecord = new ArrayList();
    paramMessageRecord.add(localMessageForGrayTips);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMessageRecord, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
  }
}
