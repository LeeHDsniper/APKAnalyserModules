package com.tencent.mobileqq.app.message;

import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver.StatictisInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.TransFileInfo;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.data.FMTransC2CMsgInfo;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.mobileqq.service.message.MessageFactoryReceiver.OffLineFileInfo;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.service.message.TransMsgContext;
import com.tencent.mobileqq.streamtransfile.StreamDataManager;
import com.tencent.mobileqq.transfile.BuddyTransfileProcessor;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import cooperation.qlink.QlinkServiceManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import msf.msgcomm.msg_comm.Msg;
import msf.msgsvc.msg_svc.AccostTmp;
import msf.msgsvc.msg_svc.AddressListTmp;
import msf.msgsvc.msg_svc.BusinessWPATmp;
import msf.msgsvc.msg_svc.DisTmp;
import msf.msgsvc.msg_svc.GrpTmp;
import msf.msgsvc.msg_svc.NearByDatingTmp;
import msf.msgsvc.msg_svc.PbSendMsgReq;
import msf.msgsvc.msg_svc.PbSendMsgResp;
import msf.msgsvc.msg_svc.RoutingHead;
import msf.msgsvc.msg_svc.Trans0x211;
import nkb;
import nkc;
import nkd;
import tencent.im.msg.im_msg_body.MsgBody;
import tencent.im.msg.im_msg_body.RichText;
import tencent.im.msg.im_msg_body.Trans211TmpMsg;

