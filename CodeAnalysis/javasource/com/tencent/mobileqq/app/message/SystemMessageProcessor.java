package com.tencent.mobileqq.app.message;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.Conversation;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecentManagerFor3rdPart;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.SystemMsg;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBBoolField;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBFixed32Field;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgUtils;
import com.tencent.mobileqq.transfile.ProtoReqManager;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoReq;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.DBUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mqq.os.MqqHandler;
import msf.msgcomm.msg_comm.Msg;
import nkr;
import nks;
import nkt;
import nku;
import nkv;
import nkw;
import nkx;
import nky;
import nkz;
import nla;
import nlb;
import tencent.im.msg.im_msg_body.MsgBody;
import tencent.im.oidb.cmd0x5cf.Oidb_0x5cf.DelDecideInfo;
import tencent.im.oidb.cmd0x5cf.Oidb_0x5cf.DelMsgInfo;
import tencent.im.oidb.cmd0x5cf.Oidb_0x5cf.DelUnDecideInfo;
import tencent.im.oidb.cmd0x5cf.Oidb_0x5cf.ReqBody;
import tencent.im.oidb.cmd0x5cf.Oidb_0x5cf.RspBody;
import tencent.mobileim.structmsg.structmsg.FlagInfo;
import tencent.mobileim.structmsg.structmsg.ReqNextSystemMsg;
import tencent.mobileim.structmsg.structmsg.ReqSystemMsg;
import tencent.mobileim.structmsg.structmsg.ReqSystemMsgAction;
import tencent.mobileim.structmsg.structmsg.ReqSystemMsgNew;
import tencent.mobileim.structmsg.structmsg.ReqSystemMsgRead;
import tencent.mobileim.structmsg.structmsg.RspHead;
import tencent.mobileim.structmsg.structmsg.RspNextSystemMsg;
import tencent.mobileim.structmsg.structmsg.RspSystemMsg;
import tencent.mobileim.structmsg.structmsg.RspSystemMsgAction;
import tencent.mobileim.structmsg.structmsg.RspSystemMsgNew;
import tencent.mobileim.structmsg.structmsg.RspSystemMsgRead;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgActionInfo;

