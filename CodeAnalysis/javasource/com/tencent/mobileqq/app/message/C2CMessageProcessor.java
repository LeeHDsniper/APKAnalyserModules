package com.tencent.mobileqq.app.message;

import OnlinePushPack.DelMsgInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.av.VideoConstants;
import com.tencent.bitapp.BitAppManager;
import com.tencent.bitapp.MessageForBitApp;
import com.tencent.biz.pubaccount.readinjoy.common.ReadInJoyUtils;
import com.tencent.biz.pubaccount.util.PAReportUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.app.DynamicMsgInfoManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatHandler;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.LifeOnlineAccountInfoManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.MessageRoamManager;
import com.tencent.mobileqq.app.NearbyFlowerManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.asyncdb.cache.RoamDateCache;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForGrayTips;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.SystemMsg;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.nearby.NearbyFlowerMessage;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.DecodeProtoPkgContext;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageProtoCodec;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.service.message.TempSessionInfo;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.streamtransfile.StreamDataManager;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.transfile.PttInfoCollector;
import com.tencent.mobileqq.transfile.StructLongMessageDownloadProcessor;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import com.tencent.mobileqq.util.EndianUtil;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MsgAutoMonitorUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import msf.msgcomm.msg_comm.AppShareInfo;
import msf.msgcomm.msg_comm.C2CTmpMsgHead;
import msf.msgcomm.msg_comm.ContentHead;
import msf.msgcomm.msg_comm.Msg;
import msf.msgcomm.msg_comm.MsgHead;
import msf.msgcomm.msg_comm.UinPairMsg;
import msf.msgsvc.msg_svc.PbC2CReadedReportReq;
import msf.msgsvc.msg_svc.PbC2CReadedReportReq.UinPairReadInfo;
import msf.msgsvc.msg_svc.PbGetOneDayRoamMsgResp;
import msf.msgsvc.msg_svc.PbGetRoamMsgResp;
import msf.msgsvc.msg_svc.PbMsgReadedReportReq;
import msf.onlinepush.msg_onlinepush.PbPushMsg;
import njm;
import njn;
import njp;
import tencent.im.msg.im_msg_body.Elem;
import tencent.im.msg.im_msg_body.ElemFlags2;
import tencent.im.msg.im_msg_body.MsgBody;
import tencent.im.msg.im_msg_body.PubAccInfo;
import tencent.im.msg.im_msg_body.RichText;

