package com.tencent.mobileqq.app.message;

import ActionMsg.MsgBody;
import IMMsgBodyPack.MsgType0x210;
import OnlinePushPack.MsgInfo;
import PushNotifyPack.RequestPushNotify;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.bitapp.BitAppMsg;
import com.tencent.bitapp.MessageForBitApp;
import com.tencent.mobileqq.apollo.utils.ApolloUtil;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.AppShareID;
import com.tencent.mobileqq.data.MessageForApollo;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.SubAccountMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.gamecenter.GameCenterPackeger;
import com.tencent.mobileqq.service.message.DecodeProtoPkgContext;
import com.tencent.mobileqq.service.message.MessageProtoCodec;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.servlet.GetSubAccountUnreadIntent;
import com.tencent.mobileqq.servlet.QzoneSubAccountUnreadServlet;
import com.tencent.mobileqq.servlet.QzoneSubAccountUnreadServlet.GetSubAccountUnreadResponse;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.subaccount.SubAccountControll;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.subaccount.logic.SubAccountBackProtocData;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.ActionMsgUtil;
import com.tencent.mobileqq.utils.AppShareIDUtil;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.util.QZoneLogTags;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mqq.app.MobileQQ;
import msf.msgcomm.msg_comm.Msg;
import msf.msgcomm.msg_comm.MsgHead;
import msf.msgcomm.msg_comm.UinPairMsg;
import msf.msgsvc.msg_svc.PbBindUinGetMsgReq;
import msf.msgsvc.msg_svc.PbBindUinMsgReadedConfirmReq;
import msf.msgsvc.msg_svc.PbBindUinMsgReadedConfirmResp;
import msf.msgsvc.msg_svc.PbGetMsgResp;
import nkp;
import nkq;
import tencent.im.msg.im_msg_body.MsgBody;
import tencent.im.msg.im_msg_body.NotOnlineFile;
import tencent.im.msg.im_msg_body.RichText;
import tencent.im.msgsync.cmd0x100.Submsgtype0x8a.ReqBody;