public class OfflineFileMessageProcessor
  extends BaseMessageProcessor
{
  private static final int e = 20;
  ArrayList a;
  
  public OfflineFileMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList(20);
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, MessageFactoryReceiver.OffLineFileInfo paramOffLineFileInfo)
  {
    if (paramOffLineFileInfo == null) {
      a(paramToServiceMsg, paramFromServiceMsg);
    }
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("wk", 2, "onReceive, MessageConstants.CMD_TRANSSERVICE_REQOFFFILEPACK: " + jdField_b_of_type_Byte);
      }
      if (jdField_b_of_type_Byte == 6)
      {
        e(paramToServiceMsg, paramFromServiceMsg, paramOffLineFileInfo);
        return;
      }
      if (jdField_b_of_type_Byte == 3)
      {
        d(paramToServiceMsg, paramFromServiceMsg, paramOffLineFileInfo);
        return;
      }
      if (jdField_b_of_type_Byte == 2)
      {
        c(paramToServiceMsg, paramFromServiceMsg, paramOffLineFileInfo);
        return;
      }
    } while (jdField_b_of_type_Byte != 1);
    b(paramToServiceMsg, paramFromServiceMsg, paramOffLineFileInfo);
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageResp");
    }
    String str2 = paramToServiceMsg.getServiceCmd();
    long l = extraData.getLong("msgSeq");
    String str1 = extraData.getString("uin");
    int k = extraData.getInt("transC2CCmd");
    msg_svc.PbSendMsgResp localPbSendMsgResp = new msg_svc.PbSendMsgResp();
    try
    {
      paramObject = (msg_svc.PbSendMsgResp)localPbSendMsgResp.mergeFrom((byte[])paramObject);
      if ((paramObject == null) || (!result.has()))
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.BaseMessageProcessor", 2, "server did not return a valid result code, use 4 instead.");
        }
        i = 4;
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageResp: ---cmd:" + str2 + "----replyCode:" + i + ",sendC2CMessage resp : peerUin:" + str1 + ",msgSeq:" + l + ",transc2ccmd:" + k);
        }
        extraData.putLong("ServerReplyCode", i);
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l);
        if (paramFromServiceMsg != null) {
          break label297;
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageResp: ---cmd:" + str2 + ",no SendMessageHandler found.");
        }
      }
    }
    catch (Exception paramObject)
    {
      for (;;)
      {
        int i;
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageResp::invalid.", paramObject);
        }
        paramObject = null;
        continue;
        if (result.get() != 0)
        {
          i = result.get();
          continue;
          label297:
          if (i == 255) {}
          for (int j = 1;; j = 0)
          {
            if (j != 0)
            {
              paramObject = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
              paramFromServiceMsg.getClass();
              if (paramObject.a(paramFromServiceMsg, "server")) {
                break;
              }
            }
            if ((i != 0) && (i != 241)) {
              break label469;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageResp : send successfully.");
            }
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l);
            if (133 == k) {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(str1, extraData.getLong("sessionid"), true);
            }
            if (135 != k) {
              break label436;
            }
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str1, extraData.getLong("sessionid"), true);
            return;
          }
          label436:
          if (QLog.isColorLevel())
          {
            QLog.w("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageResp : can not handle transc2ccmd:" + k);
            return;
            label469:
            if (QLog.isColorLevel()) {
              QLog.e("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageResp : send failed:" + i + ", transc2ccmd:" + k);
            }
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l);
            if (133 == k)
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(str1, extraData.getLong("sessionid"), false);
              return;
            }
            if (135 == k) {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str1, extraData.getLong("sessionid"), false);
            }
          }
        }
        else
        {
          i = 0;
        }
      }
    }
  }
  
  private void a(msg_svc.PbSendMsgReq paramPbSendMsgReq, FMTransC2CMsgInfo paramFMTransC2CMsgInfo, TransMsgContext paramTransMsgContext)
  {
    long l1 = 0L;
    if ((paramFMTransC2CMsgInfo == null) || (entity == null)) {
      return;
    }
    paramFMTransC2CMsgInfo = entity;
    msg_svc.RoutingHead localRoutingHead = routing_head;
    int i = (int)tmpSessionType;
    switch (i)
    {
    default: 
      return;
    case 100: 
      accost_tmp.to_uin.set(Long.parseLong(peerUin));
      if ((tmpSessionSig != null) && (tmpSessionSig.length > 0)) {
        accost_tmp.sig.set(ByteStringMicro.copyFrom(tmpSessionSig));
      }
      accost_tmp.setHasFlag(true);
      localRoutingHead.setHasFlag(true);
    }
    for (;;)
    {
      if ((paramTransMsgContext != null) && (jdField_a_of_type_ArrayOfByte != null)) {
        break label683;
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("Q.msg.BaseMessageProcessor", 2, "tmpsession Bug msgContext or msgContext.msg null!");
      return;
      if (QLog.isColorLevel()) {
        QLog.i("Q.msg.BaseMessageProcessor", 2, "addTempSessionData add disctmp Info");
      }
      long l2;
      try
      {
        l2 = Long.parseLong(tmpSessionRelatedUin);
        l1 = l2;
      }
      catch (Exception localException1)
      {
        for (;;)
        {
          QLog.e("Q.msg.BaseMessageProcessor", 1, "case to long faild, relatedUin[" + tmpSessionRelatedUin + "]");
        }
      }
      dis_tmp.dis_uin.set(l1);
      dis_tmp.to_uin.set(Long.parseLong(peerUin));
      dis_tmp.setHasFlag(true);
      localRoutingHead.setHasFlag(true);
      continue;
      try
      {
        l2 = Long.parseLong(tmpSessionRelatedUin);
        l1 = l2;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          QLog.e("Q.msg.BaseMessageProcessor", 1, "case to long faild, relatedUin[" + tmpSessionRelatedUin + "]");
        }
      }
      grp_tmp.group_uin.set(l1);
      grp_tmp.to_uin.set(Long.parseLong(peerUin));
      grp_tmp.setHasFlag(true);
      localRoutingHead.setHasFlag(true);
      continue;
      nearby_dating_tmp.to_uin.set(Long.parseLong(peerUin));
      if ((tmpSessionSig != null) && (tmpSessionSig.length > 0)) {
        nearby_dating_tmp.sig.set(ByteStringMicro.copyFrom(tmpSessionSig));
      }
      nearby_dating_tmp.setHasFlag(true);
      localRoutingHead.setHasFlag(true);
      continue;
      if (tmpSessionFromPhone == null) {
        tmpSessionFromPhone = "";
      }
      address_list.from_phone.set(tmpSessionFromPhone);
      if (tmpSessionToPhone == null) {
        tmpSessionToPhone = "";
      }
      address_list.to_phone.set(tmpSessionToPhone);
      String str = peerUin.replace("+", "");
      address_list.to_uin.set(Long.parseLong(str));
      if ((tmpSessionSig != null) && (tmpSessionSig.length > 0)) {
        address_list.sig.set(ByteStringMicro.copyFrom(tmpSessionSig));
      }
      address_list.setHasFlag(true);
      localRoutingHead.setHasFlag(true);
      continue;
      business_wpa_tmp.to_uin.set(Long.parseLong(peerUin));
      if ((tmpSessionSig != null) && (tmpSessionSig.length > 0)) {
        business_wpa_tmp.sig.set(ByteStringMicro.copyFrom(tmpSessionSig));
      }
      business_wpa_tmp.setHasFlag(true);
      localRoutingHead.setHasFlag(true);
    }
    label683:
    if (QLog.isColorLevel()) {
      QLog.e("Q.msg.BaseMessageProcessor", 2, "tmpsession msg0x211[" + i + "]");
    }
    trans_0x211.setHasFlag(false);
    msg_body.msg_content.setHasFlag(false);
    msg_body.rich_text.setHasFlag(true);
    msg_body.rich_text.trans_211_tmp_msg.setHasFlag(true);
    msg_body.rich_text.trans_211_tmp_msg.bytes_msg_body.set(ByteStringMicro.copyFrom(jdField_a_of_type_ArrayOfByte));
    msg_body.rich_text.trans_211_tmp_msg.uint32_c2c_cmd.set(4);
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, MessageFactoryReceiver.OffLineFileInfo paramOffLineFileInfo)
  {
    if ((paramOffLineFileInfo == null) || (jdField_a_of_type_Long != 0L))
    {
      if (QLog.isColorLevel()) {
        QLog.d("wk", 2, "handleSendOfflineFileResp-->handleError");
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("wk", 2, "handleSendOfflineFileResp-->notify NOTIFY_TYPE_SEND_OFFLINE_FILE");
    }
    int i = extraData.getInt("retryIndex", 0);
    MessageObserver.StatictisInfo localStatictisInfo = new MessageObserver.StatictisInfo();
    c = paramFromServiceMsg.getResultCode();
    jdField_d_of_type_Int = i;
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 5004, true, new Object[] { paramOffLineFileInfo, localStatictisInfo });
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageExResp");
    }
    Object localObject1 = paramToServiceMsg.getServiceCmd();
    long l1 = extraData.getLong("uniseq");
    long l2 = extraData.getLong("queueSeq");
    long l3 = extraData.getLong("msgSeq");
    String str1 = extraData.getString("uin");
    String str2 = extraData.getString("uuid");
    int k = extraData.getInt("transC2CCmd");
    int m = extraData.getInt("busiType");
    Object localObject2 = new msg_svc.PbSendMsgResp();
    try
    {
      paramObject = (msg_svc.PbSendMsgResp)((msg_svc.PbSendMsgResp)localObject2).mergeFrom((byte[])paramObject);
      label317:
      if ((paramObject == null) || (!result.has()))
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.BaseMessageProcessor", 2, "server did not return a valid result code, use 4 instead.");
        }
        i = 4;
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageExResp: ---cmd:" + (String)localObject1 + "----replyCode:" + i + ",sendC2CMessage resp : peerUin:" + str1 + ",uniseq:" + l1 + ",msgSeq:" + l3 + ",transc2ccmd:" + k);
        }
        extraData.putLong("ServerReplyCode", i);
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l2);
        if (localObject2 != null) {
          break label362;
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageExResp: ---cmd:" + (String)localObject1 + ",no SendMessageHandler found.");
        }
      }
    }
    catch (Exception paramObject)
    {
      for (;;)
      {
        int i;
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageExResp::invalid.", paramObject);
        }
        paramObject = null;
        continue;
        if (result.get() != 0)
        {
          i = result.get();
          continue;
          label362:
          if (i == 255) {}
          for (int j = 1;; j = 0)
          {
            if (j != 0)
            {
              localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
              localObject2.getClass();
              if (((MessageHandler)localObject1).a((SendMessageHandler)localObject2, "server")) {
                break;
              }
            }
            if ((i != 0) && (i != 241)) {
              break label836;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageExResp : send successfully.");
            }
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l2);
            if ((send_time.has()) && (l1 != 0L))
            {
              l2 = send_time.get() & 0xFFFFFFFF;
              jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(str1, 0, l1, l2);
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.BaseMessageProcessor", 2, "updateSendTransMsgTime: sendBuddyPb: respData.uSendTime:" + l2 + ",peerUin:" + str1);
              }
            }
            if (529 != k) {
              break label802;
            }
            switch (m)
            {
            case 1026: 
            case 1027: 
            case 1030: 
            case 1031: 
            default: 
              if (!QLog.isColorLevel()) {
                break label317;
              }
              QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : should not come here for the moment, busiType" + m);
              return;
            }
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str1, extraData.getLong("sessionid"), true);
          return;
          if (send_time.has()) {
            a(str2 + String.valueOf(send_time.get()));
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramToServiceMsg, paramFromServiceMsg, extraData.getLong("sessionid"));
          if (QLog.isColorLevel())
          {
            QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : send offline file  suc");
            return;
            if (QLog.isColorLevel())
            {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : send file receipt suc");
              return;
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.BaseMessageProcessor", 2, "QLINK_<---handleSendTransMessageExResp : qlink send file suc");
              }
              l1 = extraData.getLong("sessionid");
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l1);
              return;
              if (QLog.isColorLevel())
              {
                QLog.d("Q.msg.BaseMessageProcessor", 2, "QLINK_<---handleSendTransMessageExResp : qlink send file state sync suc");
                return;
                label802:
                if (QLog.isColorLevel())
                {
                  QLog.w("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageExResp : can not handle transc2ccmd:" + k);
                  return;
                  label836:
                  if (QLog.isColorLevel()) {
                    QLog.e("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageExResp : send failed:" + i + ", transc2ccmd:" + k);
                  }
                  jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3);
                  if (529 == k) {
                    switch (m)
                    {
                    case 1026: 
                    case 1027: 
                    case 1030: 
                    case 1031: 
                    default: 
                      if (!QLog.isColorLevel()) {
                        continue;
                      }
                      QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : should not come here for the moment, busiType" + m);
                      return;
                    case 1025: 
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str1, extraData.getLong("sessionid"), false);
                      return;
                    case 1028: 
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramToServiceMsg, paramFromServiceMsg, extraData.getLong("sessionid"));
                      if (!QLog.isColorLevel()) {
                        continue;
                      }
                      QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : send offline file  fail");
                      return;
                    case 1029: 
                      if (!QLog.isColorLevel()) {
                        continue;
                      }
                      QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : send file receipt fail");
                      return;
                    case 1032: 
                      if (QLog.isColorLevel()) {
                        QLog.d("Q.msg.BaseMessageProcessor", 2, "QLINK_<---handleSendTransMessageExResp : qlink send file fail");
                      }
                      l1 = extraData.getLong("sessionid");
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l1);
                      return;
                    case 1033: 
                      if (!QLog.isColorLevel()) {
                        continue;
                      }
                      QLog.d("Q.msg.BaseMessageProcessor", 2, "QLINK_<---handleSendTransMessageExResp : qlink send file state sync fail");
                      return;
                    }
                  } else if (QLog.isColorLevel()) {
                    QLog.w("Q.msg.BaseMessageProcessor", 2, "<---handleSendTransMessageExResp : can not handle transc2ccmd:" + k);
                  }
                }
              }
            }
          }
        }
        else
        {
          i = 0;
        }
      }
    }
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, MessageFactoryReceiver.OffLineFileInfo paramOffLineFileInfo)
  {
    if ((paramOffLineFileInfo == null) || (jdField_a_of_type_Long != 0L))
    {
      if (QLog.isColorLevel()) {
        QLog.d("wk", 2, "handleSetOfflineFileState-->handleError");
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("wk", 2, "handleSetOfflineFileState-->notify NOTIFY_TYPE_SEND_OFFLINE_FILE");
    }
    int i = extraData.getInt("retryIndex", 0);
    MessageObserver.StatictisInfo localStatictisInfo = new MessageObserver.StatictisInfo();
    c = paramFromServiceMsg.getResultCode();
    jdField_d_of_type_Int = i;
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 5005, true, new Object[] { paramOffLineFileInfo, localStatictisInfo });
  }
  
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, MessageFactoryReceiver.OffLineFileInfo paramOffLineFileInfo)
  {
    if (paramOffLineFileInfo == null) {
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
    }
    for (;;)
    {
      return;
      long l1 = jdField_c_of_type_Long;
      long l2 = jdField_d_of_type_Long;
      long l3 = e;
      long l4 = jdField_b_of_type_Long;
      paramFromServiceMsg = jdField_b_of_type_JavaLangString;
      String str1 = jdField_c_of_type_JavaLangString;
      String str2 = extraData.getString("friendUin");
      boolean bool = extraData.getBoolean("isRead");
      Object localObject = "http://" + PkgTools.b(l1) + "/?ver=" + "2" + "&rkey=" + paramFromServiceMsg;
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageProcessor", 2, "<<---handleGetOffLineFileResp serverPath: " + (String)localObject + " strFileName: " + str1 + " time: " + jdField_d_of_type_Long + " seq: " + jdField_a_of_type_Short);
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageProcessor", 2, "friendUin:" + str2 + "  struct.senderUin: " + jdField_b_of_type_Long + " struct.time: " + jdField_d_of_type_Long + " struct.seq: " + jdField_a_of_type_Short);
      }
      int i;
      if (MessageUtils.a(str1, jdField_a_of_type_Byte))
      {
        paramFromServiceMsg = TransfileUtile.a((String)localObject, l3, 1, false, (String)localObject);
        i = 63536;
      }
      while (paramFromServiceMsg != null)
      {
        localObject = MessageRecordFactory.a(i);
        selfuin = paramToServiceMsg.getUin();
        frienduin = str2;
        senderuin = String.valueOf(l4);
        isread = bool;
        time = l2;
        msgtype = i;
        istroop = 0;
        msg = paramFromServiceMsg;
        msgseq = jdField_a_of_type_Short;
        shmsgseq = jdField_a_of_type_Short;
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(senderuin))
        {
          isread = true;
          issend = 2;
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((MessageRecord)localObject, paramToServiceMsg.getUin());
        if (63531 == i)
        {
          paramToServiceMsg = extraData.getByteArray("filepath");
          paramFromServiceMsg = (TransFileInfo)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(TransFileInfo.class, new String[] { String.valueOf(l2), String.valueOf(msgseq), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), frienduin });
          paramFromServiceMsg = new TransFileInfo();
          selfUin = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          friendUin = frienduin;
          transferedSize = 0L;
          status = 2008;
          mr_seq = shmsgseq;
          mr_time = l2;
          fileName = str1;
          uuid = paramToServiceMsg;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().b(paramFromServiceMsg);
        }
        a("handleGetOffLineFileResp", true, 1, true, false);
        return;
        if (MessageUtils.b(str1, jdField_a_of_type_Byte))
        {
          if (!str1.contains("_")) {}
          for (paramFromServiceMsg = str1.substring(0, str1.length() - 4);; paramFromServiceMsg = str1.substring(str1.lastIndexOf("_") + 1, str1.length() - 4))
          {
            paramFromServiceMsg = l4 + paramFromServiceMsg;
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "isPttSuffix offfile key：" + paramFromServiceMsg);
            }
            if (!StreamDataManager.e(paramFromServiceMsg)) {
              break;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "is Duplicate key：" + paramFromServiceMsg);
            }
            StreamDataManager.d(paramFromServiceMsg);
            return;
          }
          StreamDataManager.c(paramFromServiceMsg);
          paramFromServiceMsg = TransfileUtile.a((String)localObject, l3, 2, false);
          i = 63534;
        }
        else
        {
          if (QLog.isColorLevel()) {
            QLog.d("wk", 2, "rcv offline file：" + (String)localObject + " fileSize:" + l3);
          }
          paramFromServiceMsg = TransfileUtile.a(BuddyTransfileProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), str1, 0, null), l3, 0, false, (String)localObject);
          i = 63531;
        }
      }
    }
  }
  
  private void e(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, MessageFactoryReceiver.OffLineFileInfo paramOffLineFileInfo)
  {
    if (paramOffLineFileInfo == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    int i = extraData.getInt("retryIndex", 0);
    MessageObserver.StatictisInfo localStatictisInfo = new MessageObserver.StatictisInfo();
    c = paramFromServiceMsg.getResultCode();
    jdField_d_of_type_Int = i;
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 5003, true, new Object[] { jdField_a_of_type_ArrayOfByte, localStatictisInfo });
  }
  
  public List a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    return null;
  }
  
  public void a(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
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
    case 7001: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], (MessageFactoryReceiver.OffLineFileInfo)paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 7002: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length == 3))
    {
      b((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
      return;
    }
    a(getClass().getName(), paramInt);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    int i = extraData.getInt("retryIndex", 0);
    if (QLog.isColorLevel()) {
      QLog.d("wk", 2, "handleReqOffFilePackError, count: " + i);
    }
    if (i < 2)
    {
      extraData.putInt("retryIndex", i + 1);
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg);
    }
    MessageObserver.StatictisInfo localStatictisInfo;
    do
    {
      return;
      localStatictisInfo = new MessageObserver.StatictisInfo();
      c = paramFromServiceMsg.getResultCode();
      jdField_d_of_type_Int = i;
      if (paramFromServiceMsg.getResultCode() == 1000)
      {
        c = 2900;
        jdField_d_of_type_Long = extraData.getLong("ServerReplyCode", 2139062142L);
      }
      MessageHandler localMessageHandler = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
      a = MessageHandler.a(paramFromServiceMsg);
      paramFromServiceMsg = extraData.getString("uin");
      if (extraData.getInt("offfile_type") == 0)
      {
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 3006, false, paramFromServiceMsg);
        return;
      }
      if (extraData.getInt("offfile_type") == 1)
      {
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 5003, false, new Object[] { paramFromServiceMsg, localStatictisInfo });
        return;
      }
      if (extraData.getInt("offfile_type") == 2)
      {
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 5005, false, new Object[] { paramFromServiceMsg, localStatictisInfo });
        return;
      }
    } while (extraData.getInt("offfile_type") != 3);
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, 5004, false, new Object[] { paramFromServiceMsg, localStatictisInfo });
  }
  
  public boolean a(String paramString)
  {
    if (!jdField_a_of_type_JavaUtilArrayList.contains(paramString))
    {
      if (jdField_a_of_type_JavaUtilArrayList.size() >= 20) {
        jdField_a_of_type_JavaUtilArrayList.remove(0);
      }
      jdField_a_of_type_JavaUtilArrayList.add(paramString);
      return false;
    }
    return true;
  }
  
  public boolean a(String paramString, int paramInt1, byte[] paramArrayOfByte1, int paramInt2, int paramInt3, byte[] paramArrayOfByte2, FMTransC2CMsgInfo paramFMTransC2CMsgInfo)
  {
    int i = MobileQQService.c;
    MobileQQService.c = i + 1;
    long l = i;
    queueSeq = l;
    a(true, true, true, l, new nkb(this, paramString, paramFMTransC2CMsgInfo, paramInt1, paramArrayOfByte2, paramArrayOfByte1, paramInt2, paramInt3));
    return true;
  }
  
  public boolean a(String paramString, int paramInt, byte[] paramArrayOfByte, FMTransC2CMsgInfo paramFMTransC2CMsgInfo)
  {
    int i = MobileQQService.c;
    MobileQQService.c = i + 1;
    long l = i;
    queueSeq = l;
    a(true, true, true, l, new nkc(this, paramString, paramFMTransC2CMsgInfo, paramInt, paramArrayOfByte));
    return true;
  }
  
  public boolean a(String paramString, long paramLong, int paramInt, byte[] paramArrayOfByte)
  {
    int i = MobileQQService.c;
    MobileQQService.c = i + 1;
    long l = i;
    a(true, true, true, l, new nkd(this, paramString, paramLong, Math.abs(new Random().nextInt()), l, paramInt, paramArrayOfByte));
    return true;
  }
  
  public void b(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    a(paramToServiceMsg, paramFromServiceMsg);
  }
  
  public void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    Object localObject = paramToServiceMsg.getServiceCmd();
    long l1 = extraData.getLong("msgSeq");
    String str = extraData.getString("uin");
    long l2 = extraData.getLong("timeOut");
    int i = extraData.getInt("transC2CCmd");
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><E><---handleSendTransMessageError: ---cmd:" + (String)localObject + ",sendC2CMessage error : peerUin:" + str + ",msgSeq:" + l1 + ",transc2ccmd:" + i);
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
    localObject = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
    if (localObject != null)
    {
      if (paramFromServiceMsg.getResultCode() != 2901) {
        break label187;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageError, msf said:RESNDMSG");
      }
      paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
      localObject.getClass();
      if (!paramFromServiceMsg.a((SendMessageHandler)localObject, "msf")) {
        break label187;
      }
    }
    label187:
    do
    {
      do
      {
        return;
      } while ((480000L != l2) && (!((SendMessageHandler)localObject).a()));
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
      if (133 == i)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(str, extraData.getLong("sessionid"), false);
        return;
      }
    } while (135 != i);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str, extraData.getLong("sessionid"), false);
  }
  
  public void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    Object localObject = paramToServiceMsg.getServiceCmd();
    long l1 = extraData.getLong("uniseq");
    long l2 = extraData.getLong("queueSeq");
    long l3 = extraData.getLong("msgSeq");
    String str = extraData.getString("uin");
    long l4 = extraData.getLong("timeOut");
    int i = extraData.getInt("transC2CCmd");
    int j = extraData.getInt("busiType");
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><E><---handleSendTransMessageExError: ---cmd:" + (String)localObject + ",sendC2CMessage error : peerUin:" + str + ",uniseq:" + l1 + ",msgSeq:" + l3 + ",transc2ccmd:" + i);
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
    localObject = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l2);
    if (localObject != null)
    {
      if (paramFromServiceMsg.getResultCode() != 2901) {
        break label236;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageProcessor", 2, "<PbSendMsg><R><---handleSendTransMessageExError, msf said:RESNDMSG");
      }
      MessageHandler localMessageHandler = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
      localObject.getClass();
      if (!localMessageHandler.a((SendMessageHandler)localObject, "msf")) {
        break label236;
      }
    }
    label236:
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
            } while ((480000L != l4) && (!((SendMessageHandler)localObject).a()));
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l2);
            if (529 != i) {
              break;
            }
            switch (j)
            {
            }
          } while (!QLog.isColorLevel());
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : should not come here for the moment, busiType" + j);
          return;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str, extraData.getLong("sessionid"), false);
          return;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramToServiceMsg, paramFromServiceMsg, extraData.getLong("sessionid"));
        } while (!QLog.isColorLevel());
        QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : send offline file  fail");
        return;
      } while (!QLog.isColorLevel());
      QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExResp : send file receipt fail");
      return;
    } while (!QLog.isColorLevel());
    QLog.d("Q.msg.BaseMessageProcessor", 2, "<FileAssistant><---handleSendTransMessageExError : qlink send file state fail");
  }
}