public class SystemMessageProcessor
  extends BaseMessageProcessor
{
  public static final String a = "getSystemMsgSender";
  private static final String c = "SystemMessageProcessor";
  public static final int e = 0;
  public static final int f = 1;
  public static final int g = 2;
  private Map a;
  private int h;
  private int i;
  private int j;
  private final int k;
  private final int l;
  private final int m;
  
  public SystemMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    k = 2;
    l = 2;
    m = 2;
    jdField_a_of_type_JavaUtilMap = new HashMap();
  }
  
  private String a()
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(AppConstants.au, 0);
    if ((localObject == null) || (((List)localObject).size() <= 0)) {
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "mLocalDataList is null !");
      }
    }
    while ((localObject == null) || (((List)localObject).size() <= 0)) {
      return "";
    }
    localObject = (MessageForSystemMsg)((List)localObject).get(((List)localObject).size() - 1);
    ((MessageForSystemMsg)localObject).parse();
    return structMsg.msg.req_uin_nick.get() + " " + structMsg.msg.msg_describe.get();
  }
  
  private void a(int paramInt, long paramLong1, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SystemMessageProcessor", 2, "sendGroupSystemMsgToVideo-->msgType=" + paramInt + " troopUin=" + paramLong1 + " userUin=" + paramLong2);
    }
    Intent localIntent = new Intent();
    localIntent.setAction("tencent.video.q2v.GroupSystemMsg");
    localIntent.putExtra("type", paramInt);
    localIntent.putExtra("relationType", 1);
    localIntent.putExtra("relationId", paramLong1);
    localIntent.putExtra("userUin", paramLong2);
    if ((paramInt == 3) || (paramInt == 15)) {
      localIntent.putExtra("needSendCmd", true);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
  }
  
  private void a(RecentUserProxy paramRecentUserProxy, RecentUser paramRecentUser)
  {
    paramRecentUserProxy.a(paramRecentUser);
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    paramToServiceMsg.getServiceCmd();
    long l1 = extraData.getLong("latestFriendSeq");
    long l2 = extraData.getLong("latestGroupSeq");
    long l3 = extraData.getLong("msgSeq");
    long l4 = extraData.getLong("timeOut");
    extraData.getInt("retryIndex");
    int n = extraData.getInt("type");
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
    paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3);
    if (paramToServiceMsg != null)
    {
      if (paramFromServiceMsg.getResultCode() != 2901) {
        break label123;
      }
      paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
      paramToServiceMsg.getClass();
      if (!paramFromServiceMsg.a(paramToServiceMsg, "msf")) {
        break label123;
      }
    }
    label123:
    while ((480000L != l4) && (!paramToServiceMsg.a())) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("SystemMessageProcessor", 2, "handleSendSystemMsgReadedReportError type=" + n + ";reqSeq=" + l3 + ";latestFriendSeq=" + l1 + ";latestGroupSeq=" + l2);
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3);
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject, structmsg.RspSystemMsgNew paramRspSystemMsgNew)
  {
    if (FriendSystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppMessageHandler)) {}
    do
    {
      return;
      if (paramRspSystemMsgNew != null) {}
      while ((paramRspSystemMsgNew == null) || (head.result.get() != 0))
      {
        if (QLog.isColorLevel()) {
          QLog.e("SystemMessageProcessor", 2, "rspSystemMsg.head.result.get()" + head.result.get());
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
        return;
        try
        {
          paramRspSystemMsgNew = new structmsg.RspSystemMsgNew();
          try
          {
            paramRspSystemMsgNew.mergeFrom((byte[])paramObject);
          }
          catch (Exception localException1)
          {
            paramObject = paramRspSystemMsgNew;
          }
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            int i2;
            int i3;
            int i4;
            int n;
            long l1;
            int i1;
            Object localObject1;
            Object localObject2;
            int i5;
            boolean bool;
            long l2;
            paramObject = null;
            continue;
            paramToServiceMsg = "";
          }
        }
        paramRspSystemMsgNew = paramObject;
        if (QLog.isColorLevel())
        {
          QLog.e("Q.systemmsg.", 2, "<---handleGetFriendSystemMsgResp : decode pb error:", localException1);
          paramRspSystemMsgNew = paramObject;
        }
      }
      paramObject = friendmsgs.get();
      i2 = paramObject.size();
      i3 = unread_friend_count.get();
      i4 = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      n = extraData.getInt("getSystemMsgSender");
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "processFriendSystemMsg-->requestFrom:" + n);
      }
      if ((i3 == 0) && (i2 == 0) && (n == 2))
      {
        SystemMsgListView.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).b();
        a(4014, true, null);
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.systemmsg.", 2, "<---handleGetFriendSystemMsgResp : decode pb MsgsSize = " + i2 + " latest_friend_seq" + latest_friend_seq.get() + " latest_group_seq" + latest_group_seq.get() + " following_friend_seq" + following_friend_seq.get() + " following_group_seq" + following_group_seq.get() + " unreadCount" + i3 + " localunreadCount" + i4);
      }
      if (!msg_display.has()) {
        break label1608;
      }
      paramToServiceMsg = msg_display.get();
      l1 = 0L;
      if (paramObject.size() > 0) {
        l1 = get0msg_time.get();
      }
      h = 0;
      i1 = 0;
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47") != latest_friend_seq.get()) {
        break label578;
      }
      if ((i3 == 0) || (l1 != 0L)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("SystemMessageProcessor", 2, "sentSeq == respSeq | unreadCount = " + i3 + " | newFriendLastMsgTime = 0");
    return;
    FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i3);
    paramFromServiceMsg = paramToServiceMsg;
    if (TextUtils.isEmpty(paramToServiceMsg)) {
      paramFromServiceMsg = a();
    }
    FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false, paramFromServiceMsg, l1);
    return;
    label578:
    n = i1;
    if (i3 == 0)
    {
      n = i1;
      if (i2 == 0) {
        n = 1;
      }
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47", latest_friend_seq.get());
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_friend_seq_47", following_friend_seq.get());
    FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.au, 0, true, false);
    FriendSystemMsgController.a().a(true);
    FriendSystemMsgController.a().a(false, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (n == 0)
    {
      paramRspSystemMsgNew = new ArrayList();
      if (paramFromServiceMsg.getUin() == null)
      {
        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
        n = 0;
        label720:
        if (n >= i2) {
          break label951;
        }
        localObject1 = MessageRecordFactory.a(63518);
        msgtype = 63518;
        selfuin = paramFromServiceMsg;
        frienduin = AppConstants.au;
        senderuin = (getreq_uin.get() + "");
        istroop = 0;
        if (n == 0) {
          extStr = paramToServiceMsg;
        }
        localObject2 = (MessageForSystemMsg)localObject1;
        structMsg = ((structmsg.StructMsg)((structmsg.StructMsg)paramObject.get(n)).get());
        i1 = structMsg.msg_type.get();
        i5 = structMsg.msg.sub_type.get();
        if ((i1 != 1) || (SystemMsgUtils.a(i5))) {
          break label919;
        }
        if (QLog.isColorLevel()) {
          QLog.e("Q.systemmsg.", 2, "<---handleGetFriendSystemMsgResp : decode pb filtered");
        }
      }
      for (;;)
      {
        n += 1;
        break label720;
        paramFromServiceMsg = paramFromServiceMsg.getUin();
        break;
        label919:
        msgData = structMsg.toByteArray();
        ((ChatMessage)localObject1).parse();
        paramRspSystemMsgNew.add(localObject2);
      }
      label951:
      if (paramRspSystemMsgNew.size() > 0)
      {
        paramObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        paramFromServiceMsg = String.valueOf(paramFromServiceMsg);
        if ((MessageHandlerUtils.a(paramRspSystemMsgNew)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop))
        {
          bool = true;
          paramObject.a(paramRspSystemMsgNew, paramFromServiceMsg, bool);
          if (i3 <= i4) {
            break label1151;
          }
          bool = true;
          label1012:
          a("handleGetSystemMsgResp", true, i3, bool, false);
        }
      }
      else
      {
        if (i3 == 0) {
          a(paramRspSystemMsgNew);
        }
        paramObject = paramToServiceMsg;
        l2 = l1;
        if (TextUtils.isEmpty(paramToServiceMsg))
        {
          if (QLog.isColorLevel()) {
            QLog.d("SystemMessageProcessor", 2, "newFriendMsgDisplay is null! using LocalDataList show");
          }
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(AppConstants.au, 0);
          if ((localObject2 != null) && (((List)localObject2).size() != 0)) {
            break label1157;
          }
          paramObject = paramToServiceMsg;
          l2 = l1;
          if (QLog.isColorLevel())
          {
            QLog.d("SystemMessageProcessor", 2, "mLocalDataList is null !");
            l2 = l1;
            paramObject = paramToServiceMsg;
          }
        }
      }
    }
    for (;;)
    {
      FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false, paramObject, l2);
      a(4005, true, null);
      return;
      bool = false;
      break;
      label1151:
      bool = false;
      break label1012;
      label1157:
      paramRspSystemMsgNew = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
      localObject1 = paramRspSystemMsgNew.a(AppConstants.am, 4000);
      msgType = 12;
      displayName = "新朋友";
      paramObject = paramToServiceMsg;
      l2 = l1;
      if (localObject2 != null)
      {
        paramObject = paramToServiceMsg;
        l2 = l1;
        paramFromServiceMsg = paramToServiceMsg;
        long l3 = l1;
        try
        {
          if (((List)localObject2).size() <= 0) {
            continue;
          }
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          paramObject = (MessageForSystemMsg)((List)localObject2).get(((List)localObject2).size() - 1);
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          paramObject.parse();
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          localObject2 = structMsg.msg.req_uin_nick.get() + " " + structMsg.msg.msg_describe.get() + NewFriendManager.b + 0;
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          lastmsgtime = time;
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          msgData = ((String)localObject2).getBytes();
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          msg = localObject2;
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          ((RecentUser)localObject1).reParse();
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).b();
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          a(paramRspSystemMsgNew, (RecentUser)localObject1);
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          paramToServiceMsg = structMsg.msg.req_uin_nick.get() + " " + structMsg.msg.msg_describe.get();
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          l1 = time;
          paramObject = paramToServiceMsg;
          l2 = l1;
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          if (!QLog.isColorLevel()) {
            continue;
          }
          paramFromServiceMsg = paramToServiceMsg;
          l3 = l1;
          QLog.d("SystemMessageProcessor", 2, "localData msg newFriendMsgDisplay = " + paramToServiceMsg + "newFriendLastMsgTime = " + l1);
          paramObject = paramToServiceMsg;
          l2 = l1;
        }
        catch (Exception paramToServiceMsg)
        {
          paramToServiceMsg.printStackTrace();
          paramObject = paramFromServiceMsg;
          l2 = l3;
        }
        continue;
        paramFromServiceMsg = (NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33);
        paramFromServiceMsg.c();
        paramFromServiceMsg.b();
        paramObject = paramToServiceMsg;
        l2 = l1;
      }
    }
  }
  
  private void a(List paramList)
  {
    if ((paramList == null) || (paramList.size() == 0)) {
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "refreshRecentData, mDataList is null !");
      }
    }
    RecentUserProxy localRecentUserProxy;
    do
    {
      return;
      localRecentUserProxy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
    } while ((paramList == null) || (paramList.size() <= 0));
    RecentUser localRecentUser = localRecentUserProxy.a(AppConstants.am, 4000);
    msgType = 12;
    displayName = "新朋友";
    Object localObject = (MessageForSystemMsg)paramList.get(0);
    ((MessageForSystemMsg)localObject).parse();
    if (!TextUtils.isEmpty(extStr)) {}
    for (String str = extStr + NewFriendManager.b + 0;; str = structMsg.msg.req_uin_nick.get() + " " + structMsg.msg.msg_describe.get() + NewFriendManager.b + 0)
    {
      lastmsgtime = time;
      msgData = str.getBytes();
      msg = str;
      localRecentUser.reParse();
      if (QLog.isColorLevel())
      {
        localObject = new StringBuilder().append("mDataList.size() ").append(paramList.size()).append(" | msg = ");
        paramList = str;
        if (TextUtils.isEmpty(str)) {
          paramList = "";
        }
        QLog.d("SystemMessageProcessor", 2, paramList);
      }
      a(localRecentUserProxy, localRecentUser);
      ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).b();
      return;
    }
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if (paramFromServiceMsg.getUin() == null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    }
    Object localObject2;
    for (;;)
    {
      Object localObject1;
      try
      {
        localObject1 = new structmsg.RspSystemMsgNew();
      }
      catch (Exception localException1)
      {
        localObject1 = null;
      }
      try
      {
        ((structmsg.RspSystemMsgNew)localObject1).mergeFrom((byte[])paramObject);
        localObject2 = localObject1;
        localObject1 = new StringBuilder();
        if ((localObject2 != null) && (head.result.get() == 0)) {
          break;
        }
        ((StringBuilder)localObject1).setLength(0);
        if (QLog.isColorLevel()) {
          QLog.e("SystemMessageProcessor", 2, ((StringBuilder)localObject1).toString());
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
        return;
      }
      catch (Exception localException2)
      {
        for (;;) {}
      }
      paramFromServiceMsg.getUin();
      continue;
      localObject2 = localObject1;
      if (QLog.isColorLevel())
      {
        QLog.e("SystemMessageProcessor", 2, "<---handleGetSystemMsgRespNew : decode pb error:", localException1);
        localObject2 = localObject1;
      }
    }
    if (QLog.isColorLevel()) {
      QLog.e("SystemMessageProcessor", 2, "SystemMessageProcessor: listsize");
    }
    a(paramToServiceMsg, paramFromServiceMsg, paramObject, localObject2);
    b(paramToServiceMsg, paramFromServiceMsg, paramObject, localObject2);
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject, structmsg.RspSystemMsgNew paramRspSystemMsgNew)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("SystemMessageProcessor", 4, "processGroupSystemMsg");
    }
    int i2 = extraData.getInt("getSystemMsgSender");
    n = 0;
    if (QLog.isColorLevel()) {
      QLog.d("SystemMessageProcessor", 2, "processGroupSystemMsg-->requestFrom:" + i2);
    }
    String str;
    if (paramFromServiceMsg.getUin() == null)
    {
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      if ((!GroupSystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppMessageHandler)) || (i2 == 1)) {
        break label107;
      }
    }
    label107:
    do
    {
      return;
      str = paramFromServiceMsg.getUin();
      break;
      if (paramRspSystemMsgNew != null) {}
      for (;;)
      {
        if ((paramRspSystemMsgNew != null) && (!TextUtils.isEmpty(grp_msg_display.get()))) {
          GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, grp_msg_display.get());
        }
        paramObject = new StringBuilder();
        if ((paramRspSystemMsgNew != null) && (head.result.get() == 0)) {
          break;
        }
        paramObject.setLength(0);
        if (QLog.isColorLevel()) {
          QLog.e("SystemMessageProcessor", 2, paramObject.toString());
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
        return;
        try
        {
          paramRspSystemMsgNew = new structmsg.RspSystemMsgNew();
          try
          {
            paramRspSystemMsgNew.mergeFrom((byte[])paramObject);
          }
          catch (Exception localException1)
          {
            paramObject = paramRspSystemMsgNew;
          }
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            int i3;
            int i4;
            int i1;
            int i5;
            int i6;
            Object localObject1;
            int i7;
            Object localObject2;
            Object localObject3;
            boolean bool;
            paramObject = null;
            continue;
            long l2 = -1L;
            continue;
            long l1 = -1L;
            continue;
            n = -1;
          }
        }
        paramRspSystemMsgNew = paramObject;
        if (QLog.isColorLevel())
        {
          QLog.e("SystemMessageProcessor", 2, "<---handleGetGroupSystemMsgResp : decode pb error:", localException1);
          paramRspSystemMsgNew = paramObject;
        }
      }
      paramToServiceMsg = groupmsgs.get();
      i3 = paramToServiceMsg.size();
      i4 = unread_group_count.get();
      i1 = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "<---handleGetGroupSystemMsgResp : decode pb groupMsgsSize = " + i3 + " latest_friend_seq" + latest_friend_seq.get() + " latest_group_seq" + latest_group_seq.get() + " following_friend_seq" + following_friend_seq.get() + " following_group_seq" + following_group_seq.get() + " unreadCount" + i4 + " localUnreadCount" + i1);
      }
    } while (i3 == 0);
    h = 0;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq", latest_group_seq.get());
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_group_seq", following_group_seq.get());
    GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i4);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(AppConstants.aB, 9000, i4 - i1);
    paramFromServiceMsg = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.av, 0, true, false);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.ay, 0, true, false);
    GroupSystemMsgController.a().a(true);
    GroupSystemMsgController.a().a(false, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    Collections.sort(paramToServiceMsg, new nkr(this));
    i1 = 0;
    if (i1 < i3)
    {
      paramObject = MessageRecordFactory.a(63518);
      msgtype = 63518;
      selfuin = str;
      frienduin = AppConstants.av;
      i5 = getmsg.group_msg_type.get();
      i6 = TroopUtils.a(i5);
      if (i6 == 1) {
        senderuin = (getmsg.action_uin.get() + "");
      }
      for (;;)
      {
        istroop = 0;
        localObject1 = (MessageForSystemMsg)paramObject;
        structMsg = ((structmsg.StructMsg)((structmsg.StructMsg)paramToServiceMsg.get(i1)).get());
        i6 = structMsg.msg_type.get();
        i7 = structMsg.msg.sub_type.get();
        if ((i6 != 1) || (SystemMsgUtils.a(i7))) {
          break label829;
        }
        i1 += 1;
        break;
        if (i6 == 2) {
          senderuin = (getreq_uin.get() + "");
        }
      }
      label829:
      if ((i5 == 2) && (i7 == 2) && (a(String.valueOf(getmsg.group_code.get()), getmsg_seq.get())) && (TroopUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, getmsg.group_code.get(), String.valueOf(getmsg.action_uin.get()))))
      {
        if (QLog.isColorLevel()) {
          QLog.d("SystemMessageProcessor", 2, "processGroupSystemMsg-->msgPos:" + i1 + ":addFriendTipsMr");
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(getmsg.group_code.get() + "", 1, -1L, 10004, true);
        localObject2 = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
        if (localObject2 != null) {
          ((TroopHandler)localObject2).a(String.valueOf(getmsg.group_code.get()), Boolean.valueOf(false));
        }
      }
      if (i7 == 1) {
        senderuin = (getmsg.action_uin.get() + "");
      }
      if ((i2 == 1) && (n == 0))
      {
        if (i5 == 3)
        {
          localObject3 = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
          localObject2 = ((TroopManager)localObject3).a(getmsg.group_code.get() + "");
          if (localObject2 != null)
          {
            dwCmdUinUinFlag = 1L;
            if (Administrator == null) {
              break label1667;
            }
            if (Administrator.startsWith("|")) {
              Administrator = Administrator.substring(1);
            }
            if (Administrator.endsWith("|")) {
              Administrator = Administrator.substring(0, Administrator.length() - 1);
            }
            label1296:
            if (!Administrator.contains(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
              Administrator = (Administrator + "|" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
            }
            ((TroopManager)localObject3).b((TroopInfo)localObject2);
            localObject3 = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
            if (localObject3 != null) {
              ((TroopHandler)localObject3).b(Long.parseLong(troopuin));
            }
          }
        }
        label1667:
        do
        {
          do
          {
            if ((i5 == 13) || (i5 == 6) || (i5 == 7))
            {
              if (QLog.isColorLevel()) {
                QLog.d("SystemMessageProcessor", 2, "processGroupSystemMsg-->msgPos:" + i1 + ",msgTime:" + getmsg_time + ",msgType:" + i5 + ":delete troopMember, delete troop, clear local history");
              }
              localObject2 = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
              if (localObject2 != null)
              {
                localObject3 = getmsg.group_code.get() + "";
                ((TroopManager)localObject2).b((String)localObject3, getreq_uin.get() + "");
                if (i5 == 7)
                {
                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((String)localObject3, 1);
                  ((TroopManager)localObject2).a((String)localObject3);
                  DBUtils.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject3, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
                }
              }
            }
            n = 1;
            msgData = structMsg.toByteArray();
            paramFromServiceMsg.add(localObject1);
            break;
            Administrator = "";
            break label1296;
          } while (i5 != 15);
          localObject2 = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
          localObject3 = ((TroopManager)localObject2).a(getmsg.group_code.get() + "");
        } while (localObject3 == null);
        dwCmdUinUinFlag = 0L;
        if (Administrator != null)
        {
          if (Administrator.startsWith("|")) {
            Administrator = Administrator.substring(1);
          }
          if (!Administrator.endsWith("|")) {}
        }
        for (Administrator = Administrator.substring(0, Administrator.length() - 1);; Administrator = "")
        {
          Administrator = Administrator.replace(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() + "|", "").replace("|" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "").replace(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "");
          ((TroopManager)localObject2).b((TroopInfo)localObject3);
          break;
        }
      }
    }
    else
    {
      if (paramFromServiceMsg.size() > 0)
      {
        paramObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        localObject1 = String.valueOf(str);
        if ((!MessageHandlerUtils.a(paramFromServiceMsg)) || (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop)) {
          break label2423;
        }
      }
      label2423:
      for (bool = true;; bool = false)
      {
        paramObject.a(paramFromServiceMsg, (String)localObject1, bool);
        a("handleGetSystemMsgResp", true, i4, false, false);
        if ((msg_ribbon_group.has()) && (msg_ribbon_group.get() != null))
        {
          paramRspSystemMsgNew = (structmsg.StructMsg)msg_ribbon_group.get();
          paramObject = MessageRecordFactory.a(63518);
          selfuin = str;
          frienduin = AppConstants.ay;
          senderuin = (req_uin.get() + "");
          istroop = 0;
          localObject1 = (MessageForSystemMsg)paramObject;
          structMsg = paramRspSystemMsgNew;
          msgData = structMsg.toByteArray();
          paramRspSystemMsgNew = new ArrayList();
          paramRspSystemMsgNew.add(paramObject);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramRspSystemMsgNew, String.valueOf(str), true);
          if (QLog.isColorLevel()) {
            QLog.d("Q.systemmsg.", 2, "ribbon info");
          }
        }
        GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        paramObject = (RecentManagerFor3rdPart)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(32);
        paramFromServiceMsg = ((MessageForSystemMsg)paramFromServiceMsg.get(0)).getSystemMsg();
        GroupSystemMsgController.a().a(paramFromServiceMsg);
        l1 = msg_time.get();
        paramObject.a(AppConstants.aB, 9000, "群通知", l1, l1);
        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(Conversation.class);
        if (paramFromServiceMsg != null) {
          paramFromServiceMsg.sendMessage(paramFromServiceMsg.obtainMessage(1009));
        }
        paramToServiceMsg = (structmsg.StructMsg)paramToServiceMsg.get(0);
        if (msg.has())
        {
          if (!msg.get()).group_msg_type.has()) {
            break label2452;
          }
          n = msg.get()).group_msg_type.get();
          if (!msg.get()).group_code.has()) {
            break label2444;
          }
          l1 = msg.get()).group_code.get();
          if (!req_uin.has()) {
            break;
          }
          l2 = req_uin.get();
          if ((n != -1) && (l2 != -1L) && (l1 != -1L)) {
            a(n, l1, l2);
          }
        }
        a(4005, true, null);
        jdField_a_of_type_JavaUtilMap.clear();
        return;
      }
    }
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    String str;
    if (paramFromServiceMsg.getUin() == null) {
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    }
    for (;;)
    {
      try
      {
        localObject1 = new structmsg.RspNextSystemMsg();
      }
      catch (Exception localException1)
      {
        Object localObject1;
        paramObject = null;
      }
      try
      {
        ((structmsg.RspNextSystemMsg)localObject1).mergeFrom((byte[])paramObject);
        paramObject = localObject1;
        localObject1 = new StringBuilder();
        if ((paramObject != null) && (head.result.get() == 0)) {
          break;
        }
        ((StringBuilder)localObject1).setLength(0);
        if (QLog.isColorLevel()) {
          QLog.e("SystemMessageProcessor", 2, ((StringBuilder)localObject1).toString());
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
        return;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          int i1;
          int n;
          long l1;
          long l3;
          long l2;
          boolean bool;
          paramObject = localObject2;
          Object localObject2 = localException2;
        }
      }
      str = paramFromServiceMsg.getUin();
      continue;
      if (QLog.isColorLevel()) {
        QLog.e("SystemMessageProcessor", 2, "<---handleGetNextOldSystemMsgResp : decode pb:", localException1);
      }
    }
    paramToServiceMsg = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.ci = 0;
    paramFromServiceMsg = msgs.get();
    i1 = paramFromServiceMsg.size();
    if (QLog.isColorLevel()) {
      QLog.e("SystemMessageProcessor", 2, "<---handleGetNextOldSystemMsgResp : decode pb size = " + i1);
    }
    n = 0;
    while (n < i1)
    {
      localObject2 = MessageRecordFactory.a(63518);
      msgtype = 63518;
      selfuin = str;
      frienduin = AppConstants.ap;
      senderuin = AppConstants.ap;
      istroop = 0;
      MessageForSystemMsg localMessageForSystemMsg = (MessageForSystemMsg)localObject2;
      structMsg = ((structmsg.StructMsg)((structmsg.StructMsg)paramFromServiceMsg.get(n)).get());
      msgData = structMsg.toByteArray();
      paramToServiceMsg.add(localMessageForSystemMsg);
      n += 1;
    }
    if (paramToServiceMsg.size() > 0)
    {
      if (paramToServiceMsg.size() < 10) {
        SystemMsgController.a().a(true, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
      SystemMsgController.a().a(false);
      l1 = following_friend_seq.get();
      l3 = following_group_seq.get();
      if (l1 > 0L) {
        break label567;
      }
      l1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_friend_seq_47");
      l2 = l3;
      if (l3 <= 0L) {
        l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_group_seq");
      }
      if (QLog.isColorLevel()) {
        QLog.e("SystemMessageProcessor", 2, "<---handleGetNextOldSystemMsgResp : decode pb following_friend_seq" + l1 + " following_group_seq" + l2);
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l1, l2);
      paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      paramObject = String.valueOf(str);
      if ((MessageHandlerUtils.a(paramToServiceMsg)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop))
      {
        bool = true;
        paramFromServiceMsg.a(paramToServiceMsg, paramObject, bool);
        a("handleGetSystemMsgResp", true, paramToServiceMsg.size(), false, false);
      }
    }
    for (;;)
    {
      a(4005, true, null);
      return;
      bool = false;
      break;
      SystemMsgController.a().a(true, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
  }
  
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    String str;
    if (paramFromServiceMsg.getUin() == null)
    {
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      if (!SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppMessageHandler)) {
        break label39;
      }
    }
    label39:
    label407:
    label418:
    do
    {
      do
      {
        do
        {
          return;
          str = paramFromServiceMsg.getUin();
          break;
          for (;;)
          {
            try
            {
              localObject = new structmsg.RspSystemMsg();
              localObject = paramObject;
            }
            catch (Exception localException1)
            {
              try
              {
                ((structmsg.RspSystemMsg)localObject).mergeFrom((byte[])paramObject);
                paramObject = new StringBuilder();
                if ((localObject != null) && (head.result.get() == 0)) {
                  break;
                }
                paramObject.setLength(0);
                if (QLog.isColorLevel()) {
                  QLog.e("SystemMessageProcessor", 2, paramObject.toString());
                }
                jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
                return;
              }
              catch (Exception localException2)
              {
                for (;;)
                {
                  Object localObject;
                  int i1;
                  int i2;
                  int n;
                  boolean bool1;
                  int i3;
                  int i4;
                  boolean bool2;
                  paramObject = localObject;
                }
              }
              localException1 = localException1;
              paramObject = null;
            }
            if (QLog.isColorLevel())
            {
              QLog.e("SystemMessageProcessor", 2, "<---handleGetSystemMsgResp : decode pb error:", localException1);
              localObject = paramObject;
            }
          }
          paramFromServiceMsg = msgs.get();
          i1 = paramFromServiceMsg.size();
          if (QLog.isColorLevel()) {
            QLog.e("SystemMessageProcessor", 2, "<---handleGetSystemMsgResp : decode pb size = " + i1 + " unreadNum = " + unread_count.get() + " tabDispaly" + Utils.a(msg_display.get()) + " latest_friend_seq" + latest_friend_seq.get() + " latest_group_seq" + latest_group_seq.get() + " following_friend_seq" + following_friend_seq.get() + " following_group_seq" + following_group_seq.get());
          }
          i2 = unread_count.get();
          n = SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          h = 0;
          if (!SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
            break label418;
          }
          if (i2 > 0) {
            break label407;
          }
        } while (i1 <= 0);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(latest_friend_seq.get(), latest_group_seq.get());
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(following_friend_seq.get(), following_group_seq.get());
        return;
        SystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
        if (i1 != 0) {
          break label466;
        }
      } while (n == i2);
      SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i2);
      paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(Conversation.class);
    } while (paramToServiceMsg == null);
    paramToServiceMsg.sendEmptyMessage(1009);
    return;
    label466:
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(latest_friend_seq.get(), latest_group_seq.get());
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(following_friend_seq.get(), following_group_seq.get());
    SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i2);
    bool1 = false;
    if (i2 > n) {
      bool1 = true;
    }
    paramToServiceMsg = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.ap, 0, true, false);
    SystemMsgController.a().a(true);
    SystemMsgController.a().a(false, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    SystemMsgController.a().a(msg_display.get(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    n = 0;
    if (n < i1)
    {
      paramObject = MessageRecordFactory.a(63518);
      msgtype = 63518;
      selfuin = str;
      frienduin = AppConstants.ap;
      senderuin = (getreq_uin.get() + "");
      istroop = 0;
      localObject = (MessageForSystemMsg)paramObject;
      structMsg = ((structmsg.StructMsg)((structmsg.StructMsg)paramFromServiceMsg.get(n)).get());
      i3 = structMsg.msg_type.get();
      i4 = structMsg.msg.sub_type.get();
      if ((i3 == 1) && (!SystemMsgUtils.a(i4))) {}
      for (;;)
      {
        n += 1;
        break;
        msgData = structMsg.toByteArray();
        paramToServiceMsg.add(localObject);
      }
    }
    if (paramToServiceMsg.size() > 0)
    {
      paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      paramObject = String.valueOf(str);
      if ((!MessageHandlerUtils.a(paramToServiceMsg)) || (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop)) {
        break label859;
      }
    }
    label859:
    for (bool2 = true;; bool2 = false)
    {
      paramFromServiceMsg.a(paramToServiceMsg, paramObject, bool2);
      a("handleGetSystemMsgResp", true, i2, bool1, false);
      a(4005, true, null);
      return;
    }
  }
  
  private void e(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    paramToServiceMsg.getServiceCmd();
    long l1 = extraData.getLong("latestFriendSeq");
    long l2 = extraData.getLong("latestGroupSeq");
    long l3 = extraData.getLong("msgSeq");
    extraData.getLong("timeOut");
    extraData.getInt("retryIndex");
    int n = extraData.getInt("type");
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
    if (jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3) == null) {}
    for (;;)
    {
      return;
      if (paramObject == null) {
        continue;
      }
      paramToServiceMsg = new structmsg.RspSystemMsgRead();
      try
      {
        paramToServiceMsg.mergeFrom((byte[])paramObject);
        if (paramToServiceMsg == null) {
          continue;
        }
        int i1 = head.result.get();
        if (i1 == 0) {
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3);
        }
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SystemMessageProcessor", 2, "handleSendSystemMsgReadedReport type =" + n + ";reqSeq=" + l3 + ";resultCode=" + i1 + ";latestFriendSeq=" + l1 + ";latestGroupSeq=" + l2);
        return;
      }
      catch (Exception paramFromServiceMsg)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e("SystemMessageProcessor", 2, "<---handleSendSystemMsgReadedReport :type = " + n + " decode pb:", paramFromServiceMsg);
          }
        }
      }
    }
  }
  
  private void f(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if (paramFromServiceMsg.getUin() == null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    }
    for (;;)
    {
      try
      {
        paramFromServiceMsg = new structmsg.RspSystemMsgAction();
      }
      catch (Exception paramObject)
      {
        int n;
        paramFromServiceMsg = null;
        if (QLog.isColorLevel()) {
          QLog.e("SystemMessageProcessor", 2, "<---handleSendSystemMsgAction : decode pb:", paramObject);
        }
        continue;
        String str = head.msg_fail.get();
        paramObject = str;
        if (str == null) {
          paramObject = "";
        }
        extraData.putString("system_msg_action_resp_error_key", paramObject);
        bool = false;
        continue;
      }
      try
      {
        paramFromServiceMsg.mergeFrom((byte[])paramObject);
        if (paramFromServiceMsg == null) {
          break label300;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SystemMessageProcessor", 2, "handleSendSystemMsgAction result id=" + head.result.get());
        }
        if (head.result.get() != 0) {
          continue;
        }
        bool = true;
        str = msg_detail.get();
        paramObject = str;
        if (str == null) {
          paramObject = "";
        }
        n = -1;
        if (remark_result.has()) {
          n = remark_result.get();
        }
        extraData.putString("system_msg_action_resp_key", paramObject);
        extraData.putInt("system_msg_action_resp_result_code_key", head.result.get());
        extraData.putInt("system_msg_action_resp_type_key", type.get());
        extraData.putString("system_msg_action_resp_invalid_decided_key", msg_invalid_decided.get());
        extraData.putInt("system_msg_action_resp_remark_result_key", n);
      }
      catch (Exception paramObject)
      {
        continue;
        bool = false;
        continue;
      }
      a(4011, bool, paramToServiceMsg);
      return;
      paramFromServiceMsg.getUin();
    }
  }
  
  public List a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    return null;
  }
  
  public void a()
  {
    long l1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47");
    long l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq");
    structmsg.ReqSystemMsgRead localReqSystemMsgRead = new structmsg.ReqSystemMsgRead();
    latest_friend_seq.set(l1);
    latest_group_seq.set(l2);
    if (QLog.isColorLevel()) {
      QLog.d("SystemMessageProcessor", 2, "sendSystemMsgReadedReport latestFriendSeq=" + l1 + ";latestGroupSeq=" + l2);
    }
    a(true, true, false, 0L, new nkv(this, l1, l2, localReqSystemMsgRead));
  }
  
  public void a(int paramInt)
  {
    a(paramInt, 0);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (!MessageHandler.e)
    {
      a(false);
      return;
    }
    Object localObject2 = "ProfileService.Pb.ReqSystemMsgNew";
    Object localObject1 = null;
    int n;
    boolean bool;
    switch (paramInt1)
    {
    default: 
      n = 0;
      bool = false;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.w("Q.systemmsg.", 2, "<---sendGetSystemMsg type=" + paramInt1 + "isHold = " + bool + " latest_friend_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47") + " latest_group_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq"));
      }
      if (bool) {
        break;
      }
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a((String)localObject2);
      structmsg.ReqSystemMsgNew localReqSystemMsgNew = new structmsg.ReqSystemMsgNew();
      msg_num.set(10);
      checktype.set(n);
      latest_friend_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47"));
      latest_group_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq"));
      if (localObject1 != null) {
        flag.set((MessageMicro)localObject1);
      }
      is_get_frd_ribbon.set(false);
      version.set(1000);
      is_get_grp_ribbon.set(false);
      friend_msg_type_flag.set(1L);
      extraData.putInt("getSystemMsgSender", paramInt2);
      ((ToServiceMsg)localObject2).putWupBuffer(localReqSystemMsgNew.toByteArray());
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b((ToServiceMsg)localObject2);
      return;
      if ((FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler)) && (GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler))) {}
      for (bool = true;; bool = false)
      {
        localObject1 = new structmsg.FlagInfo();
        GrpMsg_Kick_Admin.set(1);
        GrpMsg_HiddenGrp.set(1);
        GrpMsg_WordingDown.set(1);
        GrpMsg_GetOfficialAccount.set(1);
        GrpMsg_GetPayInGroup.set(1);
        FrdMsg_GetBusiCard.set(1);
        n = 4;
        localObject2 = "ProfileService.Pb.ReqSystemMsgNew";
        break;
      }
      localObject2 = "ProfileService.Pb.ReqSystemMsgNew.Friend";
      bool = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler);
      localObject1 = new structmsg.FlagInfo();
      FrdMsg_GetBusiCard.set(1);
      n = 2;
      continue;
      bool = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler);
      localObject1 = new structmsg.FlagInfo();
      GrpMsg_Kick_Admin.set(1);
      GrpMsg_HiddenGrp.set(1);
      GrpMsg_WordingDown.set(1);
      GrpMsg_GetOfficialAccount.set(1);
      GrpMsg_GetPayInGroup.set(1);
      n = 3;
      localObject2 = "ProfileService.Pb.ReqSystemMsgNew.Group";
    }
  }
  
  public void a(int paramInt1, long paramLong1, long paramLong2, int paramInt2, int paramInt3, int paramInt4, int paramInt5, structmsg.SystemMsgActionInfo paramSystemMsgActionInfo, int paramInt6)
  {
    a(paramInt1, paramLong1, paramLong2, paramInt2, paramInt3, paramInt4, paramInt5, paramSystemMsgActionInfo, paramInt6, "");
  }
  
  public void a(int paramInt1, long paramLong1, long paramLong2, int paramInt2, int paramInt3, int paramInt4, int paramInt5, structmsg.SystemMsgActionInfo paramSystemMsgActionInfo, int paramInt6, String paramString)
  {
    long l1 = paramInt1 + paramLong1;
    if (QLog.isColorLevel()) {
      QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgAction logStr=" + l1);
    }
    paramString = new structmsg.ReqSystemMsgAction();
    msg_type.set(paramInt1);
    msg_seq.set(paramLong1);
    req_uin.set(paramLong2);
    sub_type.set(paramInt2);
    src_id.set(paramInt3);
    sub_src_id.set(paramInt4);
    group_msg_type.set(paramInt5);
    action_info.set(paramSystemMsgActionInfo);
    language.set(1000);
    paramSystemMsgActionInfo = new ProtoReqManager.ProtoReq();
    paramSystemMsgActionInfo.a();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqSystemMsgAction.Group";
    jdField_a_of_type_ArrayOfByte = paramString.toByteArray();
    paramString = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("ProfileService.Pb.ReqSystemMsgAction.Group");
    paramString.addAttribute("_tag_LOGSTR", String.valueOf(l1));
    extraData.putInt("system_msg_action_type", paramInt6);
    jdField_a_of_type_JavaLangObject = paramString;
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nkt(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramSystemMsgActionInfo);
  }
  
  public void a(int paramInt1, long paramLong1, long paramLong2, int paramInt2, int paramInt3, int paramInt4, int paramInt5, structmsg.SystemMsgActionInfo paramSystemMsgActionInfo, int paramInt6, structmsg.StructMsg paramStructMsg, boolean paramBoolean)
  {
    long l1 = paramInt1 + paramLong1;
    if (QLog.isColorLevel()) {
      QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgAction logStr=" + l1);
    }
    Object localObject = new structmsg.ReqSystemMsgAction();
    msg_type.set(paramInt1);
    msg_seq.set(paramLong1);
    req_uin.set(paramLong2);
    sub_type.set(paramInt2);
    src_id.set(paramInt3);
    sub_src_id.set(paramInt4);
    group_msg_type.set(paramInt5);
    action_info.set(paramSystemMsgActionInfo);
    ProtoReqManager.ProtoReq localProtoReq = new ProtoReqManager.ProtoReq();
    localProtoReq.a();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqSystemMsgAction.Friend";
    jdField_a_of_type_ArrayOfByte = ((structmsg.ReqSystemMsgAction)localObject).toByteArray();
    localObject = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("ProfileService.Pb.ReqSystemMsgAction.Friend");
    ((ToServiceMsg)localObject).addAttribute("_tag_LOGSTR", String.valueOf(l1));
    extraData.putInt("system_msg_action_type", paramInt6);
    extraData.putBoolean("isUncommonlyUsedFrd", paramBoolean);
    jdField_a_of_type_JavaLangObject = localObject;
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nku(this, paramInt6, paramInt3, paramSystemMsgActionInfo, paramStructMsg, paramLong2);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localProtoReq);
  }
  
  public void a(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    case 6004: 
    case 6007: 
    case 6008: 
    default: 
      return;
    case 6002: 
    case 6005: 
      h = 0;
      return;
    case 6001: 
      i = 0;
      return;
    case 6003: 
      j = 0;
      return;
    }
    a(paramToServiceMsg, paramFromServiceMsg);
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 6002: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        b((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 6001: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2], null);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 6003: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        b((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2], null);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 6004: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        c((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 6005: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        d((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 6006: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        e((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 6007: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        f((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length == 3))
    {
      a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
      return;
    }
    a(getClass().getName(), paramInt);
  }
  
  public void a(long paramLong1, int paramInt, byte[] paramArrayOfByte, long paramLong2, long paramLong3, long paramLong4)
  {
    TroopInfo localTroopInfo;
    TroopHandler localTroopHandler;
    if ((paramInt == 85) || (paramInt == 36))
    {
      TroopManager localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
      localTroopInfo = localTroopManager.a(String.valueOf(SystemMsg.getTroopCodeFromTroopSysMsg(paramArrayOfByte)));
      localTroopHandler = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
      if (localTroopInfo != null) {
        break label202;
      }
      localTroopInfo = new TroopInfo();
      troopuin = String.valueOf(SystemMsg.getTroopCodeFromTroopSysMsg(paramArrayOfByte));
      troopcode = String.valueOf(paramLong2);
      localTroopManager.a(localTroopInfo);
      localTroopHandler.a(troopuin, (byte)1, dwTimeStamp, 0);
    }
    label202:
    for (paramArrayOfByte = localTroopInfo;; paramArrayOfByte = localTroopInfo)
    {
      localTroopHandler.a(troopuin, Boolean.valueOf(false));
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "handleTroopSystemMessageResp-->msgTime:" + paramLong3 + ":addFriendTipsMr");
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(troopuin, 1, paramLong3, 10004, true);
      b(2001, true, null);
      return;
    }
  }
  
  public void a(long paramLong1, long paramLong2, int paramInt1, int paramInt2)
  {
    String str = String.valueOf(paramLong2);
    Object localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    FriendListHandler localFriendListHandler = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1);
    if ((paramInt1 == 188) || (paramInt1 == 189))
    {
      bool2 = ((FriendsManager)localObject).b(String.valueOf(str));
      localObject = String.valueOf(str);
      if (paramLong1 == paramLong2)
      {
        bool1 = true;
        localFriendListHandler.a((String)localObject, 0, 10004, null, bool1, false);
        if (!bool2) {
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(str, 0, -1L, 10004, true);
        }
      }
    }
    while (paramInt1 != 190) {
      for (;;)
      {
        boolean bool2;
        return;
        boolean bool1 = false;
      }
    }
    ((FriendsManager)localObject).a(str, false);
  }
  
  public void a(long paramLong1, long paramLong2, short paramShort, int paramInt, msg_comm.Msg paramMsg)
  {
    String str = String.valueOf(paramLong2);
    FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    FriendListHandler localFriendListHandler = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1);
    if ((paramShort == 188) || (paramShort == 189))
    {
      paramMsg = msg_body.get()).msg_content.get().toByteArray();
      paramMsg = SystemMsg.decode(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, HexUtil.a(paramMsg), String.valueOf(str), paramInt);
      if (paramMsg != null)
      {
        paramMsg = strGameName;
        bool = localFriendsManager.b(String.valueOf(str));
        localFriendListHandler.a(String.valueOf(str), 0, 10004, paramMsg, true, false);
        if (!bool) {
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(str, 0, -1L, 10004, true, paramMsg, true);
        }
      }
    }
    while (paramShort != 190) {
      for (;;)
      {
        boolean bool;
        return;
        paramMsg = "";
      }
    }
    localFriendsManager.a(str, false);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if ((paramToServiceMsg == null) || (paramFromServiceMsg == null)) {}
    do
    {
      int n;
      do
      {
        do
        {
          return;
          paramToServiceMsg = new Oidb_0x5cf.RspBody();
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          n = MessageHandler.a(paramFromServiceMsg, paramObject, paramToServiceMsg);
          if (n != 0) {
            break;
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().b(2);
        } while (!QLog.isColorLevel());
        QLog.w("Q.systemmsg.", 2, "<---handleGetDelSingleSysMsg Success!");
        return;
      } while (n == 1);
      paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(SystemMsgListView.class);
      if (paramToServiceMsg != null) {
        paramToServiceMsg.sendEmptyMessage(1016);
      }
    } while (!QLog.isColorLevel());
    QLog.w("Q.systemmsg.", 2, "<---handleGetDelSingleSysMsg Error!");
  }
  
  public void a(String paramString, long paramLong, boolean paramBoolean)
  {
    paramString = paramString + "_" + paramLong;
    jdField_a_of_type_JavaUtilMap.put(paramString, Boolean.valueOf(paramBoolean));
  }
  
  public void a(structmsg.StructMsg paramStructMsg)
  {
    Oidb_0x5cf.ReqBody localReqBody = new Oidb_0x5cf.ReqBody();
    Oidb_0x5cf.DelMsgInfo localDelMsgInfo = new Oidb_0x5cf.DelMsgInfo();
    uint32_version.set(1);
    uint32_type.set(9);
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    uint64_touin.set(Long.parseLong((String)localObject));
    fixed32_sequence.set((int)msg_seq.get());
    uint32_platform.set(2);
    if (msg.sub_type.get() < 2)
    {
      localObject = new Oidb_0x5cf.DelUnDecideInfo();
      uint64_uin.set(req_uin.get());
      rpt_msg_undecide_info.add((MessageMicro)localObject);
    }
    for (;;)
    {
      msg_del_msg_info.set(localDelMsgInfo);
      paramStructMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("OidbSvc.0x5cf_0", 1487, 0, localReqBody.toByteArray());
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramStructMsg);
      return;
      localObject = new Oidb_0x5cf.DelDecideInfo();
      uint64_uin.set(req_uin.get());
      uint32_time.set((int)msg_time.get());
      uint32_req_type.set(msg.sub_type.get());
      rpt_msg_decide_info.add((MessageMicro)localObject);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    boolean bool = SystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler);
    if (QLog.isColorLevel()) {
      QLog.w("SystemMessageProcessor", 2, "<---sendGetSystemMsgOld newMsg=" + paramBoolean + "isHold = " + bool + "latest_friend_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47") + " latest_group_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq"));
    }
    if (bool) {
      return;
    }
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("ProfileService.Pb.ReqSystemMsg");
    extraData.putBoolean("req_pb_protocol_flag", true);
    structmsg.ReqSystemMsg localReqSystemMsg = new structmsg.ReqSystemMsg();
    msg_num.set(10);
    latest_friend_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47"));
    latest_group_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq"));
    localToServiceMsg.putWupBuffer(localReqSystemMsg.toByteArray());
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(localToServiceMsg);
  }
  
  public boolean a(String paramString, long paramLong)
  {
    paramString = paramString + "_" + (1L + paramLong);
    if ((jdField_a_of_type_JavaUtilMap != null) && (jdField_a_of_type_JavaUtilMap.containsKey(paramString))) {
      return ((Boolean)jdField_a_of_type_JavaUtilMap.remove(paramString)).booleanValue();
    }
    return false;
  }
  
  public void b()
  {
    int n = MobileQQService.c;
    MobileQQService.c = n + 1;
    long l1 = n;
    System.currentTimeMillis();
    long l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47");
    long l3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq");
    if (QLog.isColorLevel()) {
      QLog.d("Q.systemmsg.", 2, "sendSystemMsgReadedReport reqSeq=" + l1 + ";latestFriendSeq=" + l2 + ";latestGroupSeq=" + l3);
    }
    structmsg.ReqSystemMsgRead localReqSystemMsgRead = new structmsg.ReqSystemMsgRead();
    latest_friend_seq.set(l2);
    checktype.set(2);
    ProtoReqManager.ProtoReq localProtoReq = new ProtoReqManager.ProtoReq();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqSystemMsgRead.Friend";
    jdField_a_of_type_ArrayOfByte = localReqSystemMsgRead.toByteArray();
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nkw(this, l1, l2, l3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localProtoReq);
  }
  
  public void b(int paramInt)
  {
    b(paramInt, 2);
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    if (!MessageHandler.e)
    {
      a(false);
      return;
    }
    Object localObject2 = "ProfileService.Pb.ReqSystemMsgNew";
    Object localObject1 = null;
    boolean bool;
    switch (paramInt1)
    {
    default: 
      paramInt1 = 0;
      bool = false;
    }
    while (!bool)
    {
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a((String)localObject2);
      structmsg.ReqSystemMsgNew localReqSystemMsgNew = new structmsg.ReqSystemMsgNew();
      msg_num.set(10);
      checktype.set(paramInt1);
      latest_friend_seq.set(0L);
      latest_group_seq.set(0L);
      if (localObject1 != null) {
        flag.set((MessageMicro)localObject1);
      }
      is_get_frd_ribbon.set(false);
      version.set(1000);
      is_get_grp_ribbon.set(false);
      friend_msg_type_flag.set(1L);
      extraData.putInt("getSystemMsgSender", paramInt2);
      ((ToServiceMsg)localObject2).putWupBuffer(localReqSystemMsgNew.toByteArray());
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b((ToServiceMsg)localObject2);
      return;
      if ((FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler)) && (GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler))) {}
      for (bool = true;; bool = false)
      {
        localObject1 = new structmsg.FlagInfo();
        GrpMsg_Kick_Admin.set(1);
        GrpMsg_HiddenGrp.set(1);
        GrpMsg_WordingDown.set(1);
        GrpMsg_GetOfficialAccount.set(1);
        GrpMsg_GetPayInGroup.set(1);
        FrdMsg_GetBusiCard.set(1);
        paramInt1 = 4;
        localObject2 = "ProfileService.Pb.ReqSystemMsgNew";
        break;
      }
      bool = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler);
      localObject1 = new structmsg.FlagInfo();
      FrdMsg_GetBusiCard.set(1);
      paramInt1 = 2;
      localObject2 = "ProfileService.Pb.ReqSystemMsgNew.Friend";
      continue;
      bool = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler);
      localObject1 = new structmsg.FlagInfo();
      GrpMsg_Kick_Admin.set(1);
      GrpMsg_HiddenGrp.set(1);
      GrpMsg_WordingDown.set(1);
      GrpMsg_GetOfficialAccount.set(1);
      GrpMsg_GetPayInGroup.set(1);
      paramInt1 = 3;
      localObject2 = "ProfileService.Pb.ReqSystemMsgNew.Group";
    }
  }
  
  public void b(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 6002: 
    case 6005: 
      if (h < 2)
      {
        h += 1;
        a(4);
        return;
      }
      h = 0;
      return;
    case 6001: 
      if (i < 2)
      {
        i += 1;
        a(2);
        return;
      }
      i = 0;
      return;
    case 6003: 
      if (j < 2)
      {
        j += 1;
        a(3);
        return;
      }
      j = 0;
      return;
    case 6004: 
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "onGetSystemMsgFin time out");
      }
      b(4006, false, null);
      return;
    case 6006: 
      a(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 6007: 
      if (QLog.isColorLevel()) {
        QLog.d("SystemMessageProcessor", 2, "onSendSystemMsgActionError");
      }
      b(4012, false, paramToServiceMsg);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("SystemMessageProcessor", 2, "handleGetDelSingleSysMsg Error!");
    }
    b(4015, false, paramToServiceMsg);
  }
  
  public void c()
  {
    int n = MobileQQService.c;
    MobileQQService.c = n + 1;
    long l1 = n;
    System.currentTimeMillis();
    long l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47");
    long l3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq");
    if (QLog.isColorLevel()) {
      QLog.d("Q.systemmsg.", 2, "sendGroupSystemMsgReadedReport reqSeq=" + l1 + ";latestFriendSeq=" + l2 + ";latestGroupSeq=" + l3);
    }
    structmsg.ReqSystemMsgRead localReqSystemMsgRead = new structmsg.ReqSystemMsgRead();
    latest_group_seq.set(l3);
    checktype.set(3);
    ProtoReqManager.ProtoReq localProtoReq = new ProtoReqManager.ProtoReq();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqSystemMsgRead.Group";
    jdField_a_of_type_ArrayOfByte = localReqSystemMsgRead.toByteArray();
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nkx(this, l1, l2, l3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localProtoReq);
  }
  
  public void d()
  {
    int n = MobileQQService.c;
    MobileQQService.c = n + 1;
    long l1 = n;
    System.currentTimeMillis();
    long l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47");
    long l3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq");
    if (QLog.isColorLevel()) {
      QLog.d("Q.systemmsg.", 2, "clearFriendSystemMsg reqSeq=" + l1 + ";latestFriendSeq=" + l2 + ";latestGroupSeq=" + l3);
    }
    structmsg.ReqSystemMsgRead localReqSystemMsgRead = new structmsg.ReqSystemMsgRead();
    latest_friend_seq.set(l2);
    checktype.set(2);
    type.set(1);
    ProtoReqManager.ProtoReq localProtoReq = new ProtoReqManager.ProtoReq();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqSystemMsgRead.Friend";
    jdField_a_of_type_ArrayOfByte = localReqSystemMsgRead.toByteArray();
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nky(this, l1, l2, l3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localProtoReq);
  }
  
  public void e()
  {
    int n = MobileQQService.c;
    MobileQQService.c = n + 1;
    long l1 = n;
    System.currentTimeMillis();
    long l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47");
    long l3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq");
    if (QLog.isColorLevel()) {
      QLog.d("Q.systemmsg.", 2, "clearGroupSystemMsg reqSeq=" + l1 + ";latestFriendSeq=" + l2 + ";latestGroupSeq=" + l3);
    }
    structmsg.ReqSystemMsgRead localReqSystemMsgRead = new structmsg.ReqSystemMsgRead();
    latest_group_seq.set(l3);
    checktype.set(3);
    type.set(1);
    ProtoReqManager.ProtoReq localProtoReq = new ProtoReqManager.ProtoReq();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqSystemMsgRead.Group";
    jdField_a_of_type_ArrayOfByte = localReqSystemMsgRead.toByteArray();
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nkz(this, l1, l2, l3);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localProtoReq);
  }
  
  public void f()
  {
    long l1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_friend_seq_47");
    long l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("last_group_seq");
    structmsg.ReqSystemMsgRead localReqSystemMsgRead = new structmsg.ReqSystemMsgRead();
    latest_friend_seq.set(l1);
    latest_group_seq.set(l2);
    type.set(1);
    if (QLog.isColorLevel()) {
      QLog.d("SystemMessageProcessor", 2, "clearSystemMsg latestFriendSeq=" + l1 + ";latestGroupSeq=" + l2);
    }
    a(true, true, false, 0L, new nla(this, l1, l2, localReqSystemMsgRead));
  }
  
  public void g()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("ProfileService.Pb.ReqNextSystemMsg");
    if (QLog.isColorLevel()) {
      QLog.w("Q.systemmsg.", 2, "<---sendGetNextOldSystemMsgfollowing_friend_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_friend_seq_47") + "following_group_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_group_seq"));
    }
    structmsg.ReqNextSystemMsg localReqNextSystemMsg = new structmsg.ReqNextSystemMsg();
    extraData.putBoolean("req_pb_protocol_flag", true);
    msg_num.set(10);
    version.set(1000);
    following_friend_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_friend_seq_47"));
    following_group_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_group_seq"));
    localToServiceMsg.putWupBuffer(localReqNextSystemMsg.toByteArray());
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(localToServiceMsg);
  }
  
  public void h()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("ProfileService.Pb.ReqNextSystemMsg.Friend");
    if (QLog.isColorLevel()) {
      QLog.w("Q.systemmsg.", 2, "<---sendGetNextFriendSystemMsgfollowing_friend_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_friend_seq_47"));
    }
    structmsg.ReqNextSystemMsg localReqNextSystemMsg = new structmsg.ReqNextSystemMsg();
    msg_num.set(10);
    following_friend_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_friend_seq_47"));
    checktype.set(2);
    version.set(1000);
    ProtoReqManager.ProtoReq localProtoReq = new ProtoReqManager.ProtoReq();
    localProtoReq.a();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqNextSystemMsg.Friend";
    jdField_a_of_type_ArrayOfByte = localReqNextSystemMsg.toByteArray();
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nlb(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localProtoReq);
  }
  
  public void i()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("ProfileService.Pb.ReqNextSystemMsg.Group");
    if (QLog.isColorLevel()) {
      QLog.w("Q.systemmsg.", 2, "<---sendGetNextGroupSystemMsgfollowing_group_seq = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_group_seq"));
    }
    structmsg.ReqNextSystemMsg localReqNextSystemMsg = new structmsg.ReqNextSystemMsg();
    msg_num.set(10);
    following_group_seq.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d("following_group_seq"));
    checktype.set(3);
    version.set(1000);
    Object localObject = new structmsg.FlagInfo();
    GrpMsg_Kick_Admin.set(1);
    GrpMsg_WordingDown.set(1);
    GrpMsg_GetOfficialAccount.set(1);
    GrpMsg_GetPayInGroup.set(1);
    flag.set((MessageMicro)localObject);
    localObject = new ProtoReqManager.ProtoReq();
    ((ProtoReqManager.ProtoReq)localObject).a();
    jdField_a_of_type_JavaLangString = "ProfileService.Pb.ReqNextSystemMsg.Group";
    jdField_a_of_type_ArrayOfByte = localReqNextSystemMsg.toByteArray();
    jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack = new nks(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((ProtoReqManager.ProtoReq)localObject);
  }
}