public class SubAccountMessageProcessor
  extends C2CMessageProcessor
{
  public SubAccountMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    String str1;
    if (paramToServiceMsg == null) {
      str1 = "null";
    }
    for (;;)
    {
      String str2;
      label16:
      int i;
      long l;
      Object localObject2;
      msg_svc.PbBindUinMsgReadedConfirmResp localPbBindUinMsgReadedConfirmResp;
      Object localObject1;
      int j;
      if (paramToServiceMsg == null)
      {
        str2 = "null";
        i = -1;
        l = 0L;
        localObject2 = null;
        paramFromServiceMsg = null;
        localPbBindUinMsgReadedConfirmResp = new msg_svc.PbBindUinMsgReadedConfirmResp();
        localObject1 = localObject2;
        j = i;
      }
      try
      {
        paramObject = (msg_svc.PbBindUinMsgReadedConfirmResp)localPbBindUinMsgReadedConfirmResp.mergeFrom((byte[])paramObject);
        localObject1 = localObject2;
        j = i;
        i = result.get();
        localObject1 = localObject2;
        j = i;
        if (sync_cookie.has())
        {
          localObject1 = localObject2;
          j = i;
          paramFromServiceMsg = sync_cookie.get().toByteArray();
        }
        localObject1 = paramFromServiceMsg;
        j = i;
        if (bind_uin.has())
        {
          localObject1 = paramFromServiceMsg;
          j = i;
          l = bind_uin.get();
        }
        localObject1 = paramFromServiceMsg;
        j = i;
        if (errmsg.has())
        {
          localObject1 = paramFromServiceMsg;
          j = i;
          paramObject = errmsg.get();
          localObject2 = paramObject;
          localObject1 = paramFromServiceMsg;
          j = i;
        }
      }
      catch (Exception localException1)
      {
        for (;;)
        {
          try
          {
            if (QLog.isColorLevel())
            {
              localObject2 = new StringBuilder().append("handleConfirmSubAccountMsgNumReaded() subUin=").append(str2).append(" lSubUin=").append(l).append(" errMsg=").append(paramObject).append(" cookie=");
              if (paramFromServiceMsg == null)
              {
                localObject1 = "null";
                QLog.d("SUB_ACCOUNT", 2, localObject1);
                j = i;
                localObject1 = paramFromServiceMsg;
                localObject2 = paramObject;
              }
            }
            else
            {
              if (QLog.isColorLevel())
              {
                paramFromServiceMsg = new StringBuilder().append("handleConfirmSubAccountMsgNumReaded() ssoSeq:");
                if (paramToServiceMsg != null) {
                  continue;
                }
                paramToServiceMsg = "null";
                paramFromServiceMsg = paramFromServiceMsg.append(paramToServiceMsg).append(" result=").append(j).append(" syncCookie=");
                if (localObject1 != null) {
                  continue;
                }
                paramToServiceMsg = "null";
                QLog.d("SUB_ACCOUNT", 2, paramToServiceMsg + " errms=" + String.valueOf(localObject2));
              }
              boolean bool = false;
              if (j == 0)
              {
                paramToServiceMsg = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
                if (paramToServiceMsg != null) {
                  paramToServiceMsg.a(str2, (byte[])localObject1);
                }
                bool = true;
              }
              a(8011, bool, new String[] { str2, str1 });
              return;
              str1 = extraData.getString("nextAction");
              break;
              str2 = extraData.getString("subAccount");
              break label16;
            }
            j = paramFromServiceMsg.length;
            localObject1 = Integer.valueOf(j);
            continue;
            localException1 = localException1;
            paramObject = null;
            i = j;
            paramFromServiceMsg = (FromServiceMsg)localObject1;
          }
          catch (Exception localException2)
          {
            continue;
          }
          localObject2 = paramObject;
          localObject1 = paramFromServiceMsg;
          j = i;
          if (QLog.isColorLevel())
          {
            QLog.e("SUB_ACCOUNT", 2, "handleConfirmSubAccountMsgNumReaded() decode pb:", localException1);
            localObject2 = paramObject;
            localObject1 = paramFromServiceMsg;
            j = i;
            continue;
            paramToServiceMsg = Integer.valueOf(paramToServiceMsg.getRequestSsoSeq());
            continue;
            paramToServiceMsg = Integer.toString(localObject1.length);
            continue;
            paramObject = null;
          }
        }
      }
    }
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    SubAccountBackProtocData localSubAccountBackProtocData = new SubAccountBackProtocData();
    String str1 = extraData.getString("subAccount");
    String str2 = paramToServiceMsg.getUin();
    b = str2;
    jdField_c_of_type_JavaLangString = str1;
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "subaccount cmd= CMD_MESSAGESERVICE_GETSUBACCOUNTMSG_PB handleGetSubC2CMessageResp_PB subUin=" + str1);
    }
    Object localObject1 = new msg_svc.PbGetMsgResp();
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("printPBuffer", 2, HexUtil.a((byte[])paramObject));
      }
      paramObject = (msg_svc.PbGetMsgResp)((msg_svc.PbGetMsgResp)localObject1).mergeFrom((byte[])paramObject);
    }
    catch (Exception paramObject)
    {
      for (;;)
      {
        StringBuilder localStringBuilder;
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.C2CMessageProcessor", 2, "subaccount <---handleGetSubC2CMessageResp_PB : decode pb:", paramObject);
        }
        paramObject = null;
        continue;
        localObject1 = Integer.valueOf(paramToServiceMsg.getRequestSsoSeq());
        continue;
        localObject1 = Integer.valueOf(result.get());
        continue;
        localObject1 = Boolean.valueOf(sync_cookie.has());
        continue;
        localObject1 = Integer.valueOf(sync_flag.get());
      }
      localSubAccountManager = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
      if (!result.has()) {
        break label417;
      }
    }
    if (QLog.isColorLevel())
    {
      localStringBuilder = new StringBuilder().append("subaccount <---handleGetSubC2CMessageResp_PB ssoSeq:");
      if (paramToServiceMsg == null)
      {
        localObject1 = "null";
        localStringBuilder = localStringBuilder.append(localObject1).append(" msgStruct.cReplyCode: ");
        if (paramObject != null) {
          break label338;
        }
        localObject1 = "null";
        localStringBuilder = localStringBuilder.append(localObject1).append(",hasSyncCookie:");
        if (paramObject != null) {
          break label353;
        }
        localObject1 = "null";
        localStringBuilder = localStringBuilder.append(localObject1).append(",syncFlag:");
        if (paramObject != null) {
          break label368;
        }
        localObject1 = "null";
        QLog.d("SUB_ACCOUNT", 2, localObject1);
      }
    }
    else
    {
      if (paramObject != null) {
        break label383;
      }
      paramToServiceMsg = new HashMap();
      paramToServiceMsg.put("param_FailCode", "12014");
      paramToServiceMsg.put("fail_step", "getmsgresp_null");
      paramToServiceMsg.put("fail_location", "MessageHandler");
      StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBGetMsg", false, 0L, 0L, paramToServiceMsg, "");
      a(8003, false, localSubAccountBackProtocData);
      return;
    }
    label338:
    label353:
    label368:
    label383:
    SubAccountManager localSubAccountManager;
    label417:
    int i;
    if (result.get() != 0)
    {
      i = result.get();
      if (QLog.isColorLevel()) {
        QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB rspResult = " + i);
      }
      paramToServiceMsg = new HashMap();
      paramToServiceMsg.put("param_FailCode", "12015");
      paramToServiceMsg.put("fail_step", "result_" + i);
      paramToServiceMsg.put("fail_location", "MessageHandler");
      StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBGetMsg", false, 0L, 0L, paramToServiceMsg, "");
      if (i <= 100) {
        break label5277;
      }
      i -= 100;
    }
    label1893:
    label1894:
    label2082:
    label2660:
    label2699:
    label3843:
    label4036:
    label4044:
    label4199:
    label4664:
    label4679:
    label4685:
    label4692:
    label5158:
    label5186:
    label5227:
    label5230:
    label5277:
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB really rspResult = " + i);
      }
      boolean bool1;
      switch (i)
      {
      default: 
        if ((i == 1200) || (i == 1214) || (i == 1215) || (i == 1218) || (i == 1232) || (i == 1233) || (i == 1240) || (i == 1241) || (i == 1242) || (i == 1221))
        {
          p = 1004;
          q = i;
          jdField_a_of_type_JavaLangString = errmsg.get();
          jdField_c_of_type_Boolean = true;
          SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (byte)0, str1);
          SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str1, 6);
          d = true;
          localSubAccountManager.a(str1, null, true);
          bool1 = localSubAccountManager.a(str1, 3);
          localSubAccountManager.a(str1, i, errmsg.get());
          localSubAccountManager.e(str1);
          if (bool1)
          {
            i = 1 - jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(str1, 7000);
            if (i != 0)
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(str1, 7000, i);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new String[] { AppConstants.ag, str1 });
            }
            if (QLog.isColorLevel()) {
              QLog.d("SUB_ACCOUNT", 2, "processSubAccountMessage() hint need to verify,msg num=1, subUin=" + str1);
            }
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.updateSubAccountLogin(str1, false);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().refreAccountList();
        }
        break;
      }
      for (;;)
      {
        a(8003, false, localSubAccountBackProtocData);
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB getMsgResp == null || !getMsgResp.result.has() || getMsgResp.result.get() != 0 ");
        return;
        p = 1008;
        SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "sub.uin.all");
        continue;
        p = 1002;
        SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (byte)0, str1);
        SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str1);
        continue;
        p = 1006;
        continue;
        p = 1000;
      }
      localSubAccountManager.a(str1, 1);
      localObject1 = paramFromServiceMsg.getUin();
      long l2 = -1L;
      try
      {
        l1 = Long.parseLong(str1);
        if (localObject1 == null)
        {
          a(8003, false, localSubAccountBackProtocData);
          if (QLog.isColorLevel()) {
            QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB tmpBackUin == null ");
          }
          paramToServiceMsg = new HashMap();
          paramToServiceMsg.put("param_FailCode", "12014");
          paramToServiceMsg.put("fail_step", "backuin_null");
          paramToServiceMsg.put("fail_location", "MessageHandler");
          StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBGetMsg", false, 0L, 0L, paramToServiceMsg, "");
          return;
        }
      }
      catch (Exception localException3)
      {
        long l1;
        for (;;)
        {
          localException3.printStackTrace();
          l1 = l2;
          if (QLog.isColorLevel())
          {
            QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB subAccount parselong error ");
            l1 = l2;
          }
        }
        try
        {
          l2 = Long.valueOf(paramFromServiceMsg.getUin()).longValue();
          if (l2 == -1L)
          {
            a(8003, false, localSubAccountBackProtocData);
            if (QLog.isColorLevel()) {
              QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB selfUin == -1 ");
            }
            paramToServiceMsg = new HashMap();
            paramToServiceMsg.put("param_FailCode", "12014");
            paramToServiceMsg.put("fail_step", "selfUin_null");
            paramToServiceMsg.put("fail_location", "MessageHandler");
            StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBGetMsg", false, 0L, 0L, paramToServiceMsg, "");
            return;
          }
        }
        catch (Exception paramFromServiceMsg)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB selfUin parselong error ");
            }
            l2 = -1L;
          }
          if (sync_cookie.has()) {}
          for (byte[] arrayOfByte = sync_cookie.get().toByteArray();; arrayOfByte = null)
          {
            if (sync_flag.has()) {}
            for (int j = sync_flag.get();; j = 2)
            {
              byte b;
              int k;
              if (j < 2)
              {
                b = (byte)1;
                k = 0;
              }
              for (;;)
              {
                if (bind_uin.has()) {}
                for (long l3 = bind_uin.get();; l3 = 0L)
                {
                  if (localSubAccountManager != null) {}
                  for (List localList1 = localSubAccountManager.a(Long.toString(l3));; localList1 = null)
                  {
                    ArrayList localArrayList = extraData.getStringArrayList("hadGetMsgListUin");
                    if (localArrayList == null) {
                      localArrayList = new ArrayList();
                    }
                    for (;;)
                    {
                      HashMap localHashMap = new HashMap();
                      List localList2 = uin_pair_msgs.get();
                      int m = 0;
                      if (m < localList2.size())
                      {
                        paramFromServiceMsg = (msg_comm.UinPairMsg)localList2.get(m);
                        long l6 = peer_uin.get();
                        long l4 = last_read_time.get();
                        paramObject = msg.get();
                        if (k == 0) {
                          localArrayList.add(Long.toString(l6));
                        }
                        int n = unread_msg_num.get();
                        if (QLog.isColorLevel()) {
                          QLog.d("SUB_ACCOUNT", 2, "subaccount <---handleGetSubC2CMessageResp_PB pkgPeerUi cc n:" + l6);
                        }
                        if ((paramObject == null) || (paramObject.size() == 0) || (n == 0))
                        {
                          if (QLog.isColorLevel()) {
                            QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB msgList == null || msgList.size() == 0 msg is null " + l6);
                          }
                          if (localList1 != null)
                          {
                            paramFromServiceMsg = localList1.iterator();
                            while (paramFromServiceMsg.hasNext())
                            {
                              paramObject = (SubAccountMessage)paramFromServiceMsg.next();
                              if (paramObject != null)
                              {
                                paramObject = frienduin;
                                if ((paramObject != null) && (paramObject.equalsIgnoreCase(String.valueOf(l6))))
                                {
                                  localArrayList.add(String.valueOf(l6));
                                  localHashMap.put(String.valueOf(l6), Integer.valueOf(n));
                                }
                              }
                            }
                          }
                        }
                        DecodeProtoPkgContext localDecodeProtoPkgContext;
                        do
                        {
                          m += 1;
                          break;
                          if (QLog.isColorLevel()) {
                            QLog.d("SUB_ACCOUNT", 2, "subaccount <---handleGetSubC2CMessageResp_PB pkgPeerUin:" + l6 + ",msgList size:" + paramObject.size());
                          }
                          localDecodeProtoPkgContext = new DecodeProtoPkgContext(l1, l6, false, false, false, true);
                        } while ((paramObject == null) || (paramObject.size() <= 0));
                        Collections.sort(paramObject, new nkp(this));
                        Iterator localIterator1;
                        if ((msg_completed.has()) && (msg_completed.get() != 0))
                        {
                          bool1 = true;
                          if (QLog.isColorLevel()) {
                            QLog.d("SUB_ACCOUNT", 2, "subaccount <---handleGetSubC2CMessageResp_PB pkgPeerUin:" + l6 + "msgList size: " + paramObject.size() + ",uMsgCompleted:" + bool1 + ",lastReadTime:" + (l4 & 0xFFFFFFFF));
                          }
                          localIterator1 = paramObject.iterator();
                          break label2082;
                        }
                        msg_comm.Msg localMsg;
                        int i1;
                        for (;;)
                        {
                          if (!localIterator1.hasNext()) {
                            break label4664;
                          }
                          localMsg = (msg_comm.Msg)localIterator1.next();
                          if (localMsg != null)
                          {
                            localObject1 = (msg_comm.MsgHead)msg_head.get();
                            i = msg_type.get();
                            paramObject = null;
                            i1 = msg_head.get()).c2c_cmd.get();
                            if ((193 == i) || (734 == i)) {
                              if (l1 == l6) {
                                paramFromServiceMsg = paramObject;
                              }
                            }
                            for (;;)
                            {
                              if ((paramFromServiceMsg != null) && (!paramFromServiceMsg.isEmpty()) && (localList1 != null) && (!localList1.isEmpty()) && (get0time < get0time)) {
                                paramFromServiceMsg.clear();
                              }
                              if ((paramFromServiceMsg != null) && (paramFromServiceMsg.size() != 0)) {
                                break label2660;
                              }
                              if (localList1 == null) {
                                break label1894;
                              }
                              paramFromServiceMsg = localList1.iterator();
                              if (!paramFromServiceMsg.hasNext()) {
                                break label1894;
                              }
                              paramObject = (SubAccountMessage)paramFromServiceMsg.next();
                              if (paramObject == null) {
                                break label1893;
                              }
                              paramObject = frienduin;
                              if ((paramObject == null) || (!paramObject.equalsIgnoreCase(String.valueOf(l6)))) {
                                break label1893;
                              }
                              localArrayList.add(String.valueOf(l6));
                              localHashMap.put(String.valueOf(l6), Integer.valueOf(n));
                              break label1894;
                              bool1 = false;
                              break;
                              paramFromServiceMsg = new ArrayList();
                              paramObject = MessageRecordFactory.a(193);
                              selfuin = String.valueOf(l1);
                              frienduin = String.valueOf(l6);
                              senderuin = String.valueOf(l6);
                              shmsgseq = msg_seq.get();
                              msgUid = msg_uid.get();
                              time = msg_time.get();
                              istroop = 0;
                              msg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369829);
                              msgtype = 193;
                              paramFromServiceMsg.add(paramObject);
                              continue;
                              if ((MessageUtils.c(i)) && (c2c_cmd.has()) && ((i1 == 169) || (i1 == 241) || (i1 == 242) || (i1 == 243) || (i1 == 129) || (i1 == 131) || (i1 == 133)))
                              {
                                if ((i1 == 129) || (i1 == 131) || (i1 == 133) || (i1 == 135) || (i1 == 243)) {
                                  break label1894;
                                }
                                for (;;)
                                {
                                  try
                                  {
                                    paramFromServiceMsg = msg_body.get()).rich_text.get()).not_online_file.get()).bytes_file_name.get().toStringUtf8();
                                    paramObject = paramFromServiceMsg;
                                  }
                                  catch (Exception paramObject)
                                  {
                                    try
                                    {
                                      if (QLog.isColorLevel())
                                      {
                                        QLog.d("SUB_ACCOUNT", 2, "fileName = " + paramFromServiceMsg);
                                        paramObject = paramFromServiceMsg;
                                      }
                                      paramFromServiceMsg = paramObject;
                                      if (TextUtils.isEmpty(paramObject)) {
                                        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369484);
                                      }
                                      paramObject = MessageRecordFactory.a(63531);
                                      selfuin = String.valueOf(l1);
                                      frienduin = String.valueOf(l6);
                                      senderuin = String.valueOf(l6);
                                      shmsgseq = msg_seq.get();
                                      msgUid = msg_uid.get();
                                      time = msg_time.get();
                                      istroop = 0;
                                      msg = paramFromServiceMsg;
                                      msgtype = 63531;
                                      paramFromServiceMsg = new ArrayList();
                                      paramFromServiceMsg.add(paramObject);
                                    }
                                    catch (Exception paramObject)
                                    {
                                      for (;;)
                                      {
                                        StringBuffer localStringBuffer;
                                        MessageRecord localMessageRecord1;
                                        long l5;
                                        Iterator localIterator2;
                                        MessageRecord localMessageRecord2;
                                        Object localObject3;
                                        boolean bool2;
                                        continue;
                                        paramFromServiceMsg = null;
                                        continue;
                                        continue;
                                        paramFromServiceMsg = paramObject;
                                        continue;
                                        i = 0;
                                      }
                                    }
                                    paramObject = paramObject;
                                    paramFromServiceMsg = null;
                                  }
                                  paramObject.printStackTrace();
                                  paramObject = paramFromServiceMsg;
                                }
                              }
                              try
                              {
                                paramFromServiceMsg = a(localMsg, localDecodeProtoPkgContext);
                              }
                              catch (Exception localException1)
                              {
                                paramFromServiceMsg = paramObject;
                              }
                              if (QLog.isColorLevel())
                              {
                                QLog.w("Q.msg.C2CMessageProcessor", 2, "decodeSinglePBMsg_C2C error,", localException1);
                                paramFromServiceMsg = paramObject;
                              }
                            }
                            localStringBuffer = new StringBuffer();
                            localMessageRecord1 = (MessageRecord)paramFromServiceMsg.get(0);
                            l5 = time;
                            localIterator2 = paramFromServiceMsg.iterator();
                            bool1 = false;
                            do
                            {
                              if (!localIterator2.hasNext()) {
                                break;
                              }
                              localMessageRecord2 = (MessageRecord)localIterator2.next();
                            } while (localMessageRecord2 == null);
                            paramObject = msg;
                            if (paramObject != null) {}
                            try
                            {
                              if (QLog.isColorLevel()) {
                                QLog.d("SUB_ACCOUNT", 2, "subaccount handleGetSubC2CMessageResp_PB  basemsg  = ");
                              }
                              if (frienduin == null) {
                                break label2699;
                              }
                              if (String.valueOf(AppConstants.ap).equalsIgnoreCase(frienduin))
                              {
                                paramFromServiceMsg = SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramObject, msgtype, senderuin);
                                if (paramFromServiceMsg == null)
                                {
                                  i = 1;
                                  if ((localStringBuffer != null) && (localStringBuffer.length() != 0)) {
                                    break label3843;
                                  }
                                  if (!QLog.isColorLevel()) {
                                    continue;
                                  }
                                  QLog.d("SUB_ACCOUNT", 2, "subaccount <---handleGetSubC2CMessageResp_PB show == null || show.length() == 0; msg is not decode success.");
                                }
                              }
                            }
                            catch (Exception paramFromServiceMsg)
                            {
                              for (;;)
                              {
                                paramFromServiceMsg.printStackTrace();
                                continue;
                                localStringBuffer.append(paramFromServiceMsg);
                                i = 1;
                              }
                              switch (msgtype)
                              {
                              }
                            }
                          }
                        }
                        for (;;)
                        {
                          try
                          {
                            if (!ActionMsgUtil.a(msgtype)) {
                              continue;
                            }
                            localObject2 = ActionMsgUtil.a(msg);
                            paramFromServiceMsg = paramObject;
                            if (localObject2 != null)
                            {
                              if ((actMsgContentValue == null) || (actMsgContentValue.length() <= 0)) {
                                continue;
                              }
                              paramFromServiceMsg = actMsgContentValue;
                            }
                          }
                          catch (Exception localException2)
                          {
                            Object localObject2;
                            paramObject = null;
                            localException2.printStackTrace();
                            paramFromServiceMsg = paramObject;
                            if (!QLog.isColorLevel()) {
                              continue;
                            }
                            QLog.d("SUB_ACCOUNT", 2, "subaccount handlerMsgPB, MSG_TYPE_PUBLIC_ACCOUNT error e = " + localException2.getMessage());
                            paramFromServiceMsg = paramObject;
                            continue;
                          }
                          paramObject = paramFromServiceMsg;
                          if (paramFromServiceMsg == null) {
                            paramObject = "";
                          }
                          localStringBuffer.append(paramObject);
                          break;
                          if (!(localMessageRecord2 instanceof MessageForStructing)) {
                            break label5230;
                          }
                          paramFromServiceMsg = (MessageForStructing)localMessageRecord2;
                          if (structingMsg == null) {
                            break label5230;
                          }
                          paramFromServiceMsg = structingMsg.mMsgBrief;
                          if (!TextUtils.isEmpty(paramFromServiceMsg)) {
                            break label5227;
                          }
                          paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131370265);
                          continue;
                          localObject2 = paramObject;
                          if ((localMessageRecord2 instanceof MessageForBitApp))
                          {
                            paramFromServiceMsg = (MessageForBitApp)localMessageRecord2;
                            localObject2 = paramObject;
                            if (bitAppMsg != null) {
                              localObject2 = bitAppMsg.mMsgBrief;
                            }
                          }
                          paramFromServiceMsg = (FromServiceMsg)localObject2;
                          if (!TextUtils.isEmpty((CharSequence)localObject2)) {
                            continue;
                          }
                          paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131361792);
                          continue;
                          paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369480);
                          continue;
                          localObject2 = msg;
                          paramFromServiceMsg = null;
                          paramObject = paramFromServiceMsg;
                          try
                          {
                            if (!TextUtils.isEmpty((CharSequence)localObject2))
                            {
                              localObject2 = ((String)localObject2).split("/");
                              paramObject = paramFromServiceMsg;
                              if (localObject2 != null)
                              {
                                paramObject = paramFromServiceMsg;
                                if (localObject2.length > 0)
                                {
                                  localObject2 = localObject2[(localObject2.length - 1)].split("\\|");
                                  paramObject = paramFromServiceMsg;
                                  if (localObject2 != null)
                                  {
                                    paramObject = paramFromServiceMsg;
                                    if (localObject2.length > 0) {
                                      paramObject = localObject2[0];
                                    }
                                  }
                                }
                              }
                            }
                          }
                          catch (Exception paramObject)
                          {
                            paramObject.printStackTrace();
                            paramObject = paramFromServiceMsg;
                            continue;
                            paramFromServiceMsg = paramObject;
                            if (paramObject.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369484))) {
                              continue;
                            }
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369484) + paramObject;
                            continue;
                          }
                          if (TextUtils.isEmpty(paramObject))
                          {
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369484);
                          }
                          else
                          {
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131369482);
                            continue;
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131370104);
                            continue;
                            paramFromServiceMsg = (MessageForApollo)localMessageRecord2;
                            paramFromServiceMsg = "[动作]" + ApolloUtil.a(paramFromServiceMsg);
                            continue;
                            paramFromServiceMsg = paramObject;
                            if (!(localMessageRecord2 instanceof MessageForPubAccount)) {
                              continue;
                            }
                            if ("2010741172".equals(senderuin)) {
                              bool1 = true;
                            }
                            try
                            {
                              paramObject = mPAMessage;
                              if (paramObject == null)
                              {
                                paramFromServiceMsg = null;
                                continue;
                              }
                              paramFromServiceMsg = items.get(0)).title;
                              if ((items.get(0)).cover == null) && (items.get(0)).digestList != null))
                              {
                                paramFromServiceMsg = paramFromServiceMsg + "：" + (String)items.get(0)).digestList.get(0);
                                continue;
                              }
                              continue;
                            }
                            catch (Exception paramObject)
                            {
                              paramFromServiceMsg = null;
                              paramObject.printStackTrace();
                              if (QLog.isColorLevel()) {
                                QLog.d("SUB_ACCOUNT", 2, "subaccount handlerMsgPB, MSG_TYPE_PUBLIC_ACCOUNT error e = " + paramObject.getMessage());
                              }
                            }
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppShareIDUtil.a(shareAppID));
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131369822) + messagetail + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131369823);
                            continue;
                            paramFromServiceMsg = paramObject;
                            if (!ActionMsgUtil.b(msgtype))
                            {
                              paramFromServiceMsg = paramObject;
                              if (msg != null)
                              {
                                paramFromServiceMsg = paramObject;
                                if (msg.indexOf("http://maps.google.com/maps?q=") != -1)
                                {
                                  localObject2 = MessageUtils.a(msg);
                                  paramObject = "";
                                  paramFromServiceMsg = paramObject;
                                  if (localObject2 != null)
                                  {
                                    paramFromServiceMsg = paramObject;
                                    if (localObject2[2] != null) {
                                      paramFromServiceMsg = localObject2[2];
                                    }
                                  }
                                  paramFromServiceMsg = "[" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367825) + "] " + paramFromServiceMsg;
                                }
                              }
                            }
                          }
                        }
                        if ((localList1 != null) && (i == 0))
                        {
                          paramFromServiceMsg = localList1.iterator();
                          while (paramFromServiceMsg.hasNext())
                          {
                            paramObject = (SubAccountMessage)paramFromServiceMsg.next();
                            if (paramObject != null)
                            {
                              paramObject = frienduin;
                              if ((paramObject != null) && (paramObject.equalsIgnoreCase(String.valueOf(l6)))) {
                                localArrayList.add(String.valueOf(l6));
                              }
                            }
                          }
                        }
                        paramFromServiceMsg = (msg_comm.MsgHead)msg_head.get();
                        if ((paramFromServiceMsg != null) && (from_nick.has()))
                        {
                          paramFromServiceMsg = from_nick.get();
                          if (i != 0) {
                            paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131368846);
                          }
                          if (QLog.isColorLevel()) {
                            QLog.d("SUB_ACCOUNT", 2, "sub.account.msg isQQMail=" + bool1);
                          }
                          jdField_c_of_type_Boolean = true;
                          localObject3 = new SubAccountMessage();
                          if (i != 0)
                          {
                            frienduin = String.valueOf(AppConstants.ap);
                            if (!bool1) {
                              break label4679;
                            }
                            bool2 = true;
                            isread = bool2;
                            msg = localStringBuffer.toString();
                            extInt = extInt;
                            extLong = extLong;
                            extraflag = extraflag;
                            extStr = extStr;
                            istroop = istroop;
                            isValid = isValid;
                            longMsgCount = longMsgCount;
                            longMsgId = longMsgId;
                            longMsgIndex = longMsgIndex;
                            msgUid = msgUid;
                            shmsgseq = shmsgseq;
                            uniseq = uniseq;
                            msgseq = msgseq;
                            if (!bool1) {
                              break label4685;
                            }
                            i = 0;
                            unreadNum = i;
                            msgtype = 64536;
                            selfuin = String.valueOf(l2);
                            if (paramFromServiceMsg != null)
                            {
                              paramObject = paramFromServiceMsg;
                              if (paramFromServiceMsg.length() != 0) {}
                            }
                            else
                            {
                              paramObject = frienduin;
                            }
                            sendername = paramObject;
                            senderuin = String.valueOf(l6);
                            subUin = Long.toString(l3);
                            if (l5 != 0L) {
                              break label4692;
                            }
                          }
                          for (l4 = System.currentTimeMillis() / 1000L;; l4 = l5)
                          {
                            time = l4;
                            needNotify = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Pause;
                            mTimeString = TimeFormatterUtils.a(1000L * l5, true, SubAccountControll.jdField_c_of_type_JavaLangString);
                            mEmoRecentMsg = new QQText(msg, 3, 16);
                            if (localSubAccountManager != null) {
                              localSubAccountManager.a((SubAccountMessage)localObject3);
                            }
                            if (QLog.isColorLevel())
                            {
                              QLog.d("SUB_ACCOUNT", 2, "subaccount set msg read false hasData = false  unreadNum=" + unreadNum);
                              if (!TextUtils.isEmpty(msg)) {
                                QLog.d("SUB_ACCOUNT", 2, "msg=" + msg.charAt(0));
                              }
                            }
                            SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str1, 6);
                            d = true;
                            paramFromServiceMsg = MessageRecordFactory.a(msgtype);
                            MessageRecord.copyMessageRecordBaseField(paramFromServiceMsg, localMessageRecord1);
                            istroop = 7000;
                            frienduin = str1;
                            i1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop);
                            i = 0;
                            if (localSubAccountManager != null) {
                              i = localSubAccountManager.d(str1);
                            }
                            int i2 = i - i1;
                            if (i2 != 0) {
                              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(frienduin, istroop, i2);
                            }
                            if (QLog.isColorLevel()) {
                              QLog.d("SUB_ACCOUNT", 2, "sub.account.msg conversion subUin=" + str1 + " target=" + i + " old=" + i1 + " increase=" + i2);
                            }
                            paramObject = new ArrayList();
                            paramObject.add(paramFromServiceMsg);
                            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramObject, str2, false, false, true);
                            if (bool1) {
                              break label1894;
                            }
                            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramObject.size(), true, true);
                            break label1894;
                            break;
                            frienduin = String.valueOf(l6);
                            break label4036;
                            bool2 = false;
                            break label4044;
                            i = n;
                            break label4199;
                          }
                        }
                      }
                      else
                      {
                        if ((localList1 != null) && (localList1.size() > 0) && (k != 0))
                        {
                          if (QLog.isColorLevel()) {
                            QLog.d("SUB_ACCOUNT", 2, "handleGetSubC2CMessageResp_PB dbSubMsgList......");
                          }
                          i = 0;
                          if (i < localList1.size())
                          {
                            paramFromServiceMsg = (SubAccountMessage)localList1.get(i);
                            if ((paramFromServiceMsg == null) || (frienduin == null)) {}
                            for (;;)
                            {
                              i += 1;
                              break;
                              if (!frienduin.equals(String.valueOf(AppConstants.ap)))
                              {
                                m = 0;
                                paramObject = localArrayList.iterator();
                                do
                                {
                                  k = m;
                                  if (!paramObject.hasNext()) {
                                    break;
                                  }
                                  localObject3 = (String)paramObject.next();
                                } while ((localObject3 == null) || (!frienduin.equalsIgnoreCase((String)localObject3)));
                                k = 1;
                                if ((k != 0) && (localHashMap.containsKey(frienduin))) {
                                  localSubAccountManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, String.valueOf(l3), frienduin, ((Integer)localHashMap.get(frienduin)).intValue());
                                }
                                if ((k == 0) && (!frienduin.equalsIgnoreCase("2005060620050606")) && (!frienduin.equalsIgnoreCase("2005060620050607")) && (localSubAccountManager != null))
                                {
                                  k = localSubAccountManager.a(String.valueOf(l3), frienduin);
                                  if (k != 0)
                                  {
                                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(str1, 7000, k);
                                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new String[] { AppConstants.ag, str1 });
                                  }
                                }
                              }
                            }
                          }
                        }
                        if (QLog.isColorLevel())
                        {
                          if (arrayOfByte == null) {
                            break label5158;
                          }
                          QLog.d("SUB_ACCOUNT", 2, "subaccount handleGetSubC2CMessageResp_PB  cookie = ");
                        }
                        for (;;)
                        {
                          if (localSubAccountManager != null) {
                            localSubAccountManager.a(str1, arrayOfByte);
                          }
                          paramFromServiceMsg = new HashMap();
                          paramFromServiceMsg.put("param_FailCode", "12016");
                          paramFromServiceMsg.put("fail_step", "success");
                          paramFromServiceMsg.put("fail_location", "MessageHandler");
                          StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBGetMsg", true, 0L, 0L, paramFromServiceMsg, "");
                          if (b <= 0) {
                            break label5186;
                          }
                          if (l3 <= 0L) {
                            break;
                          }
                          paramToServiceMsg = extraData.getString("subaccount_a2");
                          if (paramToServiceMsg == null) {
                            break label5186;
                          }
                          a(b, j, String.valueOf(l3), paramToServiceMsg, localArrayList);
                          jdField_a_of_type_Boolean = false;
                          a(8003, true, localSubAccountBackProtocData);
                          return;
                          QLog.d("SUB_ACCOUNT", 2, "subaccount handleGetSubC2CMessageResp_PB  cookie = null");
                        }
                        if (QLog.isColorLevel()) {
                          QLog.e("Q.msg.C2CMessageProcessor", 2, "subaccount handleGetSubC2CMessageResp_PB error happen, binduin <= 0 from server");
                        }
                        p = 0;
                        a(8003, true, localSubAccountBackProtocData);
                        if (!QLog.isColorLevel()) {
                          break;
                        }
                        QLog.d("SUB_ACCOUNT", 2, "subaccount <PbGetMsg><R><---handleGetSubC2CMessageResp_PB end");
                        return;
                      }
                    }
                  }
                }
                k = 1;
                b = 0;
              }
            }
          }
        }
      }
    }
  }
  
  public void a(byte paramByte, int paramInt, String paramString1, String paramString2, ArrayList paramArrayList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "getSubAccoundMsg_PB() start, subUin=" + paramString1);
    }
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("MessageSvc.PbBindUinGetMsg");
    extraData.putByte("cChannel", paramByte);
    extraData.putInt("cSyncFlag", paramInt);
    extraData.putBoolean("isSubAccount", true);
    extraData.putString("subAccount", paramString1);
    extraData.putString("subaccount_a2", paramString2);
    if ((paramArrayList != null) && (paramArrayList.size() > 0)) {
      extraData.putStringArrayList("hadGetMsgListUin", paramArrayList);
    }
    paramArrayList = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
    if (paramArrayList != null) {}
    for (paramArrayList = paramArrayList.a(paramString1);; paramArrayList = null)
    {
      msg_svc.PbBindUinGetMsgReq localPbBindUinGetMsgReq = new msg_svc.PbBindUinGetMsgReq();
      if (paramString1 != null) {}
      try
      {
        bind_uin.set(Long.parseLong(paramString1));
        if (paramString2 == null) {}
      }
      catch (Exception paramString1)
      {
        try
        {
          do
          {
            bind_uin_sig.set(ByteStringMicro.copyFrom(PkgTools.a(paramString2)));
            if (paramArrayList == null) {
              break;
            }
            if (QLog.isColorLevel()) {
              QLog.d("SUB_ACCOUNT", 2, "getSubAccoundMsg_PB() cookie=" + paramArrayList.length);
            }
            sync_cookie.set(ByteStringMicro.copyFrom(paramArrayList));
            sync_flag.set(paramInt);
            localToServiceMsg.putWupBuffer(localPbBindUinGetMsgReq.toByteArray());
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(localToServiceMsg);
            return;
            paramString1 = paramString1;
            paramString1.printStackTrace();
          } while (!QLog.isColorLevel());
          QLog.e("SUB_ACCOUNT", 2, "getSubAccoundMsg_PB() subAccount is null or not a long");
        }
        catch (Exception paramString1)
        {
          for (;;)
          {
            paramString1.printStackTrace();
            continue;
            if (QLog.isColorLevel()) {
              QLog.d("SUB_ACCOUNT", 2, "getSubAccoundMsg_PB() cookie = null");
            }
          }
        }
      }
    }
  }
  
  public void a(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "subaccount cmd =  CMD_MESSAGESERVICE_GETSUBACCOUNTMSG_PB handlerGetSubAccountError end");
    }
    paramFromServiceMsg = new SubAccountBackProtocData();
    String str = extraData.getString("subAccount");
    b = paramToServiceMsg.getUin();
    jdField_c_of_type_JavaLangString = str;
    p = 1001;
    a(8003, false, paramFromServiceMsg);
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 4001: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        b((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
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
  
  public void a(RequestPushNotify paramRequestPushNotify)
  {
    Object localObject = stMsgInfo;
    if (528 == shMsgType)
    {
      localObject = GameCenterPackeger.a(vMsg);
      if ((localObject != null) && (vProtobuf != null)) {
        break label35;
      }
    }
    label35:
    do
    {
      do
      {
        return;
      } while ((uSubMsgType != 138L) && (uSubMsgType != 139L));
      Submsgtype0x8a.ReqBody localReqBody = new Submsgtype0x8a.ReqBody();
      try
      {
        localReqBody.mergeFrom(vProtobuf);
        MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localReqBody, lBindedUin, true);
        return;
      }
      catch (Exception paramRequestPushNotify) {}
    } while (!QLog.isColorLevel());
    QLog.d("revokeMsg", 2, "recv 0x210_0x8a_8b sub account msg, prase reqBody error");
  }
  
  public void a(QzoneSubAccountUnreadServlet.GetSubAccountUnreadResponse paramGetSubAccountUnreadResponse, String paramString1, long paramLong1, String paramString2, long paramLong2)
  {
    if (paramGetSubAccountUnreadResponse == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e(QZoneLogTags.j, 2, "getSubAccountQZoneMsg():faile");
      }
      return;
    }
    SubAccountManager localSubAccountManager = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
    String str = Long.toString(c);
    paramGetSubAccountUnreadResponse = null;
    if (localSubAccountManager != null) {
      paramGetSubAccountUnreadResponse = localSubAccountManager.a(str);
    }
    SubAccountBackProtocData localSubAccountBackProtocData = new SubAccountBackProtocData();
    jdField_c_of_type_JavaLangString = str;
    if (QLog.isColorLevel()) {
      QLog.d(QZoneLogTags.j, 2, "====================== handleSubAccountMsg ====================== \n + QZonePushType: " + paramString1 + " count: " + paramLong1 + " msg: " + paramString2 + " timeStamp: " + paramLong2);
    }
    if (paramLong1 == 0L) {
      if ((paramGetSubAccountUnreadResponse == null) || (paramGetSubAccountUnreadResponse.size() <= 0) || (localSubAccountManager == null)) {
        break label837;
      }
    }
    label837:
    for (int i = localSubAccountManager.a(str, paramString1);; i = 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d(QZoneLogTags.j, 2, "clear all QZonePushTye: " + paramString1 + " message");
      }
      if (i == 0) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(str, 7000, i);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new String[] { AppConstants.ag, str });
      jdField_c_of_type_Boolean = true;
      p = 0;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(8003, true, localSubAccountBackProtocData);
      return;
      SubAccountMessage localSubAccountMessage = new SubAccountMessage();
      isread = false;
      msg = paramString2;
      unreadNum = ((int)paramLong1);
      msgtype = 64536;
      selfuin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      sendername = "空间动态";
      senderuin = paramString1;
      frienduin = paramString1;
      subUin = str;
      time = paramLong2;
      needNotify = false;
      paramLong1 = 0L;
      if (localSubAccountManager != null) {
        paramLong1 = localSubAccountManager.b(str);
      }
      if (QLog.isColorLevel()) {
        QLog.d(QZoneLogTags.j, 2, " sbmsg.time: " + time + " sbmsg.subUin: " + subUin + " sbmsg.frienduin: " + frienduin + " sbmsg.senderuin:" + senderuin);
      }
      if (QLog.isColorLevel()) {
        QLog.d(QZoneLogTags.j, 2, " lastcleanQZoneMessageTime: " + paramLong1);
      }
      if (time < paramLong1)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.e(QZoneLogTags.j, 2, "getSubAccountQZoneMsg():this message has been cleaned");
        return;
      }
      if ((paramGetSubAccountUnreadResponse != null) && (paramGetSubAccountUnreadResponse.size() > 0))
      {
        paramString2 = paramGetSubAccountUnreadResponse.iterator();
        do
        {
          do
          {
            if (!paramString2.hasNext()) {
              break;
            }
            paramGetSubAccountUnreadResponse = (SubAccountMessage)paramString2.next();
          } while (paramGetSubAccountUnreadResponse == null);
          str = senderuin;
        } while ((str == null) || (!str.equalsIgnoreCase(paramString1)));
      }
      for (;;)
      {
        if ((QLog.isColorLevel()) && (paramGetSubAccountUnreadResponse != null)) {
          QLog.d(QZoneLogTags.j, 2, "find msg in db oriQZoneMsg.time:" + time);
        }
        if ((paramGetSubAccountUnreadResponse != null) && (time == time))
        {
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d(QZoneLogTags.j, 2, "getSubAccountQZoneMsg():this message has already get");
          return;
        }
        if (localSubAccountManager != null) {
          localSubAccountManager.a(localSubAccountMessage);
        }
        int j = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(subUin, 7000);
        if (localSubAccountManager != null) {}
        for (i = localSubAccountManager.d(subUin);; i = 0)
        {
          i -= j;
          if (i != 0)
          {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(subUin, 7000, i);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new String[] { AppConstants.ag, subUin });
            jdField_c_of_type_Boolean = true;
            p = 0;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(8003, true, localSubAccountBackProtocData);
          }
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d(QZoneLogTags.i, 2, "getSubAccountQZoneMsg():success");
          return;
        }
        paramGetSubAccountUnreadResponse = null;
      }
    }
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d(QZoneLogTags.j, 2, "getSubAccountQZoneMsg() subAccount=" + paramString);
    }
    GetSubAccountUnreadIntent localGetSubAccountUnreadIntent = new GetSubAccountUnreadIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), QzoneSubAccountUnreadServlet.class);
    localGetSubAccountUnreadIntent.setAction("Qzone_Get_SubAccount_Count");
    try
    {
      long l = Long.parseLong(paramString);
      localGetSubAccountUnreadIntent.putExtra("qzone_get_sub_account_unread_uin", l);
      a = new nkq(this);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localGetSubAccountUnreadIntent);
      return;
    }
    catch (NumberFormatException paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "confirmSubAccountMsgNumReaded() subAccount=" + paramString1);
    }
    byte[] arrayOfByte;
    SubAccountManager localSubAccountManager;
    ToServiceMsg localToServiceMsg;
    try
    {
      l = Long.parseLong(paramString1);
      if (l <= 10000L)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SUB_ACCOUNT", 2, "confirmSubAccountMsgNumReaded() return, lSubUin=" + l);
        }
        return;
      }
    }
    catch (Exception localException)
    {
      long l;
      for (;;)
      {
        localException.printStackTrace();
        l = 0L;
      }
      arrayOfByte = null;
      localSubAccountManager = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
      if (localSubAccountManager != null) {
        arrayOfByte = localSubAccountManager.a(paramString1);
      }
      localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("PbMessageSvc.PbBindUinMsgReadedConfirm");
      extraData.putBoolean("isSubAccount", true);
      extraData.putString("subAccount", paramString1);
      extraData.putString("nextAction", paramString2);
      paramString2 = new msg_svc.PbBindUinMsgReadedConfirmReq();
      bind_uin.set(l);
      if (arrayOfByte == null) {
        break label266;
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "confirmSubAccountMsgNumReaded() getSubAccoundMsg_PB  syncCookie=" + Integer.toString(arrayOfByte.length));
    }
    sync_cookie.set(ByteStringMicro.copyFrom(arrayOfByte));
    for (;;)
    {
      localToServiceMsg.putWupBuffer(paramString2.toByteArray());
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(localToServiceMsg);
      if (localSubAccountManager == null) {
        break;
      }
      localSubAccountManager.g(paramString1);
      return;
      label266:
      if (QLog.isColorLevel()) {
        QLog.d("SUB_ACCOUNT", 2, "confirmSubAccountMsgNumReaded() getSubAccoundMsg_PB  cookie = null");
      }
    }
  }
  
  public void b(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "subaccount cmd =  CMD_MESSAGESERVICE_GETSUBACCOUNTMSG_PB handlerGetSubAccountTimeout end");
    }
    paramFromServiceMsg = new SubAccountBackProtocData();
    String str = extraData.getString("subAccount");
    b = paramToServiceMsg.getUin();
    jdField_c_of_type_JavaLangString = str;
    p = 1007;
    a(8003, false, paramFromServiceMsg);
  }
  
  public void b(String paramString1, String paramString2)
  {
    SubAccountManager localSubAccountManager = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
    List localList = null;
    if (localSubAccountManager != null) {
      localList = localSubAccountManager.a(paramString1);
    }
    SubAccountBackProtocData localSubAccountBackProtocData = new SubAccountBackProtocData();
    jdField_c_of_type_JavaLangString = paramString1;
    if ((localList != null) && (localList.size() > 0) && (localSubAccountManager != null)) {}
    for (int i = localSubAccountManager.a(paramString1, paramString2);; i = 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d(QZoneLogTags.j, 2, "getSubAccountQZoneMsg():no new message");
      }
      if (i != 0)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramString1, 7000, i);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new String[] { AppConstants.ag, paramString1 });
        jdField_c_of_type_Boolean = true;
        p = 0;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(8003, true, localSubAccountBackProtocData);
      }
      return;
    }
  }
}