public class C2CMessageProcessor
  extends BaseMessageProcessor
{
  public static final String c = "Q.msg.C2CMessageProcessor";
  private static final int q = 33;
  HashSet jdField_a_of_type_JavaUtilHashSet;
  private Set jdField_a_of_type_JavaUtilSet;
  private boolean jdField_a_of_type_Boolean;
  HashSet jdField_b_of_type_JavaUtilHashSet;
  private Set jdField_b_of_type_JavaUtilSet;
  public int e;
  public int f;
  public int g;
  public int h;
  public int i;
  public int j;
  public int k;
  public int l;
  public int m;
  public int n;
  public int o;
  public int p;
  
  public C2CMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilSet = new HashSet();
    jdField_b_of_type_JavaUtilSet = new HashSet();
    e = 1;
    f = 3;
    g = 10;
    h = 30;
    i = 0;
    j = 0;
    k = 1;
    l = 5;
    m = 10;
    n = 50;
    o = 0;
    p = 0;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_JavaUtilHashSet = null;
    jdField_b_of_type_JavaUtilHashSet = null;
  }
  
  private Pair a(String paramString, msg_comm.UinPairMsg paramUinPairMsg, long paramLong, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    ArrayList localArrayList1 = new ArrayList();
    new ArrayList();
    long l7 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin();
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    Object localObject1 = msg.get();
    if ((localObject1 == null) || (((List)localObject1).size() <= 0)) {
      return new Pair(paramString, Integer.valueOf(0));
    }
    ArrayList localArrayList2 = new ArrayList();
    a((List)localObject1, localArrayList2);
    StringBuilder localStringBuilder = new StringBuilder();
    HashMap localHashMap = new HashMap();
    HashSet localHashSet = new HashSet();
    DecodeProtoPkgContext localDecodeProtoPkgContext = new DecodeProtoPkgContext(l7, Long.parseLong(paramString), true, paramBoolean2, paramBoolean3, false);
    jdField_e_of_type_Boolean = true;
    localDecodeProtoPkgContext.a(1000, localHashMap);
    localDecodeProtoPkgContext.a(1001, localHashSet);
    long l1 = -1L;
    int i1 = 0;
    localObject1 = paramString;
    long l2 = -1L;
    int i3 = 0;
    if (i3 < localArrayList2.size()) {}
    try
    {
      localObject2 = (msg_comm.Msg)localArrayList2.get(i3);
      localObject3 = (msg_comm.MsgHead)msg_head.get();
      localObject4 = (im_msg_body.MsgBody)msg_body.get();
      if (!msg_head.has())
      {
        if (!QLog.isColorLevel()) {
          break label2345;
        }
        QLog.d("Q.msg.C2CMessageProcessor", 2, "<---decodeC2CMessagePackage: msgList[" + i3 + "] : msg doesn't has msgHead.");
        break label2345;
      }
      l3 = to_uin.get();
      l8 = from_uin.get();
      l4 = from_uin.get();
      l5 = msg_time.get();
      if (l5 <= paramLong) {
        break label2336;
      }
      paramBoolean3 = false;
      bool = false;
    }
    catch (Exception localException2)
    {
      for (;;)
      {
        Object localObject2;
        Object localObject3;
        Object localObject4;
        long l8;
        long l4;
        long l5;
        long l9;
        int i2;
        continue;
        continue;
        paramBoolean3 = true;
        boolean bool = true;
      }
      l3 = l2;
      l2 = l1;
      l1 = l3;
    }
    l9 = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l4, l3, peer_uin.get());
    localObject1 = String.valueOf(l9);
    long l3 = l2;
    l4 = l1;
    i2 = i1;
    for (;;)
    {
      int i4;
      try
      {
        l6 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(l9), 0);
        if ((l5 <= l6) && (bool))
        {
          l3 = l2;
          l4 = l1;
          i2 = i1;
          if (!QLog.isColorLevel()) {
            break label2378;
          }
          l3 = l2;
          l4 = l1;
          i2 = i1;
          localStringBuilder.setLength(0);
          l3 = l2;
          l4 = l1;
          i2 = i1;
          localStringBuilder.append("<---decodeC2CMessagePackage : msgList[").append(i3).append("] : filter msg by del time delTime =").append(l6).append(", msgTime = ").append(l5);
          l3 = l2;
          l4 = l1;
          i2 = i1;
          QLog.d("Q.msg.C2CMessageProcessor", 2, localStringBuilder.toString());
          break label2378;
        }
        l3 = l2;
        l4 = l1;
        i2 = i1;
        jdField_a_of_type_Boolean = bool;
        l3 = l2;
        l4 = l1;
        i2 = i1;
        jdField_e_of_type_Long = l9;
        l3 = l2;
        l4 = l1;
        i2 = i1;
        h = paramBoolean3;
        l3 = l2;
        l4 = l1;
        i2 = i1;
        localObject2 = a((msg_comm.Msg)localObject2, localDecodeProtoPkgContext);
        if (localObject2 == null) {
          break label2333;
        }
        l3 = l2;
        l4 = l1;
        i2 = i1;
        if (((ArrayList)localObject2).size() <= 0) {
          break label2333;
        }
        l3 = l2;
        l4 = l1;
        i2 = i1;
        if (get0istroop != 1008) {
          break label2333;
        }
        l3 = l2;
        l4 = l1;
        i2 = i1;
        localObject2 = ((LifeOnlineAccountInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(86)).a((ArrayList)localObject2);
        l3 = l2;
        l4 = l1;
        i2 = i1;
        localObject2 = ((ArrayList)localObject2).iterator();
        l3 = l2;
        l4 = l1;
        i2 = i1;
        if (!((Iterator)localObject2).hasNext()) {
          break;
        }
        l3 = l2;
        l4 = l1;
        i2 = i1;
        localObject3 = (MessageRecord)((Iterator)localObject2).next();
        l3 = l2;
        l4 = l1;
        i2 = i1;
        l5 = vipBubbleID;
        if (l5 == -1L) {
          break label1589;
        }
        l3 = l2;
        l4 = l1;
        i2 = i1;
        if (!MsgUtils.a(issend)) {
          break label1578;
        }
        l6 = l1;
        l3 = l5;
        l4 = l6;
        i2 = i1;
        i4 = istroop;
        l3 = l5;
        l4 = l6;
        i2 = i4;
        paramBoolean3 = a((MessageRecord)localObject3, true);
        l3 = l5;
        l4 = l6;
        i2 = i4;
        bool = b((MessageRecord)localObject3);
        if ((!paramBoolean3) && (!bool))
        {
          l3 = l5;
          l4 = l6;
          i2 = i4;
          if (istroop == 1008)
          {
            l3 = l5;
            l4 = l6;
            i2 = i4;
            if ((localObject3 instanceof MessageForStructing))
            {
              l3 = l5;
              l4 = l6;
              i2 = i4;
              if (StructLongMessageDownloadProcessor.b((MessageRecord)localObject3))
              {
                l3 = l5;
                l4 = l6;
                i2 = i4;
                localObject4 = ((MessageRecord)localObject3).getExtInfoFromExtStr("longMsg_State");
                if (localObject4 == null) {
                  break label1838;
                }
                l3 = l5;
                l4 = l6;
                i2 = i4;
                if (!"3".equals(localObject4)) {
                  break label1838;
                }
              }
            }
          }
          l3 = l5;
          l4 = l6;
          i2 = i4;
          localArrayList1.add(localObject3);
        }
        l3 = l5;
        l4 = l6;
        i2 = i4;
        if (msgtype == 63534)
        {
          if (!paramBoolean3)
          {
            l3 = l5;
            l4 = l6;
            i2 = i4;
            if (StreamDataManager.a(msgUid, shmsgseq) != null)
            {
              l3 = l5;
              l4 = l6;
              i2 = i4;
              PttInfoCollector.a(true);
            }
          }
          if (paramBoolean3)
          {
            l3 = l5;
            l4 = l6;
            i2 = i4;
            if ((localObject3 instanceof MessageForPtt))
            {
              l3 = l5;
              l4 = l6;
              i2 = i4;
              if (MsgProxyUtils.c(istroop))
              {
                l3 = l5;
                l4 = l6;
                i2 = i4;
                localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin, istroop).iterator();
                l3 = l5;
                l4 = l6;
                i2 = i4;
                if (((Iterator)localObject4).hasNext())
                {
                  l3 = l5;
                  l4 = l6;
                  i2 = i4;
                  localObject5 = (MessageRecord)((Iterator)localObject4).next();
                  l3 = l5;
                  l4 = l6;
                  i2 = i4;
                  if (!(localObject5 instanceof MessageForPtt)) {
                    continue;
                  }
                  l3 = l5;
                  l4 = l6;
                  i2 = i4;
                  if (msgUid != msgUid) {
                    continue;
                  }
                  l3 = l5;
                  l4 = l6;
                  i2 = i4;
                  if (shmsgseq != shmsgseq) {
                    continue;
                  }
                  l3 = l5;
                  l4 = l6;
                  i2 = i4;
                  a((MessageForPtt)localObject5, (MessageForPtt)localObject3);
                }
              }
            }
          }
        }
        l2 = l5;
        l1 = l6;
        i1 = i4;
        if (paramBoolean3) {
          continue;
        }
        l2 = l5;
        l1 = l6;
        i1 = i4;
        l3 = l5;
        l4 = l6;
        i2 = i4;
        if (istroop != 1008) {
          continue;
        }
        l2 = l5;
        l1 = l6;
        i1 = i4;
        l3 = l5;
        l4 = l6;
        i2 = i4;
        if (!"1".equals(((MessageRecord)localObject3).getExtInfoFromExtStr("is_AdArrive_Msg"))) {
          continue;
        }
        l3 = l5;
        l4 = l6;
        i2 = i4;
        localObject4 = ((MessageRecord)localObject3).getExtInfoFromExtStr("gdt_msgImp");
        l3 = l5;
        l4 = l6;
        i2 = i4;
        Object localObject5 = ((MessageRecord)localObject3).getExtInfoFromExtStr("pa_msgId");
        l3 = l5;
        l4 = l6;
        i2 = i4;
        ArrayList localArrayList3 = new ArrayList();
        l3 = l5;
        l4 = l6;
        i2 = i4;
        localArrayList3.add(localObject5);
        l3 = l5;
        l4 = l6;
        i2 = i4;
        PAReportUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "", "", senderuin, (String)localObject4, localArrayList3);
        l2 = l5;
        l1 = l6;
        i1 = i4;
        continue;
        if (!QLog.isColorLevel()) {
          break label1563;
        }
      }
      catch (Exception localException1)
      {
        i1 = i2;
        l1 = l4;
        l2 = l3;
      }
      QLog.w("Q.msg.C2CMessageProcessor", 2, "decodeC2CMessage error,", localException1);
      label1563:
      l3 = l1;
      l1 = l2;
      l2 = l3;
      break label2357;
      label1578:
      long l6 = l5;
      l5 = l2;
      continue;
      label1589:
      l3 = l2;
      l4 = l1;
      i2 = i1;
      if (msgtype == 63534)
      {
        l3 = l2;
        l4 = l1;
        i2 = i1;
        if (MsgUtils.a(issend))
        {
          if (l2 != -1L)
          {
            l3 = l2;
            l4 = l1;
            i2 = i1;
            vipBubbleID = l2;
            l5 = l2;
            l6 = l1;
          }
          else
          {
            l3 = l2;
            l4 = l1;
            i2 = i1;
            vipBubbleID = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(l9), String.valueOf(l8));
            l5 = l2;
            l6 = l1;
          }
        }
        else if (l1 != -1L)
        {
          l3 = l2;
          l4 = l1;
          i2 = i1;
          vipBubbleID = l1;
          l5 = l2;
          l6 = l1;
        }
        else
        {
          l3 = l2;
          l4 = l1;
          i2 = i1;
          vipBubbleID = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(l9), String.valueOf(l8));
          l5 = l2;
          l6 = l1;
        }
      }
      else
      {
        l3 = l2;
        l4 = l1;
        i2 = i1;
        vipBubbleID = 0L;
        l5 = l2;
        l6 = l1;
        continue;
        label1838:
        l3 = l5;
        l4 = l6;
        i2 = i4;
        ((MessageRecord)localObject3).saveExtInfoToExtStr("longMsg_State", "1");
        l3 = l5;
        l4 = l6;
        i2 = i4;
        StructLongMessageDownloadProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageForStructing)localObject3);
      }
    }
    l3 = l1;
    l1 = l2;
    l2 = l3;
    break label2357;
    if (localObject1 != null)
    {
      paramUinPairMsg = (msg_comm.UinPairMsg)localObject1;
      if (!((String)localObject1).equals("0")) {}
    }
    else
    {
      paramUinPairMsg = paramString;
    }
    if (!localHashMap.isEmpty())
    {
      paramString = localHashSet.iterator();
      while (paramString.hasNext())
      {
        localObject1 = (Long)paramString.next();
        localHashMap.remove(localObject1);
        if (QLog.isColorLevel()) {
          QLog.d("svenxu", 2, "Discard video request because canceled: fromUin = " + localObject1);
        }
      }
      paramString = localHashMap.keySet().iterator();
      while (paramString.hasNext())
      {
        localObject1 = (msg_comm.Msg)localHashMap.get((Long)paramString.next());
        if ((msg_body.has()) && (msg_body.get()).msg_content.has())) {
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l7, msg_body.get()).msg_content.get().toByteArray(), msg_head.get()).from_uin.get(), msg_head.get()).msg_time.get());
        }
      }
    }
    if (localArrayList1.size() > 0)
    {
      if (!paramBoolean2) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(localArrayList1);
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(paramUinPairMsg), 0, localArrayList1, paramBoolean1);
      paramBoolean3 = a(localArrayList1);
      i2 = MsgProxyUtils.a(localArrayList1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      if ((!paramBoolean3) || (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop)) {
        break label2322;
      }
    }
    label2322:
    for (paramBoolean1 = true;; paramBoolean1 = false)
    {
      paramString.a(localArrayList1, str, paramBoolean1);
      a(localArrayList1);
      a(localArrayList1);
      a("handleGetBuddyMessageResp", true, i2, paramBoolean3, paramBoolean2);
      a(localArrayList1, paramBoolean2);
      if (i1 == 1008)
      {
        paramString = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
        if (paramString != null) {
          paramString.a(localArrayList1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        }
      }
      return new Pair(paramUinPairMsg, Integer.valueOf(i1));
    }
    for (;;)
    {
      label2333:
      label2336:
      label2345:
      label2357:
      i3 += 1;
      l3 = l2;
      l2 = l1;
      l1 = l3;
      break;
      label2378:
      l3 = l1;
      l1 = l2;
      l2 = l3;
    }
  }
  
  private Pair a(List paramList1, List paramList2, long paramLong1, long paramLong2, long paramLong3)
  {
    ArrayList localArrayList = new ArrayList();
    List localList = ((MessageRoamManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(91)).a(String.valueOf(paramLong1), paramLong2 - 30L, 30L + paramLong3);
    if ((localList != null) && (!localList.isEmpty()))
    {
      paramList1 = paramList1.iterator();
      Object localObject;
      int i1;
      while (paramList1.hasNext())
      {
        localObject = (msg_comm.Msg)paramList1.next();
        if (!msg_head.has())
        {
          paramList1.remove();
        }
        else
        {
          localObject = (msg_comm.MsgHead)msg_head.get();
          paramLong1 = msg_uid.get();
          paramLong2 = (short)msg_seq.get();
          paramLong3 = from_uin.get();
          i1 = 0;
          while (i1 < localList.size())
          {
            localObject = (MessageRecord)localList.get(i1);
            if ((msgUid == paramLong1) && (shmsgseq == paramLong2) && (senderuin.equals(String.valueOf(paramLong3))))
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.C2CMessageProcessor", 2, "filterRoamMsgFromDB duplicated " + localObject);
              }
              localArrayList.add(localObject);
              paramList1.remove();
            }
            i1 += 1;
          }
        }
      }
      paramList1 = paramList2.iterator();
      while (paramList1.hasNext())
      {
        localObject = (MessageRecord)paramList1.next();
        i1 = 0;
        while (i1 < localList.size())
        {
          MessageRecord localMessageRecord = (MessageRecord)localList.get(i1);
          if ((msgUid == msgUid) && (shmsgseq == shmsgseq) && (senderuin.equals(senderuin)))
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.C2CMessageProcessor", 2, "filterRoamMsgFromDB duplicated " + localObject);
            }
            paramList1.remove();
          }
          i1 += 1;
        }
      }
    }
    return new Pair(localArrayList, paramList2);
  }
  
  private void a(QQAppInterface paramQQAppInterface, int paramInt, String paramString1, String paramString2, long paramLong1, long paramLong2, long paramLong3, msg_comm.MsgHead paramMsgHead)
  {
    Object localObject2 = paramQQAppInterface.a();
    Long localLong = Long.valueOf(Long.parseLong((String)localObject2));
    Object localObject1 = String.valueOf(paramLong1);
    String str = "" + auth_uin.get();
    paramMsgHead = auth_nick.get();
    if ((!TextUtils.isEmpty(str)) && (!TextUtils.isEmpty(paramMsgHead)) && (str.equals(paramString1))) {}
    for (;;)
    {
      if ((localObject2 != null) && (((String)localObject2).equals(paramString1))) {
        return;
      }
      if (TextUtils.isEmpty(paramMsgHead)) {
        paramMsgHead = MessageHandlerUtils.a(paramQQAppInterface, paramString1, (String)localObject1);
      }
      for (;;)
      {
        boolean bool;
        if ((paramInt == -126) || (paramInt == 2))
        {
          paramString2 = paramMsgHead + " 已加入该群";
          localObject1 = (MessageForGrayTips)MessageRecordFactory.a(64524);
          ((MessageForGrayTips)localObject1).init(localLong.longValue(), paramLong1, paramLong1, paramString2, paramLong2, 64524, 1, paramLong3);
          ((MessageForGrayTips)localObject1).switch2HightlightMsg();
          localObject2 = new Bundle();
          ((Bundle)localObject2).putInt("key_action", 5);
          ((Bundle)localObject2).putString("troop_mem_uin", paramString1);
          ((Bundle)localObject2).putBoolean("need_update_nick", false);
          ((MessageForGrayTips)localObject1).addHightlightItem(0, paramMsgHead.length(), (Bundle)localObject2);
          isread = true;
          paramString1 = (TroopTipsMsgMgr)paramQQAppInterface.getManager(80);
          if ((a((MessageRecord)localObject1, false)) || (paramString1.a(paramLong1 + "", paramLong3))) {}
          for (bool = true;; bool = false)
          {
            if (!bool) {
              paramQQAppInterface.a().a((MessageRecord)localObject1, String.valueOf(localLong));
            }
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.d("Q.msg.C2CMessageProcessor", 2, "seq:" + paramLong3 + "|cOpt:" + paramInt + "|tips:" + paramString2 + "|msgFilter:" + bool);
            return;
          }
        }
        if ((paramInt != -125) && (paramInt != 3)) {
          break;
        }
        localObject1 = MessageHandlerUtils.a(paramQQAppInterface, paramString2, (String)localObject1);
        int i1;
        if ((localObject2 != null) && (((String)localObject2).equals(paramString2)))
        {
          i1 = 1;
          localObject1 = "你";
        }
        for (;;)
        {
          label461:
          MessageForGrayTips localMessageForGrayTips;
          if (i1 != 0)
          {
            localObject2 = (String)localObject1 + "邀请 ";
            str = (String)localObject2 + paramMsgHead + " 加入了本群";
            localMessageForGrayTips = (MessageForGrayTips)MessageRecordFactory.a(64524);
            localMessageForGrayTips.init(localLong.longValue(), paramLong1, paramLong1, str, paramLong2, 64524, 1, paramLong3);
            localMessageForGrayTips.switch2HightlightMsg();
            if (i1 == 0)
            {
              Bundle localBundle = new Bundle();
              localBundle.putInt("key_action", 5);
              localBundle.putString("troop_mem_uin", paramString2);
              localBundle.putBoolean("need_update_nick", false);
              localMessageForGrayTips.addHightlightItem(0, ((String)localObject1).length(), localBundle);
            }
            paramString2 = new Bundle();
            paramString2.putInt("key_action", 5);
            paramString2.putString("troop_mem_uin", paramString1);
            paramString2.putBoolean("need_update_nick", false);
            localMessageForGrayTips.addHightlightItem(((String)localObject2).length(), ((String)localObject2).length() + paramMsgHead.length(), paramString2);
            isread = true;
            paramString1 = (TroopTipsMsgMgr)paramQQAppInterface.getManager(80);
            if ((!a(localMessageForGrayTips, false)) && (!paramString1.a(paramLong1 + "", paramLong3))) {
              break label810;
            }
          }
          label810:
          for (bool = true;; bool = false)
          {
            if (!bool) {
              paramQQAppInterface.a().a(localMessageForGrayTips, String.valueOf(localLong));
            }
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.d("Q.msg.C2CMessageProcessor", 2, "seq:" + paramLong3 + "|cOpt:" + paramInt + "|tips:" + str + "|msgFilter:" + bool);
            return;
            localObject2 = (String)localObject1 + " 邀请 ";
            break label461;
          }
          i1 = 0;
        }
      }
      paramMsgHead = "";
    }
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    paramFromServiceMsg = new Bundle();
    paramFromServiceMsg.putLong("BEGTIME", extraData.getLong("lBeginTime"));
    paramFromServiceMsg.putBoolean("FETCH_MORE", extraData.getBoolean("fetchMore"));
    a(1004, false, paramFromServiceMsg);
  }
  
  /* Error */
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    // Byte code:
    //   0: aload_1
    //   1: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   4: ldc_w 645
    //   7: iconst_1
    //   8: invokevirtual 648	android/os/Bundle:getBoolean	(Ljava/lang/String;Z)Z
    //   11: istore 9
    //   13: aload_1
    //   14: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   17: ldc_w 650
    //   20: iconst_1
    //   21: invokevirtual 648	android/os/Bundle:getBoolean	(Ljava/lang/String;Z)Z
    //   24: istore 11
    //   26: aload_1
    //   27: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   30: ldc_w 652
    //   33: iconst_0
    //   34: invokevirtual 648	android/os/Bundle:getBoolean	(Ljava/lang/String;Z)Z
    //   37: istore 10
    //   39: aload_2
    //   40: invokevirtual 657	com/tencent/qphone/base/remote/FromServiceMsg:getUin	()Ljava/lang/String;
    //   43: ifnonnull +237 -> 280
    //   46: aload_0
    //   47: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   50: invokevirtual 660	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   53: invokestatic 663	java/lang/Long:valueOf	(Ljava/lang/String;)Ljava/lang/Long;
    //   56: astore 22
    //   58: aload 22
    //   60: invokevirtual 546	java/lang/Long:longValue	()J
    //   63: pop2
    //   64: new 665	msf/msgsvc/msg_svc$PbGetMsgResp
    //   67: dup
    //   68: invokespecial 666	msf/msgsvc/msg_svc$PbGetMsgResp:<init>	()V
    //   71: astore 22
    //   73: aload 22
    //   75: aload_3
    //   76: checkcast 668	[B
    //   79: checkcast 668	[B
    //   82: invokevirtual 672	msf/msgsvc/msg_svc$PbGetMsgResp:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   85: checkcast 665	msf/msgsvc/msg_svc$PbGetMsgResp
    //   88: astore 22
    //   90: aload 22
    //   92: ifnonnull +35 -> 127
    //   95: invokestatic 678	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   98: invokestatic 683	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   101: aload_0
    //   102: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   105: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   108: ldc_w 685
    //   111: iconst_0
    //   112: lconst_0
    //   113: lconst_0
    //   114: new 132	java/util/HashMap
    //   117: dup
    //   118: invokespecial 133	java/util/HashMap:<init>	()V
    //   121: ldc_w 377
    //   124: invokevirtual 688	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;)V
    //   127: new 129	java/lang/StringBuilder
    //   130: dup
    //   131: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   134: astore 24
    //   136: aload 22
    //   138: ifnull +25 -> 163
    //   141: aload 22
    //   143: getfield 691	msf/msgsvc/msg_svc$PbGetMsgResp:result	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   146: invokevirtual 692	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   149: ifeq +14 -> 163
    //   152: aload 22
    //   154: getfield 691	msf/msgsvc/msg_svc$PbGetMsgResp:result	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   157: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   160: ifeq +187 -> 347
    //   163: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   166: ifeq +104 -> 270
    //   169: aload 24
    //   171: iconst_0
    //   172: invokevirtual 244	java/lang/StringBuilder:setLength	(I)V
    //   175: aload 24
    //   177: ldc_w 694
    //   180: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: aload_1
    //   184: invokevirtual 697	com/tencent/qphone/base/remote/ToServiceMsg:getRequestSsoSeq	()I
    //   187: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   190: ldc_w 699
    //   193: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: astore 23
    //   198: aload 22
    //   200: ifnonnull +117 -> 317
    //   203: ldc_w 701
    //   206: astore_3
    //   207: aload 23
    //   209: aload_3
    //   210: invokevirtual 418	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   213: ldc_w 703
    //   216: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   219: astore 23
    //   221: aload 22
    //   223: ifnonnull +109 -> 332
    //   226: ldc_w 701
    //   229: astore_3
    //   230: aload 23
    //   232: aload_3
    //   233: invokevirtual 418	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   236: ldc_w 705
    //   239: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: iload 9
    //   244: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   247: ldc_w 707
    //   250: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   253: iload 11
    //   255: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   258: pop
    //   259: ldc 8
    //   261: iconst_2
    //   262: aload 24
    //   264: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   267: invokestatic 709	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   270: aload_0
    //   271: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   274: aload_1
    //   275: aload_2
    //   276: invokevirtual 711	com/tencent/mobileqq/app/MessageHandler:a	(Lcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;)V
    //   279: return
    //   280: aload_2
    //   281: invokevirtual 657	com/tencent/qphone/base/remote/FromServiceMsg:getUin	()Ljava/lang/String;
    //   284: invokestatic 663	java/lang/Long:valueOf	(Ljava/lang/String;)Ljava/lang/Long;
    //   287: astore 22
    //   289: goto -231 -> 58
    //   292: astore 22
    //   294: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   297: ifeq +14 -> 311
    //   300: ldc 8
    //   302: iconst_2
    //   303: ldc_w 713
    //   306: aload 22
    //   308: invokestatic 715	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   311: aconst_null
    //   312: astore 22
    //   314: goto -224 -> 90
    //   317: aload 22
    //   319: getfield 691	msf/msgsvc/msg_svc$PbGetMsgResp:result	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   322: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   325: invokestatic 121	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   328: astore_3
    //   329: goto -122 -> 207
    //   332: aload 22
    //   334: getfield 718	msf/msgsvc/msg_svc$PbGetMsgResp:sync_cookie	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   337: invokevirtual 435	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   340: invokestatic 723	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   343: astore_3
    //   344: goto -114 -> 230
    //   347: aconst_null
    //   348: astore_2
    //   349: aload 22
    //   351: getfield 718	msf/msgsvc/msg_svc$PbGetMsgResp:sync_cookie	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   354: invokevirtual 435	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   357: ifeq +15 -> 372
    //   360: aload 22
    //   362: getfield 718	msf/msgsvc/msg_svc$PbGetMsgResp:sync_cookie	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   365: invokevirtual 441	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   368: invokevirtual 447	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   371: astore_2
    //   372: aload 22
    //   374: getfield 726	msf/msgsvc/msg_svc$PbGetMsgResp:uin_pair_msgs	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   377: invokevirtual 107	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   380: astore 25
    //   382: aload_0
    //   383: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   386: iconst_0
    //   387: putfield 729	com/tencent/mobileqq/app/MessageHandler:ci	I
    //   390: aload 22
    //   392: getfield 733	msf/msgsvc/msg_svc$PbGetMsgResp:sync_flag	Lcom/tencent/mobileqq/pb/PBEnumField;
    //   395: invokevirtual 736	com/tencent/mobileqq/pb/PBEnumField:has	()Z
    //   398: ifeq +1710 -> 2108
    //   401: aload 22
    //   403: getfield 733	msf/msgsvc/msg_svc$PbGetMsgResp:sync_flag	Lcom/tencent/mobileqq/pb/PBEnumField;
    //   406: invokevirtual 737	com/tencent/mobileqq/pb/PBEnumField:get	()I
    //   409: istore 6
    //   411: iload 6
    //   413: iconst_2
    //   414: if_icmpge +1688 -> 2102
    //   417: iconst_1
    //   418: i2b
    //   419: istore 4
    //   421: aconst_null
    //   422: astore 23
    //   424: aload 22
    //   426: getfield 740	msf/msgsvc/msg_svc$PbGetMsgResp:pubaccount_cookie	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   429: invokevirtual 435	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   432: ifeq +16 -> 448
    //   435: aload 22
    //   437: getfield 740	msf/msgsvc/msg_svc$PbGetMsgResp:pubaccount_cookie	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   440: invokevirtual 441	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   443: invokevirtual 447	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   446: astore 23
    //   448: iconst_0
    //   449: istore 5
    //   451: aload 22
    //   453: getfield 743	msf/msgsvc/msg_svc$PbGetMsgResp:msg_rsp_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   456: invokevirtual 692	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   459: ifeq +13 -> 472
    //   462: aload 22
    //   464: getfield 743	msf/msgsvc/msg_svc$PbGetMsgResp:msg_rsp_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   467: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   470: istore 5
    //   472: iload 5
    //   474: tableswitch	default:+26->500, 0:+891->1365, 1:+932->1406, 2:+954->1428
    //   500: iconst_0
    //   501: istore 8
    //   503: aload_0
    //   504: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   507: invokevirtual 745	com/tencent/mobileqq/app/MessageHandler:a	()Z
    //   510: ifeq +6 -> 516
    //   513: iconst_1
    //   514: istore 8
    //   516: iload 4
    //   518: ifle +24 -> 542
    //   521: aload_0
    //   522: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   525: iload 4
    //   527: aload_2
    //   528: iload 6
    //   530: iload 9
    //   532: iload 11
    //   534: iload 8
    //   536: aconst_null
    //   537: iload 5
    //   539: invokevirtual 748	com/tencent/mobileqq/app/MessageHandler:a	(B[BIZZZLjava/lang/String;I)V
    //   542: invokestatic 753	java/lang/System:currentTimeMillis	()J
    //   545: pop2
    //   546: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   549: ifeq +154 -> 703
    //   552: aload 24
    //   554: iconst_0
    //   555: invokevirtual 244	java/lang/StringBuilder:setLength	(I)V
    //   558: aload 24
    //   560: ldc_w 694
    //   563: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   566: aload_1
    //   567: invokevirtual 697	com/tencent/qphone/base/remote/ToServiceMsg:getRequestSsoSeq	()I
    //   570: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   573: ldc_w 699
    //   576: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   579: aload 22
    //   581: getfield 691	msf/msgsvc/msg_svc$PbGetMsgResp:result	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   584: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   587: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   590: ldc_w 755
    //   593: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   596: aload 22
    //   598: getfield 718	msf/msgsvc/msg_svc$PbGetMsgResp:sync_cookie	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   601: invokevirtual 435	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   604: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   607: ldc_w 757
    //   610: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   613: iload 4
    //   615: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   618: ldc_w 759
    //   621: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   624: iload 6
    //   626: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   629: ldc_w 761
    //   632: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   635: iload 9
    //   637: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   640: ldc_w 707
    //   643: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   646: iload 11
    //   648: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   651: ldc_w 763
    //   654: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   657: aload 25
    //   659: invokeinterface 113 1 0
    //   664: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   667: ldc_w 765
    //   670: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   673: aload_3
    //   674: invokevirtual 770	java/lang/Object:hashCode	()I
    //   677: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   680: ldc_w 772
    //   683: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   686: iload 5
    //   688: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   691: pop
    //   692: ldc 8
    //   694: iconst_2
    //   695: aload 24
    //   697: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   700: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   703: iconst_0
    //   704: istore 6
    //   706: lconst_0
    //   707: lstore 12
    //   709: iload 6
    //   711: aload 25
    //   713: invokeinterface 113 1 0
    //   718: if_icmpge +837 -> 1555
    //   721: invokestatic 753	java/lang/System:currentTimeMillis	()J
    //   724: lstore 16
    //   726: aload 25
    //   728: iload 6
    //   730: invokeinterface 509 2 0
    //   735: checkcast 97	msf/msgcomm/msg_comm$UinPairMsg
    //   738: astore 22
    //   740: aload 22
    //   742: getfield 222	msf/msgcomm/msg_comm$UinPairMsg:peer_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   745: invokevirtual 208	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   748: invokestatic 232	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   751: astore_2
    //   752: aload 22
    //   754: getfield 775	msf/msgcomm/msg_comm$UinPairMsg:last_read_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   757: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   760: i2l
    //   761: ldc2_w 776
    //   764: land
    //   765: lstore 14
    //   767: aload 22
    //   769: getfield 101	msf/msgcomm/msg_comm$UinPairMsg:msg	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   772: invokevirtual 107	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   775: astore_3
    //   776: aload 22
    //   778: getfield 780	msf/msgcomm/msg_comm$UinPairMsg:msg_completed	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   781: invokevirtual 692	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   784: ifeq +667 -> 1451
    //   787: aload 22
    //   789: getfield 780	msf/msgcomm/msg_comm$UinPairMsg:msg_completed	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   792: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   795: ifeq +656 -> 1451
    //   798: iconst_1
    //   799: istore 8
    //   801: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   804: ifeq +77 -> 881
    //   807: aload 24
    //   809: iconst_0
    //   810: invokevirtual 244	java/lang/StringBuilder:setLength	(I)V
    //   813: aload 24
    //   815: ldc_w 782
    //   818: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   821: aload_2
    //   822: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   825: ldc_w 784
    //   828: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   831: iload 8
    //   833: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   836: ldc_w 786
    //   839: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   842: lload 14
    //   844: invokevirtual 251	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   847: ldc_w 788
    //   850: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   853: astore 23
    //   855: aload_3
    //   856: ifnonnull +601 -> 1457
    //   859: ldc_w 701
    //   862: astore_1
    //   863: aload 23
    //   865: aload_1
    //   866: invokevirtual 418	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   869: pop
    //   870: ldc 8
    //   872: iconst_2
    //   873: aload 24
    //   875: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   878: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   881: aload_3
    //   882: ifnull +631 -> 1513
    //   885: aload_3
    //   886: invokeinterface 113 1 0
    //   891: ifle +622 -> 1513
    //   894: aload_3
    //   895: invokeinterface 113 1 0
    //   900: iconst_1
    //   901: if_icmple +15 -> 916
    //   904: aload_3
    //   905: new 790	njl
    //   908: dup
    //   909: aload_0
    //   910: invokespecial 793	njl:<init>	(Lcom/tencent/mobileqq/app/message/C2CMessageProcessor;)V
    //   913: invokestatic 799	java/util/Collections:sort	(Ljava/util/List;Ljava/util/Comparator;)V
    //   916: aload_0
    //   917: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   920: bipush 50
    //   922: invokevirtual 271	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   925: checkcast 801	com/tencent/mobileqq/app/FriendsManager
    //   928: aload_3
    //   929: iconst_0
    //   930: invokeinterface 509 2 0
    //   935: checkcast 157	msf/msgcomm/msg_comm$Msg
    //   938: getfield 161	msf/msgcomm/msg_comm$Msg:msg_head	Lmsf/msgcomm/msg_comm$MsgHead;
    //   941: invokevirtual 166	msf/msgcomm/msg_comm$MsgHead:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   944: checkcast 163	msf/msgcomm/msg_comm$MsgHead
    //   947: getfield 211	msf/msgcomm/msg_comm$MsgHead:from_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   950: invokevirtual 208	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   953: invokevirtual 804	com/tencent/mobileqq/app/FriendsManager:a	(J)V
    //   956: aload_0
    //   957: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   960: aload_2
    //   961: iconst_0
    //   962: invokevirtual 807	com/tencent/mobileqq/app/MessageHandler:a	(Ljava/lang/String;I)Ljava/lang/Object;
    //   965: astore 23
    //   967: aload 23
    //   969: monitorenter
    //   970: aload_0
    //   971: aload_2
    //   972: aload 22
    //   974: lload 14
    //   976: iload 8
    //   978: iload 9
    //   980: iload 10
    //   982: invokespecial 809	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(Ljava/lang/String;Lmsf/msgcomm/msg_comm$UinPairMsg;JZZZ)Landroid/util/Pair;
    //   985: astore_2
    //   986: aload_2
    //   987: getfield 813	android/util/Pair:first	Ljava/lang/Object;
    //   990: checkcast 229	java/lang/String
    //   993: astore_1
    //   994: aload_2
    //   995: getfield 816	android/util/Pair:second	Ljava/lang/Object;
    //   998: checkcast 117	java/lang/Integer
    //   1001: invokevirtual 819	java/lang/Integer:intValue	()I
    //   1004: istore 7
    //   1006: aload 23
    //   1008: monitorexit
    //   1009: iload 8
    //   1011: ifne +171 -> 1182
    //   1014: aload_0
    //   1015: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1018: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1021: aload_1
    //   1022: invokevirtual 821	com/tencent/mobileqq/service/message/MessageCache:f	(Ljava/lang/String;)J
    //   1025: lstore 18
    //   1027: aload_3
    //   1028: iconst_0
    //   1029: invokeinterface 509 2 0
    //   1034: checkcast 157	msf/msgcomm/msg_comm$Msg
    //   1037: getfield 161	msf/msgcomm/msg_comm$Msg:msg_head	Lmsf/msgcomm/msg_comm$MsgHead;
    //   1040: invokevirtual 166	msf/msgcomm/msg_comm$MsgHead:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   1043: checkcast 163	msf/msgcomm/msg_comm$MsgHead
    //   1046: getfield 215	msf/msgcomm/msg_comm$MsgHead:msg_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   1049: invokevirtual 219	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   1052: i2l
    //   1053: lstore 20
    //   1055: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1058: ifeq +62 -> 1120
    //   1061: ldc 8
    //   1063: iconst_2
    //   1064: new 129	java/lang/StringBuilder
    //   1067: dup
    //   1068: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1071: ldc_w 823
    //   1074: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1077: aload_1
    //   1078: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1081: ldc_w 825
    //   1084: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1087: lload 18
    //   1089: invokevirtual 251	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1092: ldc_w 827
    //   1095: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1098: lload 20
    //   1100: invokevirtual 251	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1103: ldc_w 757
    //   1106: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1109: iload 4
    //   1111: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1114: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1117: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1120: lload 18
    //   1122: lconst_0
    //   1123: lcmp
    //   1124: ifeq +11 -> 1135
    //   1127: lload 20
    //   1129: lload 18
    //   1131: lcmp
    //   1132: ifge +35 -> 1167
    //   1135: aload_0
    //   1136: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1139: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1142: aload_1
    //   1143: lload 20
    //   1145: lconst_0
    //   1146: invokevirtual 830	com/tencent/mobileqq/service/message/MessageCache:b	(Ljava/lang/String;JJ)V
    //   1149: iload 4
    //   1151: ifle +16 -> 1167
    //   1154: aload_0
    //   1155: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1158: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1161: aload_1
    //   1162: lload 20
    //   1164: invokevirtual 832	com/tencent/mobileqq/service/message/MessageCache:f	(Ljava/lang/String;J)V
    //   1167: iload 4
    //   1169: ifne +13 -> 1182
    //   1172: aload_0
    //   1173: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1176: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1179: invokevirtual 834	com/tencent/mobileqq/service/message/MessageCache:c	()V
    //   1182: lload 12
    //   1184: invokestatic 753	java/lang/System:currentTimeMillis	()J
    //   1187: lload 16
    //   1189: lsub
    //   1190: ladd
    //   1191: lstore 12
    //   1193: iload 9
    //   1195: ifeq +357 -> 1552
    //   1198: aload_1
    //   1199: astore_2
    //   1200: iload 7
    //   1202: sipush 1006
    //   1205: if_icmpne +30 -> 1235
    //   1208: aload_0
    //   1209: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1212: bipush 10
    //   1214: invokevirtual 271	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   1217: checkcast 836	com/tencent/mobileqq/model/PhoneContactManager
    //   1220: aload_1
    //   1221: invokeinterface 838 2 0
    //   1226: astore_3
    //   1227: aload_1
    //   1228: astore_2
    //   1229: aload_3
    //   1230: ifnull +5 -> 1235
    //   1233: aload_3
    //   1234: astore_2
    //   1235: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1238: ifeq +29 -> 1267
    //   1241: ldc 8
    //   1243: iconst_2
    //   1244: new 129	java/lang/StringBuilder
    //   1247: dup
    //   1248: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1251: ldc_w 840
    //   1254: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1257: aload_2
    //   1258: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1261: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1264: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1267: new 842	android/os/Message
    //   1270: dup
    //   1271: invokespecial 843	android/os/Message:<init>	()V
    //   1274: astore_1
    //   1275: aload_1
    //   1276: iconst_1
    //   1277: putfield 846	android/os/Message:what	I
    //   1280: new 555	android/os/Bundle
    //   1283: dup
    //   1284: invokespecial 556	android/os/Bundle:<init>	()V
    //   1287: astore_3
    //   1288: aload_3
    //   1289: ldc_w 848
    //   1292: lload 14
    //   1294: invokevirtual 631	android/os/Bundle:putLong	(Ljava/lang/String;J)V
    //   1297: aload_3
    //   1298: ldc_w 850
    //   1301: aload_2
    //   1302: invokevirtual 567	android/os/Bundle:putString	(Ljava/lang/String;Ljava/lang/String;)V
    //   1305: aload_3
    //   1306: ldc_w 852
    //   1309: iload 7
    //   1311: invokevirtual 562	android/os/Bundle:putInt	(Ljava/lang/String;I)V
    //   1314: aload_1
    //   1315: aload_3
    //   1316: invokevirtual 856	android/os/Message:setData	(Landroid/os/Bundle;)V
    //   1319: aload_0
    //   1320: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1323: astore_3
    //   1324: iload 4
    //   1326: ifgt +209 -> 1535
    //   1329: iconst_1
    //   1330: istore 8
    //   1332: aload_3
    //   1333: aload_1
    //   1334: iload 8
    //   1336: invokevirtual 859	com/tencent/mobileqq/app/MessageHandler:a	(Landroid/os/Message;Z)V
    //   1339: iload 5
    //   1341: iconst_2
    //   1342: if_icmpne +199 -> 1541
    //   1345: aload_0
    //   1346: getfield 46	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilSet	Ljava/util/Set;
    //   1349: aload_2
    //   1350: invokeinterface 860 2 0
    //   1355: pop
    //   1356: iload 6
    //   1358: iconst_1
    //   1359: iadd
    //   1360: istore 6
    //   1362: goto -653 -> 709
    //   1365: aload_0
    //   1366: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1369: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1372: aload_2
    //   1373: invokevirtual 863	com/tencent/mobileqq/service/message/MessageCache:a	([B)V
    //   1376: aload_0
    //   1377: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1380: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1383: aload_2
    //   1384: invokevirtual 865	com/tencent/mobileqq/service/message/MessageCache:b	([B)V
    //   1387: aload_0
    //   1388: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1391: iconst_0
    //   1392: invokevirtual 867	com/tencent/mobileqq/app/MessageHandler:b	(Z)V
    //   1395: aload_0
    //   1396: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1399: iconst_0
    //   1400: invokevirtual 869	com/tencent/mobileqq/app/MessageHandler:c	(Z)V
    //   1403: goto -903 -> 500
    //   1406: aload_0
    //   1407: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1410: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1413: aload_2
    //   1414: invokevirtual 863	com/tencent/mobileqq/service/message/MessageCache:a	([B)V
    //   1417: aload_0
    //   1418: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1421: iconst_0
    //   1422: invokevirtual 867	com/tencent/mobileqq/app/MessageHandler:b	(Z)V
    //   1425: goto -925 -> 500
    //   1428: aload_0
    //   1429: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1432: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1435: aload 23
    //   1437: invokevirtual 865	com/tencent/mobileqq/service/message/MessageCache:b	([B)V
    //   1440: aload_0
    //   1441: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1444: iconst_0
    //   1445: invokevirtual 869	com/tencent/mobileqq/app/MessageHandler:c	(Z)V
    //   1448: goto -948 -> 500
    //   1451: iconst_0
    //   1452: istore 8
    //   1454: goto -653 -> 801
    //   1457: aload_3
    //   1458: invokeinterface 113 1 0
    //   1463: invokestatic 121	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1466: astore_1
    //   1467: goto -604 -> 863
    //   1470: astore_1
    //   1471: aload 23
    //   1473: monitorexit
    //   1474: aload_1
    //   1475: athrow
    //   1476: astore_1
    //   1477: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1480: ifeq +30 -> 1510
    //   1483: ldc 8
    //   1485: iconst_2
    //   1486: new 129	java/lang/StringBuilder
    //   1489: dup
    //   1490: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1493: ldc_w 871
    //   1496: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1499: aload_1
    //   1500: invokevirtual 418	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1503: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1506: aload_1
    //   1507: invokestatic 715	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1510: goto -154 -> 1356
    //   1513: aload_0
    //   1514: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1517: invokevirtual 354	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   1520: aload_2
    //   1521: iconst_0
    //   1522: invokevirtual 874	com/tencent/mobileqq/app/message/QQMessageFacade:a	(Ljava/lang/String;I)Lcom/tencent/mobileqq/app/message/QQMessageFacade$Message;
    //   1525: getfield 877	com/tencent/mobileqq/app/message/QQMessageFacade$Message:istroop	I
    //   1528: istore 7
    //   1530: aload_2
    //   1531: astore_1
    //   1532: goto -350 -> 1182
    //   1535: iconst_0
    //   1536: istore 8
    //   1538: goto -206 -> 1332
    //   1541: aload_0
    //   1542: getfield 44	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilSet	Ljava/util/Set;
    //   1545: aload_2
    //   1546: invokeinterface 860 2 0
    //   1551: pop
    //   1552: goto -196 -> 1356
    //   1555: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1558: ifeq +30 -> 1588
    //   1561: ldc 8
    //   1563: iconst_2
    //   1564: new 129	java/lang/StringBuilder
    //   1567: dup
    //   1568: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1571: ldc_w 879
    //   1574: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1577: lload 12
    //   1579: invokevirtual 251	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1582: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1585: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1588: iload 4
    //   1590: ifgt -1311 -> 279
    //   1593: aload_0
    //   1594: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1597: invokevirtual 880	com/tencent/mobileqq/app/MessageHandler:c	()V
    //   1600: iload 9
    //   1602: ifeq +364 -> 1966
    //   1605: aload_0
    //   1606: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1609: invokevirtual 883	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/ConversationFacade;
    //   1612: invokevirtual 887	com/tencent/mobileqq/app/message/ConversationFacade:a	()Ljava/util/Set;
    //   1615: invokeinterface 425 1 0
    //   1620: astore_1
    //   1621: aload_1
    //   1622: invokeinterface 285 1 0
    //   1627: ifeq +324 -> 1951
    //   1630: aload_1
    //   1631: invokeinterface 289 1 0
    //   1636: checkcast 889	com/tencent/mobileqq/data/ConversationInfo
    //   1639: astore_2
    //   1640: aload_2
    //   1641: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1644: ifnull -23 -> 1621
    //   1647: iload 5
    //   1649: iconst_1
    //   1650: if_icmpne +13 -> 1663
    //   1653: aload_2
    //   1654: getfield 895	com/tencent/mobileqq/data/ConversationInfo:type	I
    //   1657: sipush 1008
    //   1660: if_icmpeq -39 -> 1621
    //   1663: iload 5
    //   1665: iconst_2
    //   1666: if_icmpne +13 -> 1679
    //   1669: aload_2
    //   1670: getfield 895	com/tencent/mobileqq/data/ConversationInfo:type	I
    //   1673: sipush 1008
    //   1676: if_icmpne -55 -> 1621
    //   1679: iload 5
    //   1681: iconst_2
    //   1682: if_icmpeq +31 -> 1713
    //   1685: aload_0
    //   1686: getfield 44	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilSet	Ljava/util/Set;
    //   1689: invokeinterface 896 1 0
    //   1694: ifle +19 -> 1713
    //   1697: aload_0
    //   1698: getfield 44	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilSet	Ljava/util/Set;
    //   1701: aload_2
    //   1702: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1705: invokeinterface 899 2 0
    //   1710: ifne -89 -> 1621
    //   1713: iload 5
    //   1715: iconst_2
    //   1716: if_icmpne +31 -> 1747
    //   1719: aload_0
    //   1720: getfield 46	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilSet	Ljava/util/Set;
    //   1723: invokeinterface 896 1 0
    //   1728: ifle +19 -> 1747
    //   1731: aload_0
    //   1732: getfield 46	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilSet	Ljava/util/Set;
    //   1735: aload_2
    //   1736: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1739: invokeinterface 899 2 0
    //   1744: ifne -123 -> 1621
    //   1747: aload_2
    //   1748: getfield 895	com/tencent/mobileqq/data/ConversationInfo:type	I
    //   1751: invokestatic 351	com/tencent/mobileqq/app/message/MsgProxyUtils:c	(I)Z
    //   1754: ifeq -133 -> 1621
    //   1757: aload_2
    //   1758: invokestatic 902	com/tencent/mobileqq/app/message/ConversationFacade:b	(Lcom/tencent/mobileqq/data/ConversationInfo;)I
    //   1761: ifle -140 -> 1621
    //   1764: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1767: ifeq +32 -> 1799
    //   1770: ldc 8
    //   1772: iconst_2
    //   1773: new 129	java/lang/StringBuilder
    //   1776: dup
    //   1777: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1780: ldc_w 904
    //   1783: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1786: aload_2
    //   1787: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1790: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1793: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1796: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1799: aload_2
    //   1800: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1803: invokevirtual 576	java/lang/String:length	()I
    //   1806: iconst_4
    //   1807: if_icmple -186 -> 1621
    //   1810: aload_2
    //   1811: getfield 895	com/tencent/mobileqq/data/ConversationInfo:type	I
    //   1814: sipush 1001
    //   1817: if_icmpne +59 -> 1876
    //   1820: aload_0
    //   1821: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1824: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   1827: aload_2
    //   1828: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1831: invokevirtual 907	com/tencent/mobileqq/service/message/MessageCache:k	(Ljava/lang/String;)[B
    //   1834: astore_3
    //   1835: aload_3
    //   1836: ifnull -215 -> 1621
    //   1839: aload_3
    //   1840: arraylength
    //   1841: ifle -220 -> 1621
    //   1844: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1847: ifeq +29 -> 1876
    //   1850: ldc 8
    //   1852: iconst_2
    //   1853: new 129	java/lang/StringBuilder
    //   1856: dup
    //   1857: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1860: ldc_w 909
    //   1863: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1866: aload_3
    //   1867: invokevirtual 418	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1870: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1873: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1876: new 842	android/os/Message
    //   1879: dup
    //   1880: invokespecial 843	android/os/Message:<init>	()V
    //   1883: astore_3
    //   1884: aload_3
    //   1885: iconst_1
    //   1886: putfield 846	android/os/Message:what	I
    //   1889: new 555	android/os/Bundle
    //   1892: dup
    //   1893: invokespecial 556	android/os/Bundle:<init>	()V
    //   1896: astore 22
    //   1898: aload 22
    //   1900: ldc_w 848
    //   1903: ldc2_w 910
    //   1906: invokevirtual 631	android/os/Bundle:putLong	(Ljava/lang/String;J)V
    //   1909: aload 22
    //   1911: ldc_w 850
    //   1914: aload_2
    //   1915: getfield 892	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   1918: invokevirtual 567	android/os/Bundle:putString	(Ljava/lang/String;Ljava/lang/String;)V
    //   1921: aload 22
    //   1923: ldc_w 852
    //   1926: aload_2
    //   1927: getfield 895	com/tencent/mobileqq/data/ConversationInfo:type	I
    //   1930: invokevirtual 562	android/os/Bundle:putInt	(Ljava/lang/String;I)V
    //   1933: aload_3
    //   1934: aload 22
    //   1936: invokevirtual 856	android/os/Message:setData	(Landroid/os/Bundle;)V
    //   1939: aload_0
    //   1940: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   1943: aload_3
    //   1944: iconst_1
    //   1945: invokevirtual 859	com/tencent/mobileqq/app/MessageHandler:a	(Landroid/os/Message;Z)V
    //   1948: goto -327 -> 1621
    //   1951: iload 5
    //   1953: iconst_2
    //   1954: if_icmpne +91 -> 2045
    //   1957: aload_0
    //   1958: getfield 46	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilSet	Ljava/util/Set;
    //   1961: invokeinterface 914 1 0
    //   1966: invokestatic 919	com/tencent/util/MsgAutoMonitorUtil:a	()Lcom/tencent/util/MsgAutoMonitorUtil;
    //   1969: invokevirtual 921	com/tencent/util/MsgAutoMonitorUtil:e	()V
    //   1972: iload 5
    //   1974: tableswitch	default:+26->2000, 0:+83->2057, 1:+104->2078, 2:+116->2090
    //   2000: aload_0
    //   2001: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2004: invokevirtual 235	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/service/message/MessageCache;
    //   2007: invokevirtual 923	com/tencent/mobileqq/service/message/MessageCache:h	()V
    //   2010: aload_0
    //   2011: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   2014: invokevirtual 745	com/tencent/mobileqq/app/MessageHandler:a	()Z
    //   2017: ifeq -1738 -> 279
    //   2020: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2023: ifeq +12 -> 2035
    //   2026: ldc 8
    //   2028: iconst_2
    //   2029: ldc_w 925
    //   2032: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2035: aload_0
    //   2036: getfield 438	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   2039: iconst_0
    //   2040: iconst_0
    //   2041: invokevirtual 928	com/tencent/mobileqq/app/MessageHandler:a	(ZI)V
    //   2044: return
    //   2045: aload_0
    //   2046: getfield 44	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilSet	Ljava/util/Set;
    //   2049: invokeinterface 914 1 0
    //   2054: goto -88 -> 1966
    //   2057: aload_0
    //   2058: sipush 4016
    //   2061: iconst_1
    //   2062: aconst_null
    //   2063: invokevirtual 642	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(IZLjava/lang/Object;)V
    //   2066: aload_0
    //   2067: sipush 4001
    //   2070: iconst_1
    //   2071: aconst_null
    //   2072: invokevirtual 642	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(IZLjava/lang/Object;)V
    //   2075: goto -75 -> 2000
    //   2078: aload_0
    //   2079: sipush 4001
    //   2082: iconst_1
    //   2083: aconst_null
    //   2084: invokevirtual 642	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(IZLjava/lang/Object;)V
    //   2087: goto -87 -> 2000
    //   2090: aload_0
    //   2091: sipush 4016
    //   2094: iconst_1
    //   2095: aconst_null
    //   2096: invokevirtual 642	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(IZLjava/lang/Object;)V
    //   2099: goto -99 -> 2000
    //   2102: iconst_0
    //   2103: istore 4
    //   2105: goto -1684 -> 421
    //   2108: iconst_2
    //   2109: istore 6
    //   2111: goto -1700 -> 411
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	2114	0	this	C2CMessageProcessor
    //   0	2114	1	paramToServiceMsg	ToServiceMsg
    //   0	2114	2	paramFromServiceMsg	FromServiceMsg
    //   0	2114	3	paramObject	Object
    //   419	1685	4	b1	byte
    //   449	1524	5	i1	int
    //   409	1701	6	i2	int
    //   1004	525	7	i3	int
    //   501	1036	8	bool1	boolean
    //   11	1590	9	bool2	boolean
    //   37	944	10	bool3	boolean
    //   24	623	11	bool4	boolean
    //   707	871	12	l1	long
    //   765	528	14	l2	long
    //   724	464	16	l3	long
    //   1025	105	18	l4	long
    //   1053	110	20	l5	long
    //   56	232	22	localObject1	Object
    //   292	15	22	localException	Exception
    //   312	1623	22	localObject2	Object
    //   134	740	24	localStringBuilder	StringBuilder
    //   380	347	25	localList	List
    // Exception table:
    //   from	to	target	type
    //   73	90	292	java/lang/Exception
    //   970	1009	1470	finally
    //   1471	1474	1470	finally
    //   956	970	1476	java/lang/Exception
    //   1474	1476	1476	java/lang/Exception
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, boolean paramBoolean)
  {
    paramFromServiceMsg = new HashMap(1);
    paramFromServiceMsg.put("KEYWORD", extraData.getString("keyword"));
    paramFromServiceMsg.put("SEARCHSEQUENCE", Long.valueOf(extraData.getLong("sequence")));
    paramFromServiceMsg.put("LOADTYPE", Integer.valueOf(extraData.getInt("loadType")));
    int i1 = extraData.getInt("retryIndex");
    if ((!paramBoolean) && (i1 < 2))
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.msg.C2CMessageProcessor", 2, "handleSearchRoamMsgInCloudTimeOutAndError retry index:" + i1);
      }
      extraData.putInt("retryIndex", i1 + 1);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramToServiceMsg);
      return;
    }
    a(8015, false, paramFromServiceMsg);
  }
  
  private void a(List paramList)
  {
    if ((paramList == null) || (paramList.size() <= 0)) {}
    for (;;)
    {
      return;
      long l1 = System.currentTimeMillis() / 1000L;
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        MessageRecord localMessageRecord = (MessageRecord)paramList.next();
        if (istroop == 1008) {
          if ((!TextUtils.isEmpty(localMessageRecord.getExtInfoFromExtStr("public_account_send_flag"))) && (!TextUtils.isEmpty(localMessageRecord.getExtInfoFromExtStr("public_account_msg_id"))) && (!TextUtils.equals(frienduin, selfuin))) {
            ThreadManager.a(new njp(this, frienduin, selfuin, localMessageRecord.getExtInfoFromExtStr("public_account_msg_id"), time, l1, localMessageRecord.getExtInfoFromExtStr("public_account_send_flag")), 5, null, false);
          } else if (QLog.isColorLevel()) {
            QLog.d("Q.msg.C2CMessageProcessor", 2, "reportPubAccMsg exception, public_account_send_flag null || public_account_msg_id null || ");
          }
        }
      }
    }
  }
  
  private void a(List paramList1, List paramList2)
  {
    Pair localPair = super.a(paramList1, paramList2);
    if ((((Boolean)first).booleanValue()) && (QLog.isColorLevel()))
    {
      StringBuilder localStringBuilder = new StringBuilder("<---C2CMessagePackage:msgFilter_OnePkg ");
      localStringBuilder.append((CharSequence)second);
      localStringBuilder.append(" inListSize:").append(paramList1.size()).append(" outListSize:").append(paramList2.size());
      QLog.d("Q.msg.C2CMessageProcessor", 2, localStringBuilder.toString());
    }
  }
  
  private void a(msg_comm.Msg paramMsg, FromServiceMsg paramFromServiceMsg, msg_onlinepush.PbPushMsg paramPbPushMsg)
  {
    msg_comm.MsgHead localMsgHead = (msg_comm.MsgHead)msg_head.get();
    if (!c2c_cmd.has()) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.C2CMessageProcessor", 2, "<---handleMsgPush_PB_SlaveMaster: no C2CCmd.");
      }
    }
    long l1;
    Object localObject2;
    boolean bool;
    do
    {
      for (;;)
      {
        return;
        l1 = c2c_cmd.get();
        long l2 = from_uin.get();
        long l3 = to_uin.get();
        long l4 = msg_seq.get();
        long l5 = msg_time.get();
        long l6 = msg_uid.get();
        int i1 = user_active.get();
        int i2 = from_instid.get();
        Object localObject1;
        long l7;
        if (paramFromServiceMsg.getUin() == null)
        {
          localObject1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          l7 = ((Long)localObject1).longValue();
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.C2CMessageProcessor", 2, "<---handleMsgPush_PB_SlaveMaster:fromUin:" + l2 + ",toUin:" + l3 + ",msgTime:" + l5 + ",msgSeq:" + l4 + ",msgUid:" + l6 + ",userActive:" + i1 + ",fromInstid:" + i2 + ",hasAppShare:" + appshare_info.has() + ",hasMsgBody:" + msg_body.has());
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.bJ = i1;
          localObject1 = new ArrayList();
          Long.parseLong(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        }
        try
        {
          localObject2 = new DecodeProtoPkgContext(l7, l3, true, false, false, false);
          h = true;
          paramMsg = a(paramMsg, (PBDecodeContext)localObject2);
          MessageHandlerUtils.a(paramMsg);
          if ((paramMsg != null) && (paramMsg.size() != 0))
          {
            if (localObject1 != null) {
              a(paramMsg, (ArrayList)localObject1, true);
            }
            paramMsg = new ArrayList();
            localObject2 = new ArrayList();
            if ((localObject1 != null) && (((ArrayList)localObject1).size() > 0))
            {
              i2 = ((ArrayList)localObject1).size();
              i1 = 0;
              while (i1 < i2)
              {
                MessageRecord localMessageRecord = (MessageRecord)((ArrayList)localObject1).get(i1);
                if (QLog.isColorLevel()) {
                  QLog.d("Q.msg.C2CMessageProcessor", 2, "----------handleMsgPush_PB_SlaveMaster after analysis mr.senderuin: " + senderuin + " mr.msgtype: " + msgtype + " mr.frienduin: " + frienduin + " mr.shmsgseq: " + shmsgseq + " mr.time:" + time + " mr.msg: " + localMessageRecord.getLogColorContent());
                }
                isread = true;
                issend = 2;
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, time);
                ((ArrayList)localObject2).add(localMessageRecord);
                DelMsgInfo localDelMsgInfo = new DelMsgInfo();
                lFromUin = Long.parseLong(senderuin);
                shMsgSeq = ((short)(int)shmsgseq);
                uMsgTime = time;
                paramMsg.add(localDelMsgInfo);
                i1 += 1;
                continue;
                localObject1 = Long.valueOf(paramFromServiceMsg.getUin());
              }
            }
          }
        }
        catch (Exception paramMsg)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.C2CMessageProcessor", 2, "decodeSinglePBMsg_C2C error,", paramMsg);
            }
            paramMsg = null;
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b((List)localObject2);
          bool = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (ArrayList)localObject2);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((ArrayList)localObject2, String.valueOf(l7), false);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(msg_seq.get());
          i1 = paramFromServiceMsg.getRequestSsoSeq();
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l2, paramMsg, svrip.get(), i1);
        }
      }
    } while (l1 == 127L);
    a("handleMsgPush_PB_SlaveMaster", true, 0, jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(false, bool), false);
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b((ArrayList)localObject2);
  }
  
  private void a(byte[] paramArrayOfByte)
  {
    long l1 = PkgTools.a(paramArrayOfByte, 0);
    String str = String.valueOf(l1);
    PkgTools.a(paramArrayOfByte, 10);
    int i1 = PkgTools.a(paramArrayOfByte, 16);
    Object localObject = null;
    if (i1 > 0) {
      localObject = PkgTools.a(paramArrayOfByte, 18, i1);
    }
    if (QLog.isColorLevel()) {
      QLog.i("Q.msg.C2CMessageProcessor", 2, "----->handleHotChatAnnouncementMsg dwGroupCode = " + l1 + ", len = " + i1 + ", announcement = " + (String)localObject);
    }
    paramArrayOfByte = (HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35);
    localObject = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
    if ((paramArrayOfByte != null) && (localObject != null))
    {
      localObject = ((HotChatManager)localObject).a(str);
      if (localObject != null)
      {
        if (userCreate != 1) {
          break label162;
        }
        paramArrayOfByte.b(str);
      }
    }
    return;
    label162:
    paramArrayOfByte.a(uuid.getBytes(), str);
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    paramFromServiceMsg = new Bundle();
    paramFromServiceMsg.putLong("BEGTIME", extraData.getLong("lBeginTime"));
    paramFromServiceMsg.putBoolean("FETCH_MORE", extraData.getBoolean("fetchMore"));
    a(1004, false, paramFromServiceMsg);
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    paramFromServiceMsg = new msg_svc.PbGetRoamMsgResp();
    try
    {
      paramFromServiceMsg = (msg_svc.PbGetRoamMsgResp)paramFromServiceMsg.mergeFrom((byte[])paramObject);
      paramObject = new Bundle();
      localObject2 = Long.valueOf(extraData.getLong("lBeginTime"));
      bool1 = extraData.getBoolean("fetchMore");
      i3 = extraData.getInt("fetchNum");
      bool2 = extraData.getBoolean("preloadType");
      paramObject.putLong("BEGTIME", ((Long)localObject2).longValue());
      paramObject.putBoolean("FETCH_MORE", bool1);
      paramObject.putInt("MSG_COUNT", i3);
      paramObject.putString("PEER_UIN", extraData.getString("peerUin"));
      paramObject.putBoolean("IS_PRELOAD_TYPE", bool2);
      if (paramFromServiceMsg != null)
      {
        str = String.valueOf(peer_uin.get());
        i2 = result.get();
        localObject3 = msg.get();
        if (localObject3 == null)
        {
          if (jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.containsKey(str)) {
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.remove(str);
          }
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg code=" + i2 + ", msgList is null !");
          }
          a(1004, false, paramObject);
          return;
        }
      }
    }
    catch (InvalidProtocolBufferMicroException paramFromServiceMsg)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg InvalidProtocolBufferMicroException ! ", paramFromServiceMsg);
        }
        paramFromServiceMsg = null;
      }
    }
    catch (OutOfMemoryError paramFromServiceMsg)
    {
      Object localObject2;
      boolean bool1;
      int i3;
      boolean bool2;
      String str;
      int i2;
      Object localObject3;
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg OutOfMemoryError ! ", paramFromServiceMsg);
        }
        paramFromServiceMsg = null;
      }
      Object localObject1 = new ArrayList();
      a((List)localObject3, (List)localObject1);
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg begTime: " + localObject2 + ", code=" + i2 + ", msgList.size()=" + ((List)localObject1).size() + ",peerUin=" + str + ",time=" + last_msgtime.get() + ",fetchMore:" + bool1 + ",fetchNum: " + i3);
      }
      int i1 = 0;
      if (((i2 != 0) && (i2 != 1)) || (i2 == 0)) {}
      for (;;)
      {
        try
        {
          if (((List)localObject1).size() > 0)
          {
            if (!jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.containsKey(str)) {
              continue;
            }
            localObject2 = (List)jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.get(str);
            if (((List)localObject2).size() == 0) {
              ((List)localObject2).addAll(0, (Collection)localObject1);
            }
          }
          else
          {
            localObject1 = (MessageRoamManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(91);
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(str, extraData.getLong("lBeginTime"), last_msgtime.get(), extraData.getLong("lEndTime"), (short)0, random.get(), 1, ((MessageRoamManager)localObject1).b(), ((MessageRoamManager)localObject1).b(), extraData.getBoolean("fetchMore"), i3, bool2);
            return;
          }
        }
        catch (Exception paramToServiceMsg)
        {
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg exception ! ", paramToServiceMsg);
          }
          i1 = 0;
          if (i1 != 0) {
            break;
          }
          if (jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.containsKey(str)) {
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.remove(str);
          }
          paramObject.putInt("SVR_CODE", i2);
          if (errmsg.has()) {
            paramObject.putString("SVR_MSG", errmsg.get());
          }
          a(1004, false, paramObject);
          return;
          if ((((List)localObject2).size() <= 0) || ((get0msg_head.get()).msg_uid.get() == get0msg_head.get()).msg_uid.get()) && (get0msg_head.get()).msg_seq.get() == get0msg_head.get()).msg_seq.get()))) {
            continue;
          }
          ((List)localObject2).addAll(0, (Collection)localObject1);
          continue;
        }
        catch (OutOfMemoryError paramToServiceMsg)
        {
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg OutOfMemoryError ! ", paramToServiceMsg);
          }
          i1 = 0;
          continue;
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.put(str, localObject1);
          continue;
        }
        localObject1 = new ArrayList((Collection)localObject1);
        if (jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.containsKey(str))
        {
          ((ArrayList)localObject1).addAll((Collection)jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.get(str));
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a.remove(str);
        }
        if (((ArrayList)localObject1).isEmpty())
        {
          new Object[2][0] = Boolean.valueOf(true);
          paramObject.putBoolean("NO_MSG", Boolean.TRUE.booleanValue());
          a(1004, false, paramObject);
          return;
        }
        long l1 = extraData.getLong("lBeginTime");
        long l2 = extraData.getLong("lEndTime");
        localObject2 = new ArrayList();
        localObject3 = ((ArrayList)localObject1).iterator();
        while (((Iterator)localObject3).hasNext())
        {
          localObject4 = (msg_comm.Msg)((Iterator)localObject3).next();
          if (!msg_head.has())
          {
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg msg msg_head = null");
            }
          }
          else
          {
            long l3 = msg_head.get()).msg_time.get();
            if ((l3 >= l1) && (l3 <= l2)) {
              ((ArrayList)localObject2).add(localObject4);
            }
          }
        }
        Object localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, (List)localObject2, Long.valueOf(str).longValue(), true);
        localObject3 = new ArrayList();
        l1 = Long.parseLong(str);
        if (!((ArrayList)localObject2).isEmpty())
        {
          localObject5 = (msg_comm.Msg)((ArrayList)localObject2).get(0);
          l1 = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, msg_head.get()).from_uin.get(), msg_head.get()).to_uin.get(), peer_uin.get());
        }
        ((ArrayList)localObject3).addAll((Collection)aextraData.getLong("lBeginTime"), extraData.getLong("lEndTime")).second);
        localObject4 = new DecodeProtoPkgContext(Long.parseLong(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()), l1, true, true, false, false);
        h = true;
        Object localObject5 = ((ArrayList)localObject2).iterator();
        while (((Iterator)localObject5).hasNext())
        {
          Object localObject6 = (msg_comm.Msg)((Iterator)localObject5).next();
          try
          {
            localObject6 = a((msg_comm.Msg)localObject6, (PBDecodeContext)localObject4);
            if ((localObject6 == null) || (((ArrayList)localObject6).isEmpty())) {
              continue;
            }
            ((ArrayList)localObject3).addAll((Collection)localObject6);
          }
          catch (Exception localException2) {}
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.C2CMessageProcessor", 2, "decodeSinglePBMsg_C2C error,", localException2);
          }
        }
        if ((localObject3 != null) && (((ArrayList)localObject3).size() > 0)) {
          Collections.sort((List)localObject3, new njm(this));
        }
        try
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b((List)localObject3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((List)localObject3);
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a((ArrayList)localObject3, false);
          localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(String.valueOf(peer_uin.get()));
          if ((localObject4 == null) || (((Long)first).longValue() > last_msgtime.get())) {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(String.valueOf(peer_uin.get()), extraData.getLong("lBeginTime"), 0L);
          }
          ((MessageRoamManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(91)).a().b(str, extraData.getLong("lBeginTime"), 3);
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg resList size = " + ((ArrayList)localObject1).size() + ", dayList size = " + ((ArrayList)localObject2).size() + ", loopList size=" + ((ArrayList)localObject3).size());
          }
          paramObject.putInt("MSG_COUNT", i3 - ((ArrayList)localObject3).size());
          a(1004, true, paramObject);
          i1 = 1;
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg exception ! ", localException1);
            }
          }
        }
        catch (OutOfMemoryError localOutOfMemoryError)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsg OutOfMemoryError ! ", localOutOfMemoryError);
            }
          }
        }
      }
      a(1004, false, paramObject);
    }
  }
  
  private boolean b(MessageRecord paramMessageRecord)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, msgUid, shmsgseq);
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsgInOneDay ");
    }
    paramFromServiceMsg = new msg_svc.PbGetOneDayRoamMsgResp();
    Bundle localBundle;
    long l2;
    int i1;
    long l1;
    try
    {
      paramFromServiceMsg = (msg_svc.PbGetOneDayRoamMsgResp)paramFromServiceMsg.mergeFrom((byte[])paramObject);
      localBundle = extraData.getBundle("context");
      paramObject = null;
      l2 = 0L;
      if (paramFromServiceMsg == null) {
        break label691;
      }
      i1 = result.get();
      Object localObject = msg.get();
      paramToServiceMsg = new ArrayList();
      a((List)localObject, paramToServiceMsg);
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.C2CMessageProcessor", 2, "handlePBGetRoamMsgInOneDay code=" + i1 + ", complete=" + iscomplete.get() + " ,respRandom:" + random.get() + ", lastMsgTime:" + last_msgtime.get() + ", msgList.size()=" + paramToServiceMsg.size() + ", context" + localBundle);
      }
      if (i1 != 0) {
        break label692;
      }
      paramObject = new ArrayList();
      try
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramToServiceMsg, peer_uin.get(), true);
        if (localObject != null) {
          paramObject.addAll((Collection)localObject);
        }
      }
      catch (Exception localException1)
      {
        for (;;)
        {
          DecodeProtoPkgContext localDecodeProtoPkgContext;
          Iterator localIterator;
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.C2CMessageProcessor", 2, "FileMsg filter error,", localException1);
          }
        }
      }
      l1 = peer_uin.get();
      if (!paramToServiceMsg.isEmpty())
      {
        localObject = (msg_comm.Msg)paramToServiceMsg.get(0);
        l1 = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, msg_head.get()).from_uin.get(), msg_head.get()).to_uin.get(), peer_uin.get());
      }
      localDecodeProtoPkgContext = new DecodeProtoPkgContext(Long.parseLong(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()), l1, true, true, false, false);
      h = true;
      localIterator = paramToServiceMsg.iterator();
      paramToServiceMsg = null;
      for (;;)
      {
        if (!localIterator.hasNext()) {
          break label479;
        }
        localObject = (msg_comm.Msg)localIterator.next();
        try
        {
          localObject = a((msg_comm.Msg)localObject, localDecodeProtoPkgContext);
          paramToServiceMsg = (ToServiceMsg)localObject;
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.C2CMessageProcessor", 2, "decodeSinglePBMsg_C2C error,", localException2);
            }
          }
        }
        if ((paramToServiceMsg != null) && (paramToServiceMsg.size() > 0)) {
          paramObject.addAll(paramToServiceMsg);
        }
      }
    }
    catch (InvalidProtocolBufferMicroException paramFromServiceMsg)
    {
      for (;;)
      {
        paramFromServiceMsg.printStackTrace();
        paramFromServiceMsg = null;
      }
    }
    label479:
    if (paramObject.size() > 0)
    {
      Collections.sort(paramObject, new njn(this));
      l1 = get0time;
    }
    for (paramToServiceMsg = paramObject;; paramToServiceMsg = null)
    {
      for (;;)
      {
        boolean bool3;
        boolean bool1;
        label563:
        boolean bool2;
        if (localBundle != null)
        {
          localBundle.getInt("size_req", 0);
          l2 = localBundle.getLong("UIN", 0L);
          bool3 = localBundle.getBoolean("canUpdateEct", true);
          if (iscomplete.get() == 0) {
            break label734;
          }
          bool1 = true;
          if ((i1 != 0) && (i1 != 1) && (i1 != 4)) {
            break label740;
          }
          bool2 = true;
          label583:
          if ((!bool2) || (!bool3)) {
            break label783;
          }
          if (!bool1) {
            break label746;
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(String.valueOf(l2), 0L, 0L);
          label615:
          localBundle.putBoolean("complete", bool1);
          localBundle.putBoolean("success", bool2);
          localBundle.putLong("lowTime", l1);
          paramObject = new ArrayList();
        }
        try
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(peer_uin.get()), 0, paramToServiceMsg, paramObject, localBundle);
          if (paramToServiceMsg != null) {
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramObject, false);
          }
          label691:
          return;
          label692:
          l1 = l2;
          paramToServiceMsg = paramObject;
          if (i1 == 1)
          {
            l1 = l2;
            paramToServiceMsg = paramObject;
            if (QLog.isColorLevel())
            {
              QLog.d("Q.msg.C2CMessageProcessor", 2, "code == 0x01");
              l1 = l2;
              paramToServiceMsg = paramObject;
              continue;
              label734:
              bool1 = false;
              break label563;
              label740:
              bool2 = false;
              break label583;
              label746:
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(String.valueOf(peer_uin.get()), last_msgtime.get(), random.get());
              break label615;
              label783:
              if (bool3) {
                break label615;
              }
              if (bool1)
              {
                localBundle.putLong("tempEct", 0L);
                localBundle.putLong("tempRandom", 0L);
                break label615;
              }
              localBundle.putLong("tempEct", last_msgtime.get());
              localBundle.putLong("tempRandom", random.get());
            }
          }
        }
        catch (Exception paramFromServiceMsg)
        {
          for (;;)
          {
            paramFromServiceMsg.printStackTrace();
          }
        }
      }
      l1 = 0L;
    }
  }
  
  /* Error */
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    // Byte code:
    //   0: aload_1
    //   1: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   4: ldc_w 950
    //   7: invokevirtual 954	android/os/Bundle:getInt	(Ljava/lang/String;)I
    //   10: istore 4
    //   12: new 132	java/util/HashMap
    //   15: dup
    //   16: iconst_1
    //   17: invokespecial 931	java/util/HashMap:<init>	(I)V
    //   20: astore 14
    //   22: aload 14
    //   24: ldc_w 933
    //   27: aload_1
    //   28: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   31: ldc_w 935
    //   34: invokevirtual 938	android/os/Bundle:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   37: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   40: pop
    //   41: aload 14
    //   43: ldc_w 944
    //   46: aload_1
    //   47: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   50: ldc_w 946
    //   53: invokevirtual 627	android/os/Bundle:getLong	(Ljava/lang/String;)J
    //   56: invokestatic 515	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   59: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   62: pop
    //   63: aload 14
    //   65: ldc_w 948
    //   68: iload 4
    //   70: invokestatic 121	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   73: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   76: pop
    //   77: new 1363	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp
    //   80: dup
    //   81: invokespecial 1364	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp:<init>	()V
    //   84: astore 13
    //   86: aload 13
    //   88: aload_3
    //   89: checkcast 668	[B
    //   92: checkcast 668	[B
    //   95: invokevirtual 1365	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   98: checkcast 1363	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp
    //   101: astore 13
    //   103: aload 13
    //   105: ifnull +67 -> 172
    //   108: new 1367	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody
    //   111: dup
    //   112: invokespecial 1368	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody:<init>	()V
    //   115: astore_3
    //   116: aload 13
    //   118: getfield 1371	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp:serialize_rspbody	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   121: invokevirtual 435	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   124: ifeq +139 -> 263
    //   127: aload_3
    //   128: aload 13
    //   130: getfield 1371	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp:serialize_rspbody	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   133: invokevirtual 441	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   136: invokevirtual 447	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   139: invokevirtual 1372	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   142: checkcast 1367	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody
    //   145: astore_3
    //   146: aload_3
    //   147: ifnonnull +121 -> 268
    //   150: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   153: ifeq +12 -> 165
    //   156: ldc 8
    //   158: iconst_2
    //   159: ldc_w 1374
    //   162: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   165: aload_0
    //   166: aload_1
    //   167: aload_2
    //   168: iconst_0
    //   169: invokespecial 1376	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(Lcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;Z)V
    //   172: return
    //   173: astore_3
    //   174: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   177: ifeq +13 -> 190
    //   180: ldc 8
    //   182: iconst_2
    //   183: ldc_w 1378
    //   186: aload_3
    //   187: invokestatic 391	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   190: aconst_null
    //   191: astore 13
    //   193: goto -90 -> 103
    //   196: astore_3
    //   197: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   200: ifeq +13 -> 213
    //   203: ldc 8
    //   205: iconst_2
    //   206: ldc_w 1380
    //   209: aload_3
    //   210: invokestatic 391	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   213: aconst_null
    //   214: astore 13
    //   216: goto -113 -> 103
    //   219: astore_3
    //   220: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   223: ifeq +13 -> 236
    //   226: ldc 8
    //   228: iconst_2
    //   229: ldc_w 1382
    //   232: aload_3
    //   233: invokestatic 391	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   236: aconst_null
    //   237: astore_3
    //   238: goto -92 -> 146
    //   241: astore_3
    //   242: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   245: ifeq +13 -> 258
    //   248: ldc 8
    //   250: iconst_2
    //   251: ldc_w 1384
    //   254: aload_3
    //   255: invokestatic 391	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   258: aconst_null
    //   259: astore_3
    //   260: goto -114 -> 146
    //   263: aconst_null
    //   264: astore_3
    //   265: goto -119 -> 146
    //   268: aload_3
    //   269: getfield 1386	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody:result	Lcom/tencent/mobileqq/pb/PBEnumField;
    //   272: invokevirtual 737	com/tencent/mobileqq/pb/PBEnumField:get	()I
    //   275: istore 5
    //   277: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   280: ifeq +41 -> 321
    //   283: ldc 8
    //   285: iconst_2
    //   286: new 129	java/lang/StringBuilder
    //   289: dup
    //   290: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   293: ldc_w 1388
    //   296: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   299: iload 5
    //   301: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   304: ldc_w 1390
    //   307: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   310: iload 4
    //   312: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   315: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   318: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   321: iload 5
    //   323: ifeq +9 -> 332
    //   326: iload 5
    //   328: iconst_1
    //   329: if_icmpne +699 -> 1028
    //   332: aload 13
    //   334: getfield 1391	msf/msgsvc/msg_svc$PbSearchRoamMsgInCloudResp:msg	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   337: invokevirtual 107	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   340: astore 15
    //   342: aload 15
    //   344: ifnonnull +19 -> 363
    //   347: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   350: ifeq -178 -> 172
    //   353: ldc 8
    //   355: iconst_2
    //   356: ldc_w 1393
    //   359: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   362: return
    //   363: new 82	java/util/ArrayList
    //   366: dup
    //   367: invokespecial 83	java/util/ArrayList:<init>	()V
    //   370: astore 16
    //   372: aload_0
    //   373: aload 15
    //   375: aload 16
    //   377: invokespecial 127	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(Ljava/util/List;Ljava/util/List;)V
    //   380: aload_0
    //   381: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   384: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   387: invokestatic 141	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   390: lstore 10
    //   392: new 135	com/tencent/mobileqq/service/message/DecodeProtoPkgContext
    //   395: dup
    //   396: lload 10
    //   398: lconst_0
    //   399: iconst_1
    //   400: iconst_1
    //   401: iconst_0
    //   402: iconst_0
    //   403: invokespecial 144	com/tencent/mobileqq/service/message/DecodeProtoPkgContext:<init>	(JJZZZZ)V
    //   406: astore 17
    //   408: aload 17
    //   410: iconst_1
    //   411: putfield 259	com/tencent/mobileqq/service/message/DecodeProtoPkgContext:h	Z
    //   414: new 82	java/util/ArrayList
    //   417: dup
    //   418: invokespecial 83	java/util/ArrayList:<init>	()V
    //   421: astore 13
    //   423: aload 16
    //   425: invokevirtual 280	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   428: astore 18
    //   430: aload 18
    //   432: invokeinterface 285 1 0
    //   437: ifeq +253 -> 690
    //   440: aload 18
    //   442: invokeinterface 289 1 0
    //   447: checkcast 157	msf/msgcomm/msg_comm$Msg
    //   450: astore_2
    //   451: aload_2
    //   452: ifnull +23 -> 475
    //   455: aload_2
    //   456: getfield 161	msf/msgcomm/msg_comm$Msg:msg_head	Lmsf/msgcomm/msg_comm$MsgHead;
    //   459: invokevirtual 177	msf/msgcomm/msg_comm$MsgHead:has	()Z
    //   462: ifeq +13 -> 475
    //   465: aload_2
    //   466: getfield 170	msf/msgcomm/msg_comm$Msg:msg_body	Ltencent/im/msg/im_msg_body$MsgBody;
    //   469: invokevirtual 428	tencent/im/msg/im_msg_body$MsgBody:has	()Z
    //   472: ifne +113 -> 585
    //   475: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   478: ifeq -48 -> 430
    //   481: new 129	java/lang/StringBuilder
    //   484: dup
    //   485: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   488: ldc_w 1395
    //   491: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   494: astore 19
    //   496: aload_2
    //   497: ifnonnull +45 -> 542
    //   500: ldc_w 1397
    //   503: astore_2
    //   504: ldc 8
    //   506: iconst_2
    //   507: aload 19
    //   509: aload_2
    //   510: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   513: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   516: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   519: goto -89 -> 430
    //   522: astore_2
    //   523: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   526: ifeq -96 -> 430
    //   529: ldc 8
    //   531: iconst_2
    //   532: ldc_w 1399
    //   535: aload_2
    //   536: invokestatic 391	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   539: goto -109 -> 430
    //   542: new 129	java/lang/StringBuilder
    //   545: dup
    //   546: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   549: ldc_w 1401
    //   552: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   555: aload_2
    //   556: getfield 161	msf/msgcomm/msg_comm$Msg:msg_head	Lmsf/msgcomm/msg_comm$MsgHead;
    //   559: invokevirtual 418	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   562: ldc_w 1403
    //   565: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   568: aload_2
    //   569: getfield 170	msf/msgcomm/msg_comm$Msg:msg_body	Ltencent/im/msg/im_msg_body$MsgBody;
    //   572: invokevirtual 428	tencent/im/msg/im_msg_body$MsgBody:has	()Z
    //   575: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   578: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   581: astore_2
    //   582: goto -78 -> 504
    //   585: aload_2
    //   586: getfield 161	msf/msgcomm/msg_comm$Msg:msg_head	Lmsf/msgcomm/msg_comm$MsgHead;
    //   589: invokevirtual 166	msf/msgcomm/msg_comm$MsgHead:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   592: checkcast 163	msf/msgcomm/msg_comm$MsgHead
    //   595: astore 19
    //   597: aload 19
    //   599: getfield 204	msf/msgcomm/msg_comm$MsgHead:to_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   602: invokevirtual 208	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   605: lstore 6
    //   607: aload 19
    //   609: getfield 211	msf/msgcomm/msg_comm$MsgHead:from_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   612: invokevirtual 208	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   615: lstore 8
    //   617: lload 6
    //   619: lload 10
    //   621: lcmp
    //   622: ifeq +414 -> 1036
    //   625: lload 8
    //   627: lload 10
    //   629: lcmp
    //   630: ifeq +406 -> 1036
    //   633: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   636: ifeq -206 -> 430
    //   639: ldc 8
    //   641: iconst_2
    //   642: ldc_w 1405
    //   645: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   648: goto -218 -> 430
    //   651: aload 17
    //   653: lload 6
    //   655: putfield 257	com/tencent/mobileqq/service/message/DecodeProtoPkgContext:jdField_e_of_type_Long	J
    //   658: aload_0
    //   659: aload_2
    //   660: aload 17
    //   662: invokevirtual 262	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(Lmsf/msgcomm/msg_comm$Msg;Lcom/tencent/mobileqq/service/message/PBDecodeContext;)Ljava/util/ArrayList;
    //   665: astore_2
    //   666: aload_2
    //   667: ifnull -237 -> 430
    //   670: aload_2
    //   671: invokevirtual 1249	java/util/ArrayList:isEmpty	()Z
    //   674: ifne -244 -> 430
    //   677: aload 13
    //   679: aload_2
    //   680: invokevirtual 1248	java/util/ArrayList:addAll	(Ljava/util/Collection;)Z
    //   683: pop
    //   684: goto -254 -> 430
    //   687: goto -36 -> 651
    //   690: aload 13
    //   692: invokevirtual 152	java/util/ArrayList:size	()I
    //   695: ifle +16 -> 711
    //   698: aload 13
    //   700: new 1407	njo
    //   703: dup
    //   704: aload_0
    //   705: invokespecial 1408	njo:<init>	(Lcom/tencent/mobileqq/app/message/C2CMessageProcessor;)V
    //   708: invokestatic 799	java/util/Collections:sort	(Ljava/util/List;Ljava/util/Comparator;)V
    //   711: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   714: ifeq +63 -> 777
    //   717: ldc 8
    //   719: iconst_2
    //   720: new 129	java/lang/StringBuilder
    //   723: dup
    //   724: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   727: ldc_w 1410
    //   730: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   733: aload 15
    //   735: invokeinterface 113 1 0
    //   740: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   743: ldc_w 1412
    //   746: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   749: aload 16
    //   751: invokevirtual 152	java/util/ArrayList:size	()I
    //   754: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   757: ldc_w 1414
    //   760: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   763: aload 13
    //   765: invokevirtual 152	java/util/ArrayList:size	()I
    //   768: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   771: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   774: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   777: aload_3
    //   778: getfield 1417	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody:friends	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   781: invokevirtual 1418	com/tencent/mobileqq/pb/PBRepeatMessageField:has	()Z
    //   784: ifeq +124 -> 908
    //   787: aload_3
    //   788: getfield 1417	tencent/im/oidb/searcher/oidb_c2c_searcher$RspBody:friends	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   791: invokevirtual 107	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   794: astore_2
    //   795: aload_2
    //   796: ifnull +117 -> 913
    //   799: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   802: ifeq +34 -> 836
    //   805: ldc 8
    //   807: iconst_2
    //   808: new 129	java/lang/StringBuilder
    //   811: dup
    //   812: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   815: ldc_w 1420
    //   818: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   821: aload_2
    //   822: invokeinterface 113 1 0
    //   827: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   830: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   833: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   836: aload 13
    //   838: invokevirtual 152	java/util/ArrayList:size	()I
    //   841: ifne +126 -> 967
    //   844: iload 5
    //   846: iconst_1
    //   847: if_icmpeq +120 -> 967
    //   850: aload_1
    //   851: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   854: ldc_w 956
    //   857: invokevirtual 954	android/os/Bundle:getInt	(Ljava/lang/String;)I
    //   860: istore 5
    //   862: iload 5
    //   864: iconst_4
    //   865: if_icmpge +66 -> 931
    //   868: aload_0
    //   869: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   872: invokevirtual 963	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/MessageHandler;
    //   875: iload 4
    //   877: aconst_null
    //   878: aload_1
    //   879: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   882: ldc_w 935
    //   885: invokevirtual 938	android/os/Bundle:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   888: aload_1
    //   889: getfield 622	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   892: ldc_w 946
    //   895: invokevirtual 627	android/os/Bundle:getLong	(Ljava/lang/String;)J
    //   898: aload_2
    //   899: iload 5
    //   901: iconst_1
    //   902: iadd
    //   903: lconst_0
    //   904: invokevirtual 1423	com/tencent/mobileqq/app/MessageHandler:a	(ILjava/util/List;Ljava/lang/String;JLjava/util/List;IJ)V
    //   907: return
    //   908: aconst_null
    //   909: astore_2
    //   910: goto -115 -> 795
    //   913: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   916: ifeq -80 -> 836
    //   919: ldc 8
    //   921: iconst_2
    //   922: ldc_w 1425
    //   925: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   928: goto -92 -> 836
    //   931: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   934: ifeq +12 -> 946
    //   937: ldc 8
    //   939: iconst_2
    //   940: ldc_w 1427
    //   943: invokestatic 960	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   946: aload 14
    //   948: ldc_w 1429
    //   951: aload_2
    //   952: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   955: pop
    //   956: aload_0
    //   957: sipush 8015
    //   960: iconst_0
    //   961: aload 14
    //   963: invokevirtual 642	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(IZLjava/lang/Object;)V
    //   966: return
    //   967: aload 14
    //   969: ldc_w 1429
    //   972: aload_2
    //   973: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   976: pop
    //   977: aload 14
    //   979: ldc_w 1431
    //   982: aload 13
    //   984: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   987: pop
    //   988: iload 5
    //   990: iconst_1
    //   991: if_icmpne +31 -> 1022
    //   994: iconst_1
    //   995: istore 12
    //   997: aload 14
    //   999: ldc_w 1433
    //   1002: iload 12
    //   1004: invokestatic 723	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   1007: invokevirtual 942	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   1010: pop
    //   1011: aload_0
    //   1012: sipush 8015
    //   1015: iconst_1
    //   1016: aload 14
    //   1018: invokevirtual 642	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(IZLjava/lang/Object;)V
    //   1021: return
    //   1022: iconst_0
    //   1023: istore 12
    //   1025: goto -28 -> 997
    //   1028: aload_0
    //   1029: aload_1
    //   1030: aload_2
    //   1031: iconst_0
    //   1032: invokespecial 1376	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(Lcom/tencent/qphone/base/remote/ToServiceMsg;Lcom/tencent/qphone/base/remote/FromServiceMsg;Z)V
    //   1035: return
    //   1036: lload 6
    //   1038: lload 10
    //   1040: lcmp
    //   1041: ifne -354 -> 687
    //   1044: lload 8
    //   1046: lstore 6
    //   1048: goto -397 -> 651
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1051	0	this	C2CMessageProcessor
    //   0	1051	1	paramToServiceMsg	ToServiceMsg
    //   0	1051	2	paramFromServiceMsg	FromServiceMsg
    //   0	1051	3	paramObject	Object
    //   10	866	4	i1	int
    //   275	717	5	i2	int
    //   605	442	6	l1	long
    //   615	430	8	l2	long
    //   390	649	10	l3	long
    //   995	29	12	bool	boolean
    //   84	899	13	localObject1	Object
    //   20	997	14	localHashMap	HashMap
    //   340	394	15	localList	List
    //   370	380	16	localArrayList	ArrayList
    //   406	255	17	localDecodeProtoPkgContext	DecodeProtoPkgContext
    //   428	13	18	localIterator	Iterator
    //   494	114	19	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   86	103	173	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   86	103	196	java/lang/OutOfMemoryError
    //   127	146	219	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   127	146	241	java/lang/OutOfMemoryError
    //   455	475	522	java/lang/Exception
    //   475	496	522	java/lang/Exception
    //   504	519	522	java/lang/Exception
    //   542	582	522	java/lang/Exception
    //   585	617	522	java/lang/Exception
    //   633	648	522	java/lang/Exception
    //   651	666	522	java/lang/Exception
    //   670	684	522	java/lang/Exception
  }
  
  protected String a(msg_comm.Msg paramMsg)
  {
    long l1 = msg_head.get()).msg_uid.get();
    long l2 = msg_head.get()).msg_seq.get();
    return 64 + "key_uid_" + l1 + "_seq_" + l2;
  }
  
  public ArrayList a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    if (!(paramPBDecodeContext instanceof DecodeProtoPkgContext)) {
      return new ArrayList();
    }
    Object localObject1 = (DecodeProtoPkgContext)paramPBDecodeContext;
    long l4 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    if ((paramMsg == null) || (!msg_head.has()) || (!msg_body.has()))
    {
      if (QLog.isColorLevel())
      {
        paramPBDecodeContext = new StringBuilder().append("decodeSinglePBMsg_C2C return : ");
        if (paramMsg != null) {
          break label104;
        }
      }
      label104:
      for (paramMsg = " msg=null";; paramMsg = " msg.msg_head:" + msg_head + " msg.msg_body:" + msg_body.has())
      {
        QLog.d("Q.msg.C2CMessageProcessor", 2, paramMsg);
        return localArrayList;
      }
    }
    msg_comm.MsgHead localMsgHead = (msg_comm.MsgHead)msg_head.get();
    int i7 = (short)msg_seq.get();
    long l2 = to_uin.get();
    long l5 = from_uin.get();
    long l3 = msg_time.get();
    long l6 = msg_uid.get();
    int i2 = msg_type.get();
    int i1 = msg_head.c2c_cmd.get();
    int i5;
    int i4;
    int i3;
    if (content_head.has())
    {
      paramPBDecodeContext = (msg_comm.ContentHead)content_head.get();
      i5 = div_seq.get();
      i4 = pkg_num.get();
      i3 = pkg_index.get();
    }
    for (;;)
    {
      long l1 = -1L;
      paramPBDecodeContext = null;
      int i6;
      label409:
      Object localObject2;
      Object localObject3;
      if (!jdField_d_of_type_Boolean)
      {
        paramPBDecodeContext = MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, String.valueOf(jdField_e_of_type_Long), String.valueOf(l5));
        if (((Long)first).longValue() != 4294967295L) {
          l1 = ((Long)first).longValue();
        }
      }
      else
      {
        jdField_b_of_type_Long = l5;
        jdField_c_of_type_Long = l3;
        i6 = MessageProtoCodec.a(paramMsg);
        jdField_a_of_type_Int = i6;
        jdField_d_of_type_Long = SVIPHandler.a((int)l1, i6);
        if (l5 != jdField_a_of_type_Long) {
          break label1061;
        }
        jdField_a_of_type_Boolean = true;
        f = true;
        if (QLog.isColorLevel())
        {
          localObject2 = new StringBuilder();
          localObject3 = ((StringBuilder)localObject2).append("<---decodeSinglePBMsg_C2C : decode msg: msgTime:").append(l3).append(" shortSeq:").append(i7).append(" uint32Seq:").append(msg_seq.get()).append(" msgUid:").append(l6).append(" toUin:").append(l2).append(" senderUin:").append(l5).append(" friendUin:").append(jdField_e_of_type_Long).append(" isReaded:").append(jdField_a_of_type_Boolean).append(" isSyncFromOtherTerm:").append(f).append(" msgType:").append(i2).append(" C2CCmd:").append(i1).append(" hasTemp:").append(c2c_tmp_msg_head.has()).append(" hasShare:").append(appshare_info.has()).append(" pkgID:");
          if (paramPBDecodeContext != null) {
            break label1070;
          }
          paramPBDecodeContext = "nullPair";
          label610:
          ((StringBuilder)localObject3).append(paramPBDecodeContext).append(" longMsgID:").append(i5).append(" longMsgCount:").append(i4).append(" longMsgIndex:").append(i3).append("init_direction_flag").append(0);
          QLog.d("Q.msg.C2CMessageProcessor", 2, ((StringBuilder)localObject2).toString());
        }
        paramPBDecodeContext = new ArrayList();
        if ((i2 != 140) && (i2 != 141) && ((i2 != 529) || (c2c_cmd.get() != 6))) {
          break label1136;
        }
        i2 = 1;
        localObject2 = MessageProtoCodec.a(paramMsg);
        if (b != -1) {
          break label1081;
        }
        i1 = 0;
        label736:
        if (i1 == 0) {
          break label1133;
        }
        i2 = b;
        i1 = jdField_c_of_type_Int;
        MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramPBDecodeContext, paramMsg, (TempSessionInfo)localObject2, (DecodeProtoPkgContext)localObject1);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.C2CMessageProcessor", 2, "friendType:" + i2 + ", direction_flag:" + i1);
        }
      }
      for (;;)
      {
        if ((paramPBDecodeContext.size() == 0) && (i4 > 1))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.C2CMessageProcessor", 2, "<---decodeSinglePBMsg_C2C, empty long msg fragment");
          }
          localObject2 = (MessageForText)MessageRecordFactory.a(64536);
          msgtype = 64536;
          msg = "";
          paramPBDecodeContext.add(localObject2);
        }
        l1 = -1L;
        l2 = l1;
        for (;;)
        {
          try
          {
            localObject2 = msg_body.get()).rich_text.get()).elems.get();
            l3 = l1;
            if (localObject2 == null) {
              continue;
            }
            l3 = l1;
            l2 = l1;
            if (((List)localObject2).size() <= 0) {
              continue;
            }
            i6 = 0;
            l3 = l1;
            l2 = l1;
            if (i6 >= ((List)localObject2).size()) {
              continue;
            }
            l2 = l1;
            localObject3 = (im_msg_body.Elem)((List)localObject2).get(i6);
            l2 = l1;
            if (!elem_flags2.has()) {
              continue;
            }
            l2 = l1;
            if (!elem_flags2.get()).uint64_msg_id.has()) {
              continue;
            }
            l2 = l1;
            l1 = elem_flags2.get()).uint64_msg_id.get();
          }
          catch (Throwable localThrowable1)
          {
            boolean bool2;
            boolean bool3;
            boolean bool1;
            Object localObject4;
            QLog.e("Q.msg.C2CMessageProcessor", 2, "<---decodeSinglePBMsg_C2C: ", localThrowable1);
            l1 = l2;
            continue;
            MsgProxyUtils.a(localThrowable1, false);
            continue;
            if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(rUin)) {
              continue;
            }
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80060B0", "0X80060B0", 0, 0, "", "", "", "");
            continue;
            if (!f) {
              continue;
            }
            issend = 2;
            isread = true;
            vipBubbleID = jdField_d_of_type_Long;
            vipBubbleDiyTextId = jdField_a_of_type_Int;
            if ((istroop != 1008) || (!(localThrowable1 instanceof MessageForStructing)) || (!"true".equalsIgnoreCase(localThrowable1.getExtInfoFromExtStr("dynamic_msg")))) {
              continue;
            }
            if (!msg_head.from_uin.has()) {
              continue;
            }
            l2 = msg_head.from_uin.get();
            if (!DynamicMsgInfoManager.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, (MessageForStructing)localThrowable1, String.valueOf(l2))) {
              continue;
            }
            if (istroop != 1008) {
              continue;
            }
            try
            {
              if (public_account_group_send_flag.has()) {
                localThrowable1.saveExtInfoToExtStr("public_account_send_flag", String.valueOf(public_account_group_send_flag.get()));
              }
              if (l1 != -1L) {
                localThrowable1.saveExtInfoToExtStr("public_account_msg_id", String.valueOf(l1));
              }
              if ((localThrowable1 instanceof MessageForStructing))
              {
                localObject3 = (MessageForStructing)localThrowable1;
                if ((structingMsg != null) && (structingMsg.mMsgServiceID == 500))
                {
                  if (!ReadInJoyUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
                    continue;
                  }
                  time = NetConnInfoCenter.getServerTime();
                }
              }
              localArrayList.add(localThrowable1);
              continue;
              if (msgtype == 63499) {
                continue;
              }
              isread = jdField_a_of_type_Boolean;
              continue;
              l2 = 0L;
            }
            catch (Throwable localThrowable2)
            {
              QLog.e("Q.msg.C2CMessageProcessor", 2, "<---decodeMessage: ", localThrowable2);
              continue;
              ReadInJoyUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localThrowable2);
            }
            continue;
            paramPBDecodeContext = localArrayList.iterator();
            if (!paramPBDecodeContext.hasNext()) {
              continue;
            }
            localObject1 = (MessageRecord)paramPBDecodeContext.next();
            if ((localObject1 == null) || (!(localObject1 instanceof MessageForBitApp))) {
              continue;
            }
            i1 = 1;
            if (i1 == 0) {
              continue;
            }
            ((BitAppManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(143)).a(localArrayList);
            if (i2 != 1008) {
              continue;
            }
            ((LifeOnlineAccountInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(86)).a(localArrayList, paramMsg);
            if (!msg_body.has()) {
              continue;
            }
            paramMsg = (im_msg_body.MsgBody)msg_body.get();
            if (!rich_text.has()) {
              continue;
            }
            paramMsg = (im_msg_body.RichText)rich_text.get();
            if (!elems.has()) {
              continue;
            }
            paramMsg = elems.get().iterator();
            if (!paramMsg.hasNext()) {
              continue;
            }
            paramPBDecodeContext = (im_msg_body.Elem)paramMsg.next();
            if (!pub_acc_info.has()) {
              continue;
            }
            i1 = pub_acc_info.uint32_is_inter_num.get();
            paramMsg = pub_acc_info.string_msg_template_id.get();
            if (i1 != 1) {
              continue;
            }
            paramPBDecodeContext = localArrayList.iterator();
            if (!paramPBDecodeContext.hasNext()) {
              continue;
            }
            ((MessageRecord)paramPBDecodeContext.next()).saveExtInfoToExtStr("inter_num", "1");
            continue;
            paramPBDecodeContext = localArrayList.iterator();
            if (!paramPBDecodeContext.hasNext()) {
              continue;
            }
            ((MessageRecord)paramPBDecodeContext.next()).saveExtInfoToExtStr("msg_template_id", paramMsg);
            continue;
            MsgAutoMonitorUtil.a().f(System.currentTimeMillis() - l4);
            return localArrayList;
            i1 = 0;
            continue;
            continue;
            i1 = 0;
            continue;
          }
          i6 += 1;
        }
        l1 = ((Long)second).longValue();
        break;
        label1061:
        f = false;
        break label409;
        label1070:
        paramPBDecodeContext = (Serializable)first;
        break label610;
        label1081:
        if ((b != 1000) && (b != 1020))
        {
          i1 = i2;
          if (b != 1004) {
            break label736;
          }
        }
        jdField_b_of_type_Long = jdField_c_of_type_Long;
        i1 = i2;
        break label736;
        label1133:
        return localArrayList;
        label1136:
        if (appshare_info.has())
        {
          MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramPBDecodeContext, paramMsg, 0L, 0L, jdField_d_of_type_Boolean);
          i2 = 0;
          i1 = 0;
        }
        else
        {
          if ((MessageUtils.c(i2)) && (c2c_cmd.has())) {}
          switch (i1)
          {
          default: 
            i2 = 0;
            i1 = 0;
            break;
          case 169: 
          case 241: 
          case 242: 
          case 243: 
            MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramPBDecodeContext, i1, paramMsg, jdField_e_of_type_Long, jdField_a_of_type_Boolean, jdField_b_of_type_Boolean, f, jdField_d_of_type_Long, jdField_d_of_type_Boolean, jdField_a_of_type_Int);
            i2 = 0;
            i1 = 0;
            break;
          case 11: 
          case 175: 
            MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramPBDecodeContext, paramMsg, jdField_e_of_type_Long, jdField_b_of_type_Boolean, jdField_a_of_type_Boolean, jdField_d_of_type_Boolean);
            i2 = 0;
            i1 = 0;
            break;
          case 193: 
            i2 = 0;
            i1 = 0;
            break;
          case 129: 
          case 131: 
          case 133: 
            MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, jdField_e_of_type_Long, jdField_a_of_type_Boolean, jdField_b_of_type_Boolean, jdField_d_of_type_Long, jdField_a_of_type_Int);
            i2 = 0;
            i1 = 0;
            continue;
            if (i2 == 208)
            {
              MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramPBDecodeContext, paramMsg);
              i2 = 0;
              i1 = 0;
            }
            else
            {
              if (i2 == 193)
              {
                if (!jdField_d_of_type_Boolean)
                {
                  MessageProtoCodec.c(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, (DecodeProtoPkgContext)localObject1);
                  i2 = 0;
                  i1 = 0;
                }
              }
              else
              {
                if (i2 == 734)
                {
                  MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, (DecodeProtoPkgContext)localObject1);
                  i2 = 0;
                  i1 = 0;
                  continue;
                }
                if (i2 == 562)
                {
                  MessageProtoCodec.b(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, (DecodeProtoPkgContext)localObject1);
                  i2 = 0;
                  i1 = 0;
                  continue;
                }
                if (i2 == 519)
                {
                  if ((!jdField_d_of_type_Boolean) && (VideoConstants.jdField_a_of_type_Boolean))
                  {
                    MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, jdField_a_of_type_Boolean, f);
                    i2 = 0;
                    i1 = 0;
                  }
                }
                else
                {
                  if (SystemMsg.isSystemMessage(i2))
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("Q.systemmsg.", 2, "friend system msg notify");
                    }
                    i1 = 0;
                    if ((i2 == 188) || (i2 == 189)) {
                      i1 = 1;
                    }
                    if ((!jdField_c_of_type_Boolean) && (i1 == 0)) {
                      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().a(2);
                    }
                    jdField_e_of_type_Long = 9998L;
                    MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, jdField_a_of_type_Boolean, f, jdField_d_of_type_Boolean);
                    if (i1 != 0) {
                      SystemMsgController.a().b(l5, l3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                    }
                    for (;;)
                    {
                      return localArrayList;
                      paramMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
                      if (!MessageHandler.jdField_e_of_type_Boolean) {
                        SystemMsgController.a().a(l5, l3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                      } else {
                        FriendSystemMsgController.a().a(l5, l3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                      }
                    }
                  }
                  if (a(i2))
                  {
                    a(paramPBDecodeContext, paramMsg, jdField_d_of_type_Boolean);
                    i2 = 0;
                    i1 = 0;
                    continue;
                  }
                  if (732 == i2)
                  {
                    a(paramPBDecodeContext, paramMsg, i7, l5, l6, i2, jdField_d_of_type_Boolean);
                    i2 = 0;
                    i1 = 0;
                    continue;
                  }
                  if (524 == i2)
                  {
                    if ((paramPBDecodeContext == null) || (paramMsg == null) || (!msg_body.has()) || (!msg_body.msg_content.has())) {
                      return localArrayList;
                    }
                    localObject2 = msg_body.msg_content.get().toByteArray();
                    PkgTools.a((byte[])localObject2, 0);
                    if ((localObject2[4] == 25) && (!jdField_d_of_type_Boolean)) {
                      DiscMessageProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (byte[])localObject2, 5, null, false);
                    }
                    i2 = 0;
                    i1 = 0;
                    continue;
                  }
                  if (SystemMsg.isTroopSystemMessage(i2))
                  {
                    i1 = 0;
                    if ((i2 == 85) || (i2 == 36)) {
                      i1 = 1;
                    }
                    if ((!jdField_c_of_type_Boolean) && (i1 == 0)) {
                      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().a(3);
                    }
                    jdField_e_of_type_Long = 9998L;
                    MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, jdField_a_of_type_Boolean, f, jdField_d_of_type_Boolean);
                    if (i1 != 0) {
                      SystemMsgController.a().b(l5, l3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                    }
                    for (;;)
                    {
                      return localArrayList;
                      GroupSystemMsgController.a().a(l5, l3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                    }
                  }
                  if (i2 == 528)
                  {
                    if (!jdField_d_of_type_Boolean)
                    {
                      MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, jdField_a_of_type_Long, paramMsg, h, jdField_d_of_type_Boolean);
                      i2 = 0;
                      i1 = 0;
                    }
                  }
                  else
                  {
                    if (i2 == 529)
                    {
                      if (!msg_head.get()).c2c_tmp_msg_head.has()) {
                        break label3849;
                      }
                      i2 = 1;
                      localObject2 = MessageProtoCodec.a(paramMsg);
                      if (b == -1)
                      {
                        i1 = 0;
                        label2128:
                        if (i1 == 0) {
                          break label3849;
                        }
                        i1 = b;
                        MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramPBDecodeContext, paramMsg, (TempSessionInfo)localObject2, (DecodeProtoPkgContext)localObject1);
                        localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
                        l1 = jdField_e_of_type_Long;
                        bool2 = jdField_a_of_type_Boolean;
                        bool3 = jdField_b_of_type_Boolean;
                        if (l5 != jdField_a_of_type_Long) {
                          break label2286;
                        }
                      }
                      label2286:
                      for (bool1 = true;; bool1 = false)
                      {
                        MessageProtoCodec.a((MessageHandler)localObject2, paramPBDecodeContext, paramMsg, l1, bool2, bool3, bool1, jdField_d_of_type_Long, jdField_d_of_type_Boolean, jdField_a_of_type_Int);
                        i6 = 0;
                        i2 = i1;
                        i1 = i6;
                        break;
                        if ((b != 1000) && (b != 1020))
                        {
                          i1 = i2;
                          if (b != 1004) {
                            break label2128;
                          }
                        }
                        jdField_b_of_type_Long = jdField_c_of_type_Long;
                        i1 = i2;
                        break label2128;
                      }
                    }
                    if (i2 == 38)
                    {
                      localObject2 = String.valueOf(EndianUtil.a(msg_body.msg_content.get().toByteArray()));
                      localObject3 = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
                      if ((localObject3 != null) && (((TroopManager)localObject3).a((String)localObject2) == null))
                      {
                        localObject4 = new TroopInfo();
                        troopuin = ((String)localObject2);
                        dwAdditionalFlag = 1L;
                        ((TroopManager)localObject3).b((TroopInfo)localObject4);
                      }
                      localObject3 = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
                      if (localObject3 != null) {
                        ((TroopHandler)localObject3).a((String)localObject2, Boolean.valueOf(true));
                      }
                      MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, l5, i7, l6, i2);
                    }
                  }
                }
              }
              i2 = 0;
              i1 = 0;
            }
            break;
          }
        }
      }
      l1 = l3;
      paramPBDecodeContext = paramPBDecodeContext.iterator();
      for (;;)
      {
        if (!paramPBDecodeContext.hasNext()) {
          break label3546;
        }
        localObject2 = (MessageRecord)paramPBDecodeContext.next();
        if ((localObject2 != null) && ((jdField_b_of_type_Long != 3338705755L) || (!PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))) && ((jdField_b_of_type_Long != 2171946401L) || (!ReadInJoyUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface))))
        {
          if (jdField_b_of_type_Long == 2171946401L) {
            PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
          }
          selfuin = String.valueOf(jdField_a_of_type_Long);
          frienduin = String.valueOf(jdField_e_of_type_Long);
          senderuin = String.valueOf(jdField_b_of_type_Long);
          time = jdField_c_of_type_Long;
          shmsgseq = i7;
          msgUid = l6;
          istroop = i2;
          longMsgId = i5;
          longMsgCount = i4;
          longMsgIndex = i3;
          if ((1 != i1) || (!MsgProxyUtils.s(istroop)) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(frienduin)) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, MsgProxyUtils.a(istroop), MsgProxyUtils.a(MsgProxyUtils.a(istroop))))) {
            break;
          }
          MsgProxyUtils.a((MessageRecord)localObject2, true);
          if ((MsgProxyUtils.s(i2)) && ((localObject2 instanceof MessageForStructing)))
          {
            i6 = GiftMessageUtils.a((MessageRecord)localObject2, 1);
            if (i6 > 0) {
              ((MessageRecord)localObject2).saveExtInfoToExtStr("nearby_gift_msg", "1|" + String.valueOf(i6));
            }
            localObject4 = (MessageForStructing)localObject2;
            if (structingMsg.mMsgServiceID == 52)
            {
              localObject3 = (NearbyFlowerManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(123);
              if (localObject3 != null)
              {
                localObject4 = new NearbyFlowerMessage(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageForStructing)localObject4);
                ((NearbyFlowerManager)localObject3).a((NearbyFlowerMessage)localObject4, false);
                if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.f().equals(sUin)) {
                  break label3181;
                }
                ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80060AF", "0X80060AF", 0, 0, "", "", "", "");
              }
            }
          }
          localObject3 = (msg_comm.C2CTmpMsgHead)c2c_tmp_msg_head.get();
          if ((localObject3 != null) && (lock_display.has()) && (lock_display.get() == 1))
          {
            extLong |= 0x1;
            ((MessageRecord)localObject2).saveExtInfoToExtStr("lockDisplay", "true");
          }
          if ((i2 == 0) && ((localObject2 instanceof MessageForPic))) {
            bEnableEnc = true;
          }
          if (i2 != 1006) {
            break label3238;
          }
          if (from_nick.has()) {
            ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).a(String.valueOf(jdField_e_of_type_Long), (short)0, from_nick.get(), "");
          }
          frienduin = ContactUtils.g(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, String.valueOf(jdField_e_of_type_Long));
          senderuin = ContactUtils.g(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, String.valueOf(l5));
          if ((TextUtils.isEmpty(frienduin)) && (jdField_d_of_type_Boolean)) {
            frienduin = String.valueOf(jdField_e_of_type_Long);
          }
          if (frienduin != null) {
            break label3238;
          }
          QLog.e("Q.msg.C2CMessageProcessor", 1, String.format("decodeMessage error, getPhoneNumByUin is null, friendUin: %d senderUin: %d uinType: %d msgType: %d", new Object[] { Long.valueOf(jdField_e_of_type_Long), Long.valueOf(l5), Integer.valueOf(istroop), Integer.valueOf(msgtype) }));
        }
      }
      label3181:
      label3238:
      label3546:
      label3849:
      i3 = 0;
      i4 = 0;
      i5 = 0;
    }
  }
  
  public void a(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 2001: 
      b(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    a(paramToServiceMsg, paramFromServiceMsg, false);
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.C2CMessageProcessor", 2, "processType" + paramInt);
    }
    switch (paramInt)
    {
    default: 
      return;
    case 1002: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 2001: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        b((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 2005: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        d((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 1003: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        c((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length == 3))
    {
      a((msg_comm.Msg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], (msg_onlinepush.PbPushMsg)paramVarArgs[2]);
      return;
    }
    a(getClass().getName(), paramInt);
  }
  
  public void a(MessageForPtt paramMessageForPtt1, MessageForPtt paramMessageForPtt2)
  {
    if ((paramMessageForPtt1.getPttStreamFlag() == 10001) && (!TextUtils.isEmpty(directUrl)) && (TextUtils.isEmpty(directUrl))) {}
    for (;;)
    {
      try
      {
        directUrl = directUrl;
        paramMessageForPtt1.serial();
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
        bool = true;
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.C2CMessageProcessor", 2, "updateStreamPttDirectUrl : " + bool);
        }
        return;
      }
      catch (Exception paramMessageForPtt1)
      {
        paramMessageForPtt1.printStackTrace();
      }
      boolean bool = false;
    }
  }
  
  public void a(String paramString1, String paramString2, msg_comm.Msg paramMsg, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.C2CMessageProcessor", 2, "decodePreSendMsgPackage  presendShowTime : " + paramInt);
    }
    ArrayList localArrayList = new ArrayList();
    paramString1 = new DecodeProtoPkgContext(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin(), Long.parseLong(paramString1), false, false, false, false);
    msg_comm.MsgHead localMsgHead = (msg_comm.MsgHead)msg_head.get();
    if (paramInt > 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.C2CMessageProcessor", 2, "presendShowTime:" + paramInt);
      }
      msg_time.set(paramInt);
    }
    paramString1 = a(paramMsg, paramString1);
    if ((paramString1 != null) && (paramString1.size() > 0) && (get0istroop == 1008)) {
      paramString1 = ((LifeOnlineAccountInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(86)).a(paramString1);
    }
    for (;;)
    {
      paramString1 = paramString1.iterator();
      while (paramString1.hasNext())
      {
        paramMsg = (MessageRecord)paramString1.next();
        try
        {
          if (a(paramMsg, true)) {
            continue;
          }
          localArrayList.add(paramMsg);
        }
        catch (Exception paramMsg) {}
        if (QLog.isColorLevel()) {
          QLog.w("Q.msg.C2CMessageProcessor", 2, "decodeC2CMessage error,", paramMsg);
        }
      }
      boolean bool2;
      boolean bool3;
      if (localArrayList.size() > 0)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(localArrayList);
        bool2 = MessageHandlerUtils.a(localArrayList);
        bool3 = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localArrayList);
        paramInt = MsgProxyUtils.a(localArrayList, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        if ((!bool2) || (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop)) {
          break label359;
        }
      }
      label359:
      for (boolean bool1 = true;; bool1 = false)
      {
        paramString1.a(localArrayList, paramString2, bool1);
        a(localArrayList);
        a(localArrayList);
        a("handleGetBuddyMessageResp", true, paramInt, jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(bool2, bool3), false);
        return;
      }
    }
  }
  
  public void a(ArrayList paramArrayList)
  {
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
      if ((msgtype == 62530) || (msgtype == 60532))
      {
        PAMessage localPAMessage = XMLMessageUtils.a(localMessageRecord);
        if ((localPAMessage != null) && (mMsgId > 0L)) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", frienduin, "mp_msg_sys_15", "msg_get", 0, 1, 0, Long.toString(mMsgId), "", "", "");
        }
      }
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramArrayList);
  }
  
  public void a(ArrayList paramArrayList, msg_comm.Msg paramMsg, int paramInt1, long paramLong1, long paramLong2, int paramInt2, boolean paramBoolean)
  {
    if ((paramArrayList == null) || (paramMsg == null) || (!msg_body.has()) || (!msg_body.msg_content.has())) {}
    Object localObject;
    int i1;
    do
    {
      do
      {
        byte[] arrayOfByte1;
        do
        {
          do
          {
            return;
            arrayOfByte1 = msg_body.msg_content.get().toByteArray();
            localObject = new byte[arrayOfByte1.length];
            PkgTools.a((byte[])localObject, 0, arrayOfByte1, 0, localObject.length);
          } while (localObject.length < 5);
          i1 = localObject[4];
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.C2CMessageProcessor", 2, "<---hotchat and opentroop push  groupCode:" + PkgTools.a(arrayOfByte1, 0) + " subType:" + i1);
          }
          if ((i1 != 12) && (i1 != 14)) {
            break;
          }
        } while (!((TroopGagMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a((byte[])localObject, paramInt1));
        return;
        if ((i1 != 16) && (i1 != 17)) {
          break;
        }
        if (arrayOfByte1.length > 7)
        {
          localObject = (TroopTipsMsgMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(80);
          byte[] arrayOfByte2 = new byte[arrayOfByte1.length - 7];
          PkgTools.a(arrayOfByte2, 0, arrayOfByte1, 7, arrayOfByte2.length);
          paramArrayList.add(((TroopTipsMsgMgr)localObject).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, arrayOfByte2, paramInt1, msg_head.msg_time.get(), true, paramBoolean));
        }
        MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramLong1, paramInt1, paramLong2, paramInt2);
      } while (!QLog.isColorLevel());
      QLog.d("Q.msg.C2CMessageProcessor", 2, String.format("handle0x2dcMessage==>sendDelMsgReqToServer fromUin:%d, seq:%d, msgUid:%d, msgType:%d", new Object[] { Long.valueOf(paramLong1), Integer.valueOf(paramInt1), Long.valueOf(paramLong2), Integer.valueOf(paramInt2) }));
      return;
    } while (i1 != 3);
    a((byte[])localObject);
  }
  
  /* Error */
  public void a(ArrayList paramArrayList, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +10 -> 11
    //   4: aload_1
    //   5: invokevirtual 152	java/util/ArrayList:size	()I
    //   8: ifne +4 -> 12
    //   11: return
    //   12: invokestatic 2000	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   15: aload_0
    //   16: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   19: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   22: invokestatic 2005	com/tencent/mobileqq/activity/UserguideActivity:a	(Landroid/content/Context;Ljava/lang/String;)Z
    //   25: ifne -14 -> 11
    //   28: invokestatic 2000	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   31: invokevirtual 2009	com/tencent/common/app/BaseApplicationImpl:getApplicationContext	()Landroid/content/Context;
    //   34: aload_0
    //   35: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   38: invokestatic 2014	com/tencent/mobileqq/util/NoDisturbUtil:a	(Landroid/content/Context;Lcom/tencent/common/app/AppInterface;)Z
    //   41: ifeq -30 -> 11
    //   44: aload_1
    //   45: invokevirtual 280	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   48: astore 7
    //   50: aload 7
    //   52: invokeinterface 285 1 0
    //   57: ifeq +1576 -> 1633
    //   60: aload 7
    //   62: invokeinterface 289 1 0
    //   67: checkcast 264	com/tencent/mobileqq/data/MessageRecord
    //   70: astore 8
    //   72: aload 8
    //   74: getfield 267	com/tencent/mobileqq/data/MessageRecord:istroop	I
    //   77: invokestatic 1746	com/tencent/mobileqq/app/message/MsgProxyUtils:s	(I)Z
    //   80: ifeq -30 -> 50
    //   83: aload 8
    //   85: invokestatic 2016	com/tencent/mobileqq/app/message/MsgProxyUtils:c	(Lcom/tencent/mobileqq/data/MessageRecord;)Z
    //   88: ifeq -38 -> 50
    //   91: aload_0
    //   92: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   95: aload 8
    //   97: invokestatic 2019	com/tencent/mobileqq/app/message/MsgProxyUtils:b	(Lcom/tencent/mobileqq/app/QQAppInterface;Lcom/tencent/mobileqq/data/MessageRecord;)Z
    //   100: ifne -50 -> 50
    //   103: aload 8
    //   105: invokevirtual 2022	com/tencent/mobileqq/data/MessageRecord:isSend	()Z
    //   108: ifne -58 -> 50
    //   111: aload 8
    //   113: getfield 1070	com/tencent/mobileqq/data/MessageRecord:isread	Z
    //   116: ifne -66 -> 50
    //   119: iconst_1
    //   120: istore_3
    //   121: iload_3
    //   122: ifeq -111 -> 11
    //   125: aload_0
    //   126: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   129: bipush 50
    //   131: invokevirtual 271	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   134: checkcast 801	com/tencent/mobileqq/app/FriendsManager
    //   137: aload_0
    //   138: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   141: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   144: invokevirtual 2025	com/tencent/mobileqq/app/FriendsManager:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/data/Card;
    //   147: astore 7
    //   149: aload_0
    //   150: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   153: invokevirtual 354	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   156: astore 10
    //   158: aload 7
    //   160: ifnonnull +566 -> 726
    //   163: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   166: ifeq +1461 -> 1627
    //   169: ldc 8
    //   171: iconst_2
    //   172: ldc_w 2027
    //   175: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   178: iconst_1
    //   179: istore 4
    //   181: aload_0
    //   182: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   185: bipush 105
    //   187: invokevirtual 271	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   190: checkcast 2029	com/tencent/mobileqq/nearby/NearbyCardManager
    //   193: invokevirtual 2030	com/tencent/mobileqq/nearby/NearbyCardManager:a	()Z
    //   196: istore 6
    //   198: invokestatic 182	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   201: ifeq +42 -> 243
    //   204: ldc_w 2032
    //   207: iconst_2
    //   208: new 129	java/lang/StringBuilder
    //   211: dup
    //   212: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   215: ldc_w 2034
    //   218: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   221: iload 4
    //   223: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   226: ldc_w 2036
    //   229: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   232: iload 6
    //   234: invokevirtual 605	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   237: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   240: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   243: aload_0
    //   244: getfield 72	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_Boolean	Z
    //   247: ifne +293 -> 540
    //   250: invokestatic 2041	com/tencent/mobileqq/app/DeviceProfileManager:a	()Lcom/tencent/mobileqq/app/DeviceProfileManager;
    //   253: getstatic 2047	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:OneyWayDateMsgNotifyCfg	Lcom/tencent/mobileqq/app/DeviceProfileManager$DpcNames;
    //   256: invokevirtual 2050	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:name	()Ljava/lang/String;
    //   259: invokevirtual 2052	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Ljava/lang/String;
    //   262: astore 8
    //   264: invokestatic 2041	com/tencent/mobileqq/app/DeviceProfileManager:a	()Lcom/tencent/mobileqq/app/DeviceProfileManager;
    //   267: getstatic 2055	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:OneyWayLBSFriendMsgNotifyCfg	Lcom/tencent/mobileqq/app/DeviceProfileManager$DpcNames;
    //   270: invokevirtual 2050	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:name	()Ljava/lang/String;
    //   273: invokevirtual 2052	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Ljava/lang/String;
    //   276: astore 7
    //   278: aload 8
    //   280: ldc_w 2057
    //   283: invokevirtual 2061	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   286: astore 8
    //   288: aload 7
    //   290: ldc_w 2057
    //   293: invokevirtual 2061	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   296: astore 7
    //   298: aload 8
    //   300: arraylength
    //   301: bipush 6
    //   303: if_icmplt +232 -> 535
    //   306: aload 7
    //   308: arraylength
    //   309: bipush 6
    //   311: if_icmplt +224 -> 535
    //   314: aload_0
    //   315: aload 8
    //   317: iconst_0
    //   318: aaload
    //   319: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   322: putfield 48	com/tencent/mobileqq/app/message/C2CMessageProcessor:e	I
    //   325: aload_0
    //   326: aload 8
    //   328: iconst_1
    //   329: aaload
    //   330: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   333: putfield 50	com/tencent/mobileqq/app/message/C2CMessageProcessor:f	I
    //   336: aload_0
    //   337: aload 8
    //   339: iconst_2
    //   340: aaload
    //   341: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   344: putfield 52	com/tencent/mobileqq/app/message/C2CMessageProcessor:g	I
    //   347: aload_0
    //   348: aload 8
    //   350: iconst_3
    //   351: aaload
    //   352: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   355: putfield 54	com/tencent/mobileqq/app/message/C2CMessageProcessor:h	I
    //   358: aload_0
    //   359: aload 7
    //   361: iconst_0
    //   362: aaload
    //   363: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   366: putfield 60	com/tencent/mobileqq/app/message/C2CMessageProcessor:k	I
    //   369: aload_0
    //   370: aload 7
    //   372: iconst_1
    //   373: aaload
    //   374: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   377: putfield 62	com/tencent/mobileqq/app/message/C2CMessageProcessor:l	I
    //   380: aload_0
    //   381: aload 7
    //   383: iconst_2
    //   384: aaload
    //   385: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   388: putfield 64	com/tencent/mobileqq/app/message/C2CMessageProcessor:m	I
    //   391: aload_0
    //   392: aload 7
    //   394: iconst_3
    //   395: aaload
    //   396: invokestatic 2064	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   399: putfield 66	com/tencent/mobileqq/app/message/C2CMessageProcessor:n	I
    //   402: invokestatic 2067	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   405: ifeq +130 -> 535
    //   408: ldc_w 2069
    //   411: iconst_4
    //   412: new 129	java/lang/StringBuilder
    //   415: dup
    //   416: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   419: ldc_w 2071
    //   422: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   425: aload_0
    //   426: getfield 48	com/tencent/mobileqq/app/message/C2CMessageProcessor:e	I
    //   429: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   432: ldc_w 2073
    //   435: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   438: aload_0
    //   439: getfield 50	com/tencent/mobileqq/app/message/C2CMessageProcessor:f	I
    //   442: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   445: ldc_w 2073
    //   448: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   451: aload_0
    //   452: getfield 52	com/tencent/mobileqq/app/message/C2CMessageProcessor:g	I
    //   455: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   458: ldc_w 2073
    //   461: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   464: aload_0
    //   465: getfield 54	com/tencent/mobileqq/app/message/C2CMessageProcessor:h	I
    //   468: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   471: ldc_w 2075
    //   474: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   477: aload_0
    //   478: getfield 60	com/tencent/mobileqq/app/message/C2CMessageProcessor:k	I
    //   481: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   484: ldc_w 2073
    //   487: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   490: aload_0
    //   491: getfield 62	com/tencent/mobileqq/app/message/C2CMessageProcessor:l	I
    //   494: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   497: ldc_w 2073
    //   500: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   503: aload_0
    //   504: getfield 64	com/tencent/mobileqq/app/message/C2CMessageProcessor:m	I
    //   507: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   510: ldc_w 2073
    //   513: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   516: aload_0
    //   517: getfield 66	com/tencent/mobileqq/app/message/C2CMessageProcessor:n	I
    //   520: invokevirtual 191	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   523: ldc_w 2077
    //   526: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   529: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   532: invokestatic 200	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   535: aload_0
    //   536: iconst_1
    //   537: putfield 72	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_Boolean	Z
    //   540: invokestatic 2000	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   543: new 129	java/lang/StringBuilder
    //   546: dup
    //   547: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   550: aload_0
    //   551: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   554: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   557: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   560: ldc_w 2079
    //   563: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   566: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   569: iconst_0
    //   570: invokevirtual 2083	com/tencent/common/app/BaseApplicationImpl:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   573: astore 11
    //   575: ldc_w 377
    //   578: astore 8
    //   580: ldc_w 377
    //   583: astore 9
    //   585: aload 8
    //   587: astore 7
    //   589: aload_0
    //   590: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   593: ifnonnull +145 -> 738
    //   596: aload_0
    //   597: monitorenter
    //   598: aload 8
    //   600: astore 7
    //   602: aload_0
    //   603: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   606: ifnonnull +130 -> 736
    //   609: aload_0
    //   610: new 39	java/util/HashSet
    //   613: dup
    //   614: invokespecial 42	java/util/HashSet:<init>	()V
    //   617: putfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   620: aload 11
    //   622: new 129	java/lang/StringBuilder
    //   625: dup
    //   626: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   629: aload_0
    //   630: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   633: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   636: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   639: ldc_w 2085
    //   642: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   645: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   648: ldc_w 377
    //   651: invokeinterface 2090 3 0
    //   656: astore 8
    //   658: aload 8
    //   660: ldc_w 2057
    //   663: invokevirtual 2061	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   666: astore 12
    //   668: aload 12
    //   670: arraylength
    //   671: istore 5
    //   673: iconst_0
    //   674: istore_3
    //   675: aload 8
    //   677: astore 7
    //   679: iload_3
    //   680: iload 5
    //   682: if_icmpge +54 -> 736
    //   685: aload 12
    //   687: iload_3
    //   688: aaload
    //   689: astore 7
    //   691: aload 7
    //   693: invokevirtual 576	java/lang/String:length	()I
    //   696: ifle +23 -> 719
    //   699: aload 7
    //   701: invokestatic 141	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   704: lconst_0
    //   705: lcmp
    //   706: ifle +13 -> 719
    //   709: aload_0
    //   710: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   713: aload 7
    //   715: invokevirtual 2091	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   718: pop
    //   719: iload_3
    //   720: iconst_1
    //   721: iadd
    //   722: istore_3
    //   723: goto -48 -> 675
    //   726: aload 7
    //   728: getfield 2096	com/tencent/mobileqq/data/Card:shGender	S
    //   731: istore 4
    //   733: goto -552 -> 181
    //   736: aload_0
    //   737: monitorexit
    //   738: aload 9
    //   740: astore 8
    //   742: aload_0
    //   743: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   746: ifnonnull +140 -> 886
    //   749: aload_0
    //   750: monitorenter
    //   751: aload 9
    //   753: astore 8
    //   755: aload_0
    //   756: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   759: ifnonnull +125 -> 884
    //   762: aload_0
    //   763: new 39	java/util/HashSet
    //   766: dup
    //   767: invokespecial 42	java/util/HashSet:<init>	()V
    //   770: putfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   773: aload 11
    //   775: new 129	java/lang/StringBuilder
    //   778: dup
    //   779: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   782: aload_0
    //   783: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   786: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   789: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   792: ldc_w 2098
    //   795: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   798: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   801: ldc_w 377
    //   804: invokeinterface 2090 3 0
    //   809: astore 9
    //   811: aload 9
    //   813: ldc_w 2057
    //   816: invokevirtual 2061	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   819: astore 12
    //   821: aload 12
    //   823: arraylength
    //   824: istore 5
    //   826: iconst_0
    //   827: istore_3
    //   828: aload 9
    //   830: astore 8
    //   832: iload_3
    //   833: iload 5
    //   835: if_icmpge +49 -> 884
    //   838: aload 12
    //   840: iload_3
    //   841: aaload
    //   842: astore 8
    //   844: aload 8
    //   846: invokevirtual 576	java/lang/String:length	()I
    //   849: ifle +23 -> 872
    //   852: aload 8
    //   854: invokestatic 141	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   857: lconst_0
    //   858: lcmp
    //   859: ifle +13 -> 872
    //   862: aload_0
    //   863: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   866: aload 8
    //   868: invokevirtual 2091	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   871: pop
    //   872: iload_3
    //   873: iconst_1
    //   874: iadd
    //   875: istore_3
    //   876: goto -48 -> 828
    //   879: astore_1
    //   880: aload_0
    //   881: monitorexit
    //   882: aload_1
    //   883: athrow
    //   884: aload_0
    //   885: monitorexit
    //   886: aload_1
    //   887: invokevirtual 280	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   890: astore 12
    //   892: aload 8
    //   894: astore_1
    //   895: aload 12
    //   897: invokeinterface 285 1 0
    //   902: ifeq -891 -> 11
    //   905: aload 12
    //   907: invokeinterface 289 1 0
    //   912: checkcast 264	com/tencent/mobileqq/data/MessageRecord
    //   915: astore 13
    //   917: aload_1
    //   918: astore 9
    //   920: aload_0
    //   921: aload 13
    //   923: invokevirtual 2100	com/tencent/mobileqq/app/message/C2CMessageProcessor:a	(Lcom/tencent/mobileqq/data/MessageRecord;)Z
    //   926: ifeq +630 -> 1556
    //   929: aload_1
    //   930: astore 9
    //   932: aload 10
    //   934: ifnull +622 -> 1556
    //   937: aload 13
    //   939: getfield 267	com/tencent/mobileqq/data/MessageRecord:istroop	I
    //   942: sipush 1010
    //   945: if_icmpne +340 -> 1285
    //   948: aload 7
    //   950: astore 8
    //   952: aload_0
    //   953: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   956: aload 13
    //   958: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   961: invokevirtual 2101	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   964: ifne +89 -> 1053
    //   967: aload_0
    //   968: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   971: aload 13
    //   973: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   976: invokevirtual 2091	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   979: pop
    //   980: aload 7
    //   982: invokevirtual 576	java/lang/String:length	()I
    //   985: ifne +237 -> 1222
    //   988: aload 13
    //   990: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   993: astore 7
    //   995: aload 11
    //   997: invokeinterface 2105 1 0
    //   1002: new 129	java/lang/StringBuilder
    //   1005: dup
    //   1006: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1009: aload_0
    //   1010: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1013: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   1016: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1019: ldc_w 2085
    //   1022: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1025: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1028: aload 7
    //   1030: invokeinterface 2110 3 0
    //   1035: pop
    //   1036: aload 11
    //   1038: invokeinterface 2105 1 0
    //   1043: invokeinterface 2113 1 0
    //   1048: pop
    //   1049: aload 7
    //   1051: astore 8
    //   1053: iload 4
    //   1055: ifne +209 -> 1264
    //   1058: iload 6
    //   1060: ifeq +196 -> 1256
    //   1063: aload_0
    //   1064: getfield 52	com/tencent/mobileqq/app/message/C2CMessageProcessor:g	I
    //   1067: istore_3
    //   1068: aload_0
    //   1069: aload_0
    //   1070: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   1073: invokevirtual 2114	java/util/HashSet:size	()I
    //   1076: putfield 56	com/tencent/mobileqq/app/message/C2CMessageProcessor:i	I
    //   1079: aload_0
    //   1080: getfield 56	com/tencent/mobileqq/app/message/C2CMessageProcessor:i	I
    //   1083: iload_3
    //   1084: irem
    //   1085: ifne +113 -> 1198
    //   1088: aload_0
    //   1089: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1092: aload 13
    //   1094: iload_2
    //   1095: invokevirtual 2115	com/tencent/mobileqq/app/QQAppInterface:a	(Lcom/tencent/mobileqq/data/MessageRecord;Z)V
    //   1098: aload_0
    //   1099: getfield 74	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   1102: invokevirtual 2116	java/util/HashSet:clear	()V
    //   1105: aload 11
    //   1107: invokeinterface 2105 1 0
    //   1112: new 129	java/lang/StringBuilder
    //   1115: dup
    //   1116: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1119: aload_0
    //   1120: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1123: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   1126: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1129: ldc_w 2085
    //   1132: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1135: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1138: invokeinterface 2119 2 0
    //   1143: pop
    //   1144: aload 11
    //   1146: invokeinterface 2105 1 0
    //   1151: invokeinterface 2113 1 0
    //   1156: pop
    //   1157: iload 6
    //   1159: ifeq +39 -> 1198
    //   1162: aload_0
    //   1163: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1166: ldc_w 1793
    //   1169: ldc_w 377
    //   1172: ldc_w 377
    //   1175: ldc_w 2121
    //   1178: ldc_w 2121
    //   1181: iconst_0
    //   1182: iconst_0
    //   1183: ldc_w 377
    //   1186: ldc_w 377
    //   1189: ldc_w 377
    //   1192: ldc_w 377
    //   1195: invokestatic 1800	com/tencent/mobileqq/statistics/ReportController:b	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1198: aload_1
    //   1199: astore 7
    //   1201: aload 8
    //   1203: astore_1
    //   1204: aload_1
    //   1205: astore 8
    //   1207: aload 7
    //   1209: astore_1
    //   1210: aload 8
    //   1212: astore 7
    //   1214: goto -319 -> 895
    //   1217: astore_1
    //   1218: aload_0
    //   1219: monitorexit
    //   1220: aload_1
    //   1221: athrow
    //   1222: new 129	java/lang/StringBuilder
    //   1225: dup
    //   1226: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1229: aload 7
    //   1231: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1234: ldc_w 2073
    //   1237: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1240: aload 13
    //   1242: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   1245: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1248: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1251: astore 7
    //   1253: goto -258 -> 995
    //   1256: aload_0
    //   1257: getfield 48	com/tencent/mobileqq/app/message/C2CMessageProcessor:e	I
    //   1260: istore_3
    //   1261: goto -193 -> 1068
    //   1264: iload 6
    //   1266: ifeq +11 -> 1277
    //   1269: aload_0
    //   1270: getfield 54	com/tencent/mobileqq/app/message/C2CMessageProcessor:h	I
    //   1273: istore_3
    //   1274: goto -206 -> 1068
    //   1277: aload_0
    //   1278: getfield 50	com/tencent/mobileqq/app/message/C2CMessageProcessor:f	I
    //   1281: istore_3
    //   1282: goto -214 -> 1068
    //   1285: aload_1
    //   1286: astore 9
    //   1288: aload 13
    //   1290: getfield 267	com/tencent/mobileqq/data/MessageRecord:istroop	I
    //   1293: sipush 1001
    //   1296: if_icmpne +260 -> 1556
    //   1299: aload_1
    //   1300: astore 8
    //   1302: aload_0
    //   1303: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   1306: aload 13
    //   1308: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   1311: invokevirtual 2101	java/util/HashSet:contains	(Ljava/lang/Object;)Z
    //   1314: ifne +85 -> 1399
    //   1317: aload_0
    //   1318: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   1321: aload 13
    //   1323: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   1326: invokevirtual 2091	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   1329: pop
    //   1330: aload_1
    //   1331: invokevirtual 576	java/lang/String:length	()I
    //   1334: ifne +232 -> 1566
    //   1337: aload 13
    //   1339: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   1342: astore_1
    //   1343: aload 11
    //   1345: invokeinterface 2105 1 0
    //   1350: new 129	java/lang/StringBuilder
    //   1353: dup
    //   1354: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1357: aload_0
    //   1358: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1361: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   1364: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1367: ldc_w 2098
    //   1370: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1373: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1376: aload_1
    //   1377: invokeinterface 2110 3 0
    //   1382: pop
    //   1383: aload 11
    //   1385: invokeinterface 2105 1 0
    //   1390: invokeinterface 2113 1 0
    //   1395: pop
    //   1396: aload_1
    //   1397: astore 8
    //   1399: iload 4
    //   1401: ifne +205 -> 1606
    //   1404: iload 6
    //   1406: ifeq +192 -> 1598
    //   1409: aload_0
    //   1410: getfield 64	com/tencent/mobileqq/app/message/C2CMessageProcessor:m	I
    //   1413: istore_3
    //   1414: aload_0
    //   1415: aload_0
    //   1416: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   1419: invokevirtual 2114	java/util/HashSet:size	()I
    //   1422: putfield 68	com/tencent/mobileqq/app/message/C2CMessageProcessor:o	I
    //   1425: aload 8
    //   1427: astore 9
    //   1429: aload_0
    //   1430: getfield 68	com/tencent/mobileqq/app/message/C2CMessageProcessor:o	I
    //   1433: iload_3
    //   1434: irem
    //   1435: ifne +121 -> 1556
    //   1438: aload_0
    //   1439: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1442: aload 13
    //   1444: iload_2
    //   1445: invokevirtual 2115	com/tencent/mobileqq/app/QQAppInterface:a	(Lcom/tencent/mobileqq/data/MessageRecord;Z)V
    //   1448: aload_0
    //   1449: getfield 76	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_b_of_type_JavaUtilHashSet	Ljava/util/HashSet;
    //   1452: invokevirtual 2116	java/util/HashSet:clear	()V
    //   1455: aload 11
    //   1457: invokeinterface 2105 1 0
    //   1462: new 129	java/lang/StringBuilder
    //   1465: dup
    //   1466: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1469: aload_0
    //   1470: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1473: invokevirtual 95	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   1476: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1479: ldc_w 2098
    //   1482: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1485: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1488: invokeinterface 2119 2 0
    //   1493: pop
    //   1494: aload 11
    //   1496: invokeinterface 2105 1 0
    //   1501: invokeinterface 2113 1 0
    //   1506: pop
    //   1507: aload 8
    //   1509: astore 9
    //   1511: iload 6
    //   1513: ifeq +43 -> 1556
    //   1516: aload_0
    //   1517: getfield 86	com/tencent/mobileqq/app/message/C2CMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1520: ldc_w 1793
    //   1523: ldc_w 377
    //   1526: ldc_w 377
    //   1529: ldc_w 2121
    //   1532: ldc_w 2121
    //   1535: iconst_0
    //   1536: iconst_0
    //   1537: ldc_w 377
    //   1540: ldc_w 377
    //   1543: ldc_w 377
    //   1546: ldc_w 377
    //   1549: invokestatic 1800	com/tencent/mobileqq/statistics/ReportController:b	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   1552: aload 8
    //   1554: astore 9
    //   1556: aload 7
    //   1558: astore_1
    //   1559: aload 9
    //   1561: astore 7
    //   1563: goto -359 -> 1204
    //   1566: new 129	java/lang/StringBuilder
    //   1569: dup
    //   1570: invokespecial 130	java/lang/StringBuilder:<init>	()V
    //   1573: aload_1
    //   1574: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1577: ldc_w 2073
    //   1580: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1583: aload 13
    //   1585: getfield 357	com/tencent/mobileqq/data/MessageRecord:frienduin	Ljava/lang/String;
    //   1588: invokevirtual 188	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1591: invokevirtual 196	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1594: astore_1
    //   1595: goto -252 -> 1343
    //   1598: aload_0
    //   1599: getfield 60	com/tencent/mobileqq/app/message/C2CMessageProcessor:k	I
    //   1602: istore_3
    //   1603: goto -189 -> 1414
    //   1606: iload 6
    //   1608: ifeq +11 -> 1619
    //   1611: aload_0
    //   1612: getfield 66	com/tencent/mobileqq/app/message/C2CMessageProcessor:n	I
    //   1615: istore_3
    //   1616: goto -202 -> 1414
    //   1619: aload_0
    //   1620: getfield 62	com/tencent/mobileqq/app/message/C2CMessageProcessor:l	I
    //   1623: istore_3
    //   1624: goto -210 -> 1414
    //   1627: iconst_1
    //   1628: istore 4
    //   1630: goto -1449 -> 181
    //   1633: iconst_0
    //   1634: istore_3
    //   1635: goto -1514 -> 121
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1638	0	this	C2CMessageProcessor
    //   0	1638	1	paramArrayList	ArrayList
    //   0	1638	2	paramBoolean	boolean
    //   120	1515	3	i1	int
    //   179	1450	4	i2	int
    //   671	165	5	i3	int
    //   196	1411	6	bool	boolean
    //   48	1514	7	localObject1	Object
    //   70	1483	8	localObject2	Object
    //   583	977	9	localObject3	Object
    //   156	777	10	localQQMessageFacade	QQMessageFacade
    //   573	922	11	localSharedPreferences	android.content.SharedPreferences
    //   666	240	12	localObject4	Object
    //   915	669	13	localMessageRecord	MessageRecord
    // Exception table:
    //   from	to	target	type
    //   602	673	879	finally
    //   691	719	879	finally
    //   736	738	879	finally
    //   880	882	879	finally
    //   755	826	1217	finally
    //   844	872	1217	finally
    //   884	886	1217	finally
    //   1218	1220	1217	finally
  }
  
  public void a(List paramList, msg_comm.Msg paramMsg, boolean paramBoolean)
  {
    paramList = (msg_comm.MsgHead)msg_head.get();
    paramMsg = msg_body.get()).msg_content.get().toByteArray();
    long l1 = Utils.a(paramMsg, 0);
    int i1 = paramMsg[4];
    long l2 = Utils.a(paramMsg, 5);
    i1 = paramMsg[9];
    long l3 = Utils.a(paramMsg, 10);
    int i2 = paramMsg[14];
    try
    {
      new String(paramMsg, 15, i2, "GBK");
      if (!paramBoolean)
      {
        a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i1, String.valueOf(l2), String.valueOf(l3), l1, msg_time.get(), msg_seq.get(), paramList);
        paramMsg = new ArrayList();
        paramMsg.add(new Pair(Long.valueOf(from_uin.get()), Long.valueOf(msg_time.get())));
        ((C2CMessageProcessor)jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("c2c_processor")).b(paramMsg);
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        new String(paramMsg, 15, i2);
      }
    }
  }
  
  public boolean a(int paramInt)
  {
    return paramInt == 33;
  }
  
  public boolean a(MessageRecord paramMessageRecord)
  {
    if ((istroop != 1010) && (istroop != 1001)) {}
    while (((senderuin != null) && (senderuin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) || ((istroop == 1001) && (msgtype == 62535)) || (!MsgProxyUtils.c(paramMessageRecord)) || (MsgProxyUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramMessageRecord))) {
      return false;
    }
    return true;
  }
  
  public boolean a(ArrayList paramArrayList)
  {
    if (paramArrayList == null) {
      return false;
    }
    paramArrayList = paramArrayList.iterator();
    MessageRecord localMessageRecord;
    do
    {
      if (!paramArrayList.hasNext()) {
        break;
      }
      localMessageRecord = (MessageRecord)paramArrayList.next();
    } while ((localMessageRecord.isSend()) || (isread) || ((MsgProxyUtils.c(localMessageRecord)) && (!MsgProxyUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord))) || (istroop == 7100));
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void b(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 2001: 
      a(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    a(paramToServiceMsg, paramFromServiceMsg, true);
  }
  
  public void b(ArrayList paramArrayList)
  {
    if ((paramArrayList == null) || (paramArrayList.size() <= 0)) {
      return;
    }
    StringBuilder localStringBuilder = new StringBuilder("-ReportList-");
    msg_svc.PbMsgReadedReportReq localPbMsgReadedReportReq = new msg_svc.PbMsgReadedReportReq();
    msg_svc.PbC2CReadedReportReq localPbC2CReadedReportReq = new msg_svc.PbC2CReadedReportReq();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      Pair localPair = (Pair)paramArrayList.next();
      msg_svc.PbC2CReadedReportReq.UinPairReadInfo localUinPairReadInfo = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
      peer_uin.set(((Long)first).longValue());
      last_read_time.set(((Long)second).intValue());
      localStringBuilder.append("-uin:").append(first).append("-ReadTime-").append(second);
      pair_info.add(localUinPairReadInfo);
    }
    paramArrayList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a();
    if (paramArrayList != null) {
      sync_cookie.set(ByteStringMicro.copyFrom(paramArrayList));
    }
    c2c_read_report.set(localPbC2CReadedReportReq);
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.C2CMessageProcessor", 2, "<ReadReport><S>_C2C:" + localStringBuilder.toString());
    }
    a(localPbMsgReadedReportReq);
  }
}
