package com.tencent.mobileqq.app.message;

import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.common.app.AppInterface;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivityFacade.HongbaoParams;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.revokemsg.RevokeMsgInfo;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import msf.msgcomm.msg_comm.Msg;
import msf.msgsvc.msg_svc.PbC2CMsgWithDrawReq;
import msf.msgsvc.msg_svc.PbC2CMsgWithDrawReq.MsgInfo;
import msf.msgsvc.msg_svc.PbC2CMsgWithDrawResp;
import msf.msgsvc.msg_svc.PbDelRoamMsgReq;
import msf.msgsvc.msg_svc.PbDelRoamMsgReq.C2CMsg;
import msf.msgsvc.msg_svc.PbDelRoamMsgReq.DisMsg;
import msf.msgsvc.msg_svc.PbDelRoamMsgReq.GrpMsg;
import msf.msgsvc.msg_svc.PbDelRoamMsgResp;
import msf.msgsvc.msg_svc.PbGroupMsgWithDrawReq;
import msf.msgsvc.msg_svc.PbGroupMsgWithDrawReq.MessageInfo;
import msf.msgsvc.msg_svc.PbGroupMsgWithDrawResp;
import msf.msgsvc.msg_svc.PbGroupMsgWithDrawResp.MessageResult;
import msf.msgsvc.msg_svc.PbMsgWithDrawReq;
import msf.msgsvc.msg_svc.PbMsgWithDrawResp;
import msf.msgsvc.msg_svc.PbSendMsgResp;
import msg.blessing_helper.blessing_helper.msg;
import nlc;
import nld;
import nle;
import tencent.im.msgrevoke.msgrevoke_userdef.MsgInfoUserDef;
import tencent.im.msgrevoke.msgrevoke_userdef.MsgInfoUserDef.MsgInfoDef;
import tencent.im.msgrevoke.msgrevoke_userdef.UinTypeUserDef;

public class UncommonMessageProcessor
  extends BaseMessageProcessor
{
  public static final String a = "Q.msg.UncommonMessageProcessor";
  private static final String c = "key_msg_info_revoke";
  private static final String d = "key_msg_info_time_start";
  public static final int e = 1;
  private static final String e = "MARK_REQUEST_REVOKE_OR_DELETEMULTI ";
  public static final int f = 2;
  public static int g = 1;
  public static int h = 2;
  public static int i = 3;
  public static int j = 4;
  public static int k = 5;
  public static int l = 1;
  public static int m = 2;
  public static int n = 3;
  public static int o = 1;
  public static int p = 2;
  public static int q = 3;
  public static int r = -1;
  public static int s = -2;
  public static final int t = 1080;
  private final int u = 12;
  private final int v = 6;
  private final int w = 1080000;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public UncommonMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
  }
  
  private void a(MessageRecord paramMessageRecord, long paramLong1, long paramLong2, int paramInt)
  {
    long l1 = System.currentTimeMillis();
    int i2 = istroop;
    int i1 = MessageUtils.b(msgUid);
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "<DELMSG><S>--->deleteMsgFromServerInner : uinType:" + istroop + " peerUin:" + frienduin + " msgType:" + msgtype + " uniseq:" + uniseq + " reqSeq:" + paramLong1 + " msgSeq:" + shmsgseq + " random:" + i1 + " msgTime:" + time + " msgUid:" + msgUid + " mr.longMsgCount:" + longMsgCount + " longMsgIndex:" + longMsgIndex + " longMsgId:" + longMsgId);
    }
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("PbMessageSvc.PbDelOneRoamMsg");
    extraData.putLong("timeOut", paramLong2);
    extraData.putLong("startTime", l1);
    extraData.putInt("retryIndex", paramInt);
    extraData.putInt("uintype", i2);
    extraData.putString("peeruin", frienduin);
    extraData.putLong("uniseq", uniseq);
    extraData.putLong("seq", shmsgseq);
    extraData.putLong("msgSeq", paramLong1);
    msg_svc.PbDelRoamMsgReq localPbDelRoamMsgReq = new msg_svc.PbDelRoamMsgReq();
    Object localObject;
    if ((i2 == 0) || (i2 == 1000) || (i2 == 1004))
    {
      paramInt = (short)(int)shmsgseq;
      extraData.putInt("msgrandom", i1);
      String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      localObject = new msg_svc.PbDelRoamMsgReq.C2CMsg();
      peer_uin.set(Long.valueOf(frienduin).longValue());
      from_uin.set(Long.valueOf(str).longValue());
      msg_time.set((int)time);
      msg_seq.set(0xFFFF & paramInt);
      msg_random.set(i1);
      c2c_msg.set((MessageMicro)localObject);
      if (msgtype == 63531)
      {
        paramMessageRecord = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, frienduin, 0);
        if ((paramMessageRecord != null) && (nOLfileSessionId != 0L))
        {
          msg_time.set((int)msgTime);
          paramInt = (short)(int)msgSeq;
          msg_seq.set(paramInt & 0xFFFFFFFF);
          msg_random.set(MessageUtils.b(msgUid));
        }
      }
    }
    for (;;)
    {
      localToServiceMsg.putWupBuffer(localPbDelRoamMsgReq.toByteArray());
      localToServiceMsg.setTimeout(paramLong2);
      localToServiceMsg.setEnableFastResend(true);
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.c(localToServiceMsg);
      return;
      if (i2 == 1)
      {
        localObject = new msg_svc.PbDelRoamMsgReq.GrpMsg();
        group_code.set(Long.valueOf(frienduin).longValue());
        msg_seq.set(Long.valueOf(shmsgseq).longValue());
        grp_msg.set((MessageMicro)localObject);
      }
      else if (i2 == 3000)
      {
        localObject = new msg_svc.PbDelRoamMsgReq.DisMsg();
        discuss_uin.set(Long.valueOf(frienduin).longValue());
        msg_seq.set(shmsgseq);
        dis_msg.set((MessageMicro)localObject);
      }
    }
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    String str = paramToServiceMsg.getServiceCmd();
    long l1 = extraData.getLong("uniseq");
    long l2 = extraData.getLong("msgSeq");
    int i1 = extraData.getInt("msgtype");
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "<---handleSendBlessMessageError: ---cmd:" + str + " uniseq:" + l1 + " msgSeq:" + l2 + " msgType:" + i1 + " ssoseq:" + paramFromServiceMsg.getRequestSsoSeq() + " appseq:" + paramFromServiceMsg.getAppSeq());
    }
    int i2 = paramFromServiceMsg.getResultCode();
    if (i2 == 2901)
    {
      l2 = System.currentTimeMillis();
      long l3 = extraData.getLong("key_msg_info_time_start", 0L);
      l2 = paramToServiceMsg.getTimeout() - (l2 - l3);
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.UncommonMessageProcessor", 2, "handleSendBlessMessageError, 2901 error, resend timeout: " + l2);
      }
      if (l2 > 0L)
      {
        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("MessageSvc.PbMultiMsgSend");
        extraData.putLong("uniseq", l1);
        extraData.putInt("msgtype", i1);
        extraData.putLong("key_msg_info_time_start", System.currentTimeMillis());
        paramFromServiceMsg.setTimeout(l2);
        paramFromServiceMsg.putWupBuffer(paramToServiceMsg.getWupBuffer());
        paramFromServiceMsg.setEnableFastResend(true);
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.c(paramFromServiceMsg);
        return;
      }
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(8019, false, new Object[] { Integer.valueOf(i2), Long.valueOf(0L) });
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    long l2 = extraData.getLong("uniseq");
    long l3 = extraData.getLong("msgSeq");
    int i2 = extraData.getInt("msgtype");
    paramToServiceMsg = new msg_svc.PbSendMsgResp();
    try
    {
      paramToServiceMsg = (msg_svc.PbSendMsgResp)paramToServiceMsg.mergeFrom((byte[])paramObject);
      if ((paramToServiceMsg == null) || (!result.has()))
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.UncommonMessageProcessor", 2, "<---handleSendBlessMessageResp : server did not return a valid result code, use 4 instead.");
        }
        i1 = 4;
        bool2 = false;
        l1 = 0L;
        if ((i1 != 0) && (i1 != 241)) {
          break label339;
        }
        bool1 = true;
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(8019, bool1, new Object[] { Integer.valueOf(i1), Long.valueOf(l1) });
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.UncommonMessageProcessor", 2, String.format("<---handleSendBlessMessageResp : ----replyCode: %d isSuc: %s uniseq: %d msgSeq: %d msgType: %d waitTime: %d ssoseq: %d  appseq: %d", new Object[] { Integer.valueOf(i1), Boolean.valueOf(bool1), Long.valueOf(l2), Long.valueOf(l3), Integer.valueOf(i2), Long.valueOf(l1), Integer.valueOf(paramFromServiceMsg.getRequestSsoSeq()), Integer.valueOf(paramFromServiceMsg.getAppSeq()) }));
        }
      }
    }
    catch (Exception paramToServiceMsg)
    {
      for (;;)
      {
        int i1;
        boolean bool2;
        long l1;
        boolean bool1;
        StringBuilder localStringBuilder;
        if (QLog.isColorLevel())
        {
          QLog.e("Q.msg.UncommonMessageProcessor", 2, "<---handleSendBlessMessageResp : invalid.", paramToServiceMsg);
          localStringBuilder = new StringBuilder().append("<---handleSendBlessMessageResp : data:");
          if (paramObject != null) {
            break label303;
          }
        }
        label303:
        for (paramToServiceMsg = "null";; paramToServiceMsg = Arrays.toString((byte[])paramObject))
        {
          QLog.e("Q.msg.UncommonMessageProcessor", 2, paramToServiceMsg);
          paramToServiceMsg = new msg_svc.PbSendMsgResp();
          break;
        }
        if (result.get() != 0)
        {
          i1 = result.get();
          continue;
          label339:
          bool1 = bool2;
          if (i1 == 67)
          {
            l1 = uint32_svrbusy_wait_time.get();
            bool1 = bool2;
          }
        }
        else
        {
          i1 = 0;
        }
      }
    }
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    long l1 = extraData.getLong("bless_sendreq_time");
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(8018, false, new Object[] { Integer.valueOf(0) });
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, String.format("handleSendDirtyBlessTextCheckError, time: %d", new Object[] { Long.valueOf(l1) }));
    }
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    long l1 = extraData.getLong("bless_sendreq_time");
    paramToServiceMsg = new blessing_helper.msg();
    try
    {
      i1 = mergeFromresult.get();
      paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
      if (i1 == 0)
      {
        bool = true;
        paramToServiceMsg.b(8018, bool, new Object[] { Integer.valueOf(i1) });
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.UncommonMessageProcessor", 2, String.format("handleSendDirtyBlessTextCheckResp, time: %d, result: %d", new Object[] { Long.valueOf(l1), Integer.valueOf(i1) }));
        }
        return;
      }
    }
    catch (Exception paramToServiceMsg)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.UncommonMessageProcessor", 2, String.format("handleSendDirtyBlessTextCheckResp, parse data error", new Object[0]));
        }
        int i1 = -1;
        continue;
        boolean bool = false;
      }
    }
  }
  
  public static void b(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("pm_uin", paramString);
    localHashMap.put("pm_uinType", String.valueOf(paramInt1));
    localHashMap.put("pm_errorType", String.valueOf(paramInt2));
    localHashMap.put("pm_errorSubType", String.valueOf(paramInt3));
    AppInterface localAppInterface = (AppInterface)BaseApplicationImpl.a().a();
    StatisticCollector.a(BaseApplication.getContext()).a(localAppInterface.a(), "revokeMsgErrorTag", false, 0L, 0L, localHashMap, "");
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, String.format("Statistics TAG:%s, uin:%s, uinType:%d, errorType:%d, errorSubType:%d", new Object[] { "revokeMsgErrorTag", paramString, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Integer.valueOf(paramInt3) }));
    }
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    int i1 = extraData.getInt("MARK_REQUEST_REVOKE_OR_DELETEMULTI ");
    String str;
    long l1;
    long l2;
    long l3;
    int i2;
    if (i1 == 1)
    {
      ArrayList localArrayList = extraData.getParcelableArrayList("key_msg_info_revoke");
      str = get0jdField_a_of_type_JavaLangString;
      i1 = get0jdField_a_of_type_Int;
      l1 = get0b;
      l2 = get0jdField_a_of_type_Long;
      l3 = get0c;
      i2 = paramFromServiceMsg.getResultCode();
      if (i2 == 2901)
      {
        long l4 = System.currentTimeMillis();
        long l5 = extraData.getLong("key_msg_info_time_start", 0L);
        l4 = paramToServiceMsg.getTimeout() - (l4 - l5);
        if (QLog.isColorLevel()) {
          QLog.d("revokeMsg", 2, "handleRevokeMsgError, 2901 error, resend timeout: " + l4);
        }
        if (l4 > 0L)
        {
          paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("PbMessageSvc.PbMsgWithDraw");
          paramFromServiceMsg.setTimeout(l4);
          paramFromServiceMsg.putWupBuffer(paramToServiceMsg.getWupBuffer());
          extraData.putLong("key_msg_info_time_start", System.currentTimeMillis());
          extraData.putParcelableArrayList("key_msg_info_revoke", localArrayList);
          extraData.putInt("MARK_REQUEST_REVOKE_OR_DELETEMULTI ", 1);
          paramFromServiceMsg.setEnableFastResend(true);
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.c(paramFromServiceMsg);
        }
      }
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            if (QLog.isColorLevel()) {
              QLog.d("revokeMsg", 2, String.format("handleRevokeMsgError,frienduin %s, istroop %s, msgUid %s, time %s, shmsgseq %s", new Object[] { str, Integer.valueOf(i1), Long.valueOf(l1), Long.valueOf(l3), Long.valueOf(l2) }));
            }
            a(str, i1, j, i2);
            return;
          } while (i1 != 2);
          l1 = extraData.getLong("msgSeq");
          l2 = extraData.getLong("timeOut");
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
          paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
        } while (paramToServiceMsg == null);
        if (paramFromServiceMsg.getResultCode() != 2901) {
          break;
        }
        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
        paramToServiceMsg.getClass();
      } while (paramFromServiceMsg.a(paramToServiceMsg, "msf"));
    } while ((1080000L != l2) && (!paramToServiceMsg.a()));
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "<---handleMultiDeleteMsgError : Failed at last.");
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int i1 = extraData.getInt("MARK_REQUEST_REVOKE_OR_DELETEMULTI ");
    int i3;
    int i4;
    long l1;
    Object localObject1;
    Object localObject2;
    Object localObject3;
    if (i1 == 2)
    {
      i3 = 1;
      i4 = 1;
      i2 = 1;
      l1 = extraData.getLong("msgSeq");
      localObject1 = new msg_svc.PbMsgWithDrawResp();
      try
      {
        paramObject = (msg_svc.PbMsgWithDrawResp)((msg_svc.PbMsgWithDrawResp)localObject1).mergeFrom((byte[])paramObject);
        if (c2c_with_draw.has())
        {
          paramObject = c2c_with_draw.get();
          i1 = i4;
          if (paramObject == null) {
            break label486;
          }
          i1 = i4;
          if (paramObject.isEmpty()) {
            break label486;
          }
          paramObject = paramObject.iterator();
          for (;;)
          {
            i1 = i2;
            if (!paramObject.hasNext()) {
              break;
            }
            localObject1 = (msg_svc.PbC2CMsgWithDrawResp)paramObject.next();
            i3 = result.get();
            localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
            i1 = i2;
            if (i3 == 255)
            {
              localObject3 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
              localObject2.getClass();
              ((MessageHandler)localObject3).a((SendMessageHandler)localObject2, "server");
              i1 = 0;
            }
            localObject1 = errmsg.get();
            i2 = i1;
            if (QLog.isColorLevel())
            {
              QLog.d("revokeMsg", 2, String.format("handleDeleteMultiMsgResp,result: %s, errorMsg: %s", new Object[] { Integer.valueOf(i3), localObject1 }));
              i2 = i1;
            }
          }
        }
      }
      catch (Exception paramToServiceMsg)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.UncommonMessageProcessor", 2, "<---handleDeleteMultiMsgResp : ParseFrom PbMsgWithDrawResp Error.");
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
      }
    }
    for (;;)
    {
      i1 = i4;
      if (group_with_draw.has())
      {
        paramObject = group_with_draw.get();
        i1 = i4;
        if (paramObject != null)
        {
          i1 = i4;
          if (!paramObject.isEmpty())
          {
            paramObject = paramObject.iterator();
            i2 = i3;
            for (;;)
            {
              i1 = i2;
              if (!paramObject.hasNext()) {
                break;
              }
              localObject1 = (msg_svc.PbGroupMsgWithDrawResp)paramObject.next();
              i3 = result.get();
              jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
              localObject2 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
              i1 = i2;
              if (i3 == 255)
              {
                localObject3 = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
                localObject2.getClass();
                ((MessageHandler)localObject3).a((SendMessageHandler)localObject2, "server");
                i1 = 0;
              }
              localObject1 = errmsg.get();
              i2 = i1;
              if (QLog.isColorLevel())
              {
                QLog.d("revokeMsg", 2, String.format("handleDeleteMultiMsgResp,result: %s, errorMsg: %s", new Object[] { Integer.valueOf(i3), localObject1 }));
                i2 = i1;
              }
            }
          }
        }
      }
      label486:
      if (i1 != 0)
      {
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1);
        return;
        if (i1 == 1)
        {
          localObject1 = extraData.getParcelableArrayList("key_msg_info_revoke");
          if ((localObject1 == null) || (((ArrayList)localObject1).isEmpty()))
          {
            a(" ", 0, i, r);
            return;
          }
          i4 = get0jdField_a_of_type_Int;
          if (QLog.isColorLevel())
          {
            paramToServiceMsg = ((ArrayList)localObject1).iterator();
            while (paramToServiceMsg.hasNext())
            {
              paramFromServiceMsg = (RevokeMsgInfo)paramToServiceMsg.next();
              QLog.d("revokeMsg", 2, "handleRevokeMsgResp," + paramFromServiceMsg.toString());
            }
          }
          paramToServiceMsg = new msg_svc.PbMsgWithDrawResp();
          for (;;)
          {
            try
            {
              paramFromServiceMsg = (msg_svc.PbMsgWithDrawResp)paramToServiceMsg.mergeFrom((byte[])paramObject);
              paramToServiceMsg = null;
              if (!c2c_with_draw.has()) {
                break label875;
              }
              paramObject = c2c_with_draw.get();
              if ((paramObject == null) || (paramObject.isEmpty()) || (get0uint32_sub_cmd.get() != 1)) {
                break label875;
              }
              paramFromServiceMsg = paramObject.iterator();
              paramToServiceMsg = null;
              if (!paramFromServiceMsg.hasNext()) {
                break;
              }
              paramObject = (msg_svc.PbC2CMsgWithDrawResp)paramFromServiceMsg.next();
              i1 = result.get();
              if ((i1 >= 0) && (i1 <= 1000))
              {
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((ArrayList)localObject1);
                if (QLog.isColorLevel()) {
                  QLog.d("revokeMsg", 2, String.format("handleRevokeMsgResp,result: %s, errorMsg: %s", new Object[] { Integer.valueOf(i1), paramToServiceMsg }));
                }
                continue;
              }
              paramToServiceMsg = errmsg.get();
            }
            catch (Exception paramToServiceMsg)
            {
              if (QLog.isColorLevel()) {
                QLog.e("Q.msg.UncommonMessageProcessor", 2, "<---handleRevokeMsgResp : ParseFrom PbMsgWithDrawResp Error.");
              }
              a(get0jdField_a_of_type_JavaLangString, i4, i, s);
              return;
            }
            a(get0jdField_a_of_type_JavaLangString, i4, i, i1);
          }
          label875:
          if (group_with_draw.has())
          {
            paramFromServiceMsg = group_with_draw.get();
            if ((paramFromServiceMsg != null) && (!paramFromServiceMsg.isEmpty()) && (get0uint32_sub_cmd.get() == 1))
            {
              localObject2 = paramFromServiceMsg.iterator();
              while (((Iterator)localObject2).hasNext())
              {
                localObject3 = (msg_svc.PbGroupMsgWithDrawResp)((Iterator)localObject2).next();
                int i5 = result.get();
                if ((i5 != 0) && (i5 != 1002) && (i5 != 1004) && (i5 != 1006)) {
                  break label1045;
                }
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((ArrayList)localObject1);
                if (QLog.isColorLevel()) {
                  QLog.d("revokeMsg", 2, String.format("handleRevokeMsgResp,result: %s, errorMsg: %s", new Object[] { Integer.valueOf(i5), paramToServiceMsg }));
                }
              }
            }
          }
        }
      }
    }
    label1045:
    int i2 = 0;
    if (failed_msg_list.has())
    {
      List localList = failed_msg_list.get();
      if ((localList != null) && (!localList.isEmpty()))
      {
        Iterator localIterator = localList.iterator();
        i1 = 0;
        i2 = 0;
        while (localIterator.hasNext())
        {
          paramObject = (msg_svc.PbGroupMsgWithDrawResp.MessageResult)localIterator.next();
          i3 = uint32_result.get();
          int i6 = uint32_msg_seq.get();
          paramFromServiceMsg = "";
          try
          {
            paramObject = bytes_err_msg.get().toStringUtf8();
            paramFromServiceMsg = paramObject;
          }
          catch (Exception paramObject)
          {
            for (;;)
            {
              continue;
              i2 = i1;
              i1 = 0;
              continue;
              i1 = i2;
            }
          }
          if (i3 != 4) {
            break label1313;
          }
          i1 = i2 + 1;
          if (QLog.isColorLevel()) {
            QLog.d("revokeMsg", 2, String.format("handleRevokeMsgResp, more failInfo, shmsgseq: %s, result: %s, errorMsg: %s", new Object[] { Integer.valueOf(i6), Integer.valueOf(i3), paramFromServiceMsg }));
          }
          i2 = i1;
          i1 = i3;
        }
        if (i2 == localList.size())
        {
          i3 = 1;
          i2 = i1;
        }
      }
    }
    label1313:
    for (i1 = i3;; i1 = 0)
    {
      if (i1 != 0)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((ArrayList)localObject1);
        break;
      }
      paramToServiceMsg = errmsg.get();
      a(get0jdField_a_of_type_JavaLangString, i4, i, i2);
      break;
    }
  }
  
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    long l1 = extraData.getLong("seq");
    long l2 = extraData.getLong("uniseq");
    long l3 = extraData.getLong("timeOut");
    int i1 = extraData.getInt("uintype");
    int i2 = extraData.getInt("msgrandom");
    String str = extraData.getString("peeruin");
    long l4 = extraData.getLong("msgSeq");
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "<DELMSG><E><---handleDeleteMsgError : uinType :" + i1 + " uin:" + str + " seq:" + l1 + " uniseq:" + l2 + " random:" + i2 + " timeOut:" + l3 + " reqSeq:" + l4);
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
    paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l4);
    if (paramToServiceMsg != null)
    {
      if (paramFromServiceMsg.getResultCode() != 2901) {
        break label226;
      }
      paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
      paramToServiceMsg.getClass();
      if (!paramFromServiceMsg.a(paramToServiceMsg, "msf")) {
        break label226;
      }
    }
    label226:
    while ((1080000L != l3) && (!paramToServiceMsg.a())) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "<---handleDeleteMsgError : Failed at last.");
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l4);
  }
  
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    long l1 = extraData.getLong("seq");
    long l2 = extraData.getLong("uniseq");
    int i1 = extraData.getInt("uintype");
    int i2 = extraData.getInt("msgrandom");
    Object localObject = extraData.getString("peeruin");
    long l3 = extraData.getLong("msgSeq");
    long l4 = MessageUtils.a(i2);
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, "<DELMSG><R><---handleDeleteMsgResp : uinType :" + i1 + " uin:" + (String)localObject + " seq:" + l1 + " uniseq:" + l2 + " msgUid:" + l4 + " random:" + i2 + " reqSeq:" + l3);
    }
    localObject = new msg_svc.PbDelRoamMsgResp();
    try
    {
      paramObject = (msg_svc.PbDelRoamMsgResp)((msg_svc.PbDelRoamMsgResp)localObject).mergeFrom((byte[])paramObject);
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramToServiceMsg, paramFromServiceMsg);
      paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3);
      if (paramToServiceMsg == null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.UncommonMessageProcessor", 2, "<DELMSG><R><---handleSendC2CMessageResp_PB : ---cmd:" + paramFromServiceMsg.getServiceCmd() + ",no SendMessageHandler found.");
        }
        return;
      }
    }
    catch (Exception paramObject)
    {
      do
      {
        do
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("Q.msg.UncommonMessageProcessor", 2, "<---handleDeleteMsgResp : ParseFrom PbDelRoamMsgResp Error.");
            }
            paramObject = null;
          }
        } while ((paramObject == null) || (!result.has()));
        i1 = result.get();
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.UncommonMessageProcessor", 2, "<DELMSG><R><---handleDeleteMsgResp : result :" + i1);
        }
        if ((i1 != 17) && (i1 != -102) && (i1 != 255)) {
          break;
        }
        paramFromServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
        paramToServiceMsg.getClass();
      } while (!paramFromServiceMsg.a(paramToServiceMsg, "server"));
      return;
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l3);
    }
  }
  
  public ToServiceMsg a(List paramList, int paramInt)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return null;
    }
    long l1 = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = (MessageRecord)paramList.get(0);
    boolean bool = ((MessageRecord)localObject1).isLongMsg();
    int i2 = istroop;
    int i1;
    if (i2 == 1000) {
      i1 = 1;
    }
    for (;;)
    {
      if (paramInt == 1) {
        localObject1 = "sendRevokeMsgReq";
      }
      for (;;)
      {
        Object localObject3 = new ArrayList();
        Object localObject2;
        Object localObject4;
        MessageRecord localMessageRecord;
        int i3;
        Object localObject5;
        FileManagerEntity localFileManagerEntity;
        switch (i2)
        {
        default: 
          paramList = null;
          localObject1 = null;
          localObject2 = new msg_svc.PbMsgWithDrawReq();
          if (localObject1 != null) {
            c2c_with_draw.add((MessageMicro)localObject1);
          }
          if (paramList != null) {
            group_with_draw.add(paramList);
          }
          paramList = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("PbMessageSvc.PbMsgWithDraw");
          paramList.putWupBuffer(((msg_svc.PbMsgWithDrawReq)localObject2).toByteArray());
          extraData.putLong("key_msg_info_time_start", l1);
          extraData.putParcelableArrayList("key_msg_info_revoke", localArrayList);
          extraData.putInt("MARK_REQUEST_REVOKE_OR_DELETEMULTI ", paramInt);
          paramList.setEnableFastResend(true);
          return paramList;
          if (i2 != 1004) {
            break label1445;
          }
          i1 = 2;
          break;
          if (paramInt == 2) {
            localObject1 = "sendDeleteMultiMsgReq";
          }
          break;
        case 0: 
        case 1000: 
        case 1004: 
          localObject2 = new msg_svc.PbC2CMsgWithDrawReq();
          uint32_sub_cmd.set(paramInt);
          localObject4 = paramList.iterator();
          while (((Iterator)localObject4).hasNext())
          {
            localMessageRecord = (MessageRecord)((Iterator)localObject4).next();
            i2 = (short)(int)shmsgseq;
            i3 = MessageUtils.b(msgUid);
            localObject5 = new msg_svc.PbC2CMsgWithDrawReq.MsgInfo();
            uint64_from_uin.set(Long.valueOf(selfuin).longValue());
            uint64_to_uin.set(Long.valueOf(frienduin).longValue());
            uint32_msg_seq.set(0xFFFF & i2);
            uint64_msg_uid.set(msgUid);
            uint64_msg_time.set(time);
            uint32_msg_random.set(i3);
            if (localMessageRecord.isLongMsg())
            {
              uint32_div_seq.set(longMsgId);
              uint32_pkg_num.set(longMsgCount);
              uint32_pkg_index.set(longMsgIndex);
            }
            if (msgtype == 63531)
            {
              localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, frienduin, istroop);
              if ((localFileManagerEntity != null) && (!TextUtils.isEmpty(Uuid))) {
                ((ArrayList)localObject3).add(Uuid);
              }
              uint32_msg_type.set(1);
            }
            msg_info.add((MessageMicro)localObject5);
            localArrayList.add(new RevokeMsgInfo(localMessageRecord));
            if (QLog.isColorLevel()) {
              QLog.d("revokeMsg", 2, String.format((String)localObject1 + ",istroop %s, frienduin %s, shmsgseq %s, time %s, random %s, uid %s", new Object[] { Integer.valueOf(istroop), frienduin, Long.valueOf(shmsgseq), Long.valueOf(time), Integer.valueOf(i3), Long.valueOf(msgUid) }));
            }
          }
          if (bool) {
            uint32_long_message_flag.set(1);
          }
          for (;;)
          {
            localObject1 = new msgrevoke_userdef.UinTypeUserDef();
            uint32_from_uin_type.set(i1);
            if (((ArrayList)localObject3).size() > 0) {
              str_file_uuid.addAll((Collection)localObject3);
            }
            if ((i1 == 1) || (i1 == 2)) {
              uint64_from_group_code.set(Long.valueOf(get0senderuin).longValue());
            }
            bytes_reserved.set(ByteStringMicro.copyFrom(((msgrevoke_userdef.UinTypeUserDef)localObject1).toByteArray()));
            paramList = null;
            localObject1 = localObject2;
            break;
            uint32_long_message_flag.set(0);
          }
        case 1: 
        case 3000: 
          localObject2 = new msg_svc.PbGroupMsgWithDrawReq();
          localObject4 = paramList.iterator();
          while (((Iterator)localObject4).hasNext())
          {
            localMessageRecord = (MessageRecord)((Iterator)localObject4).next();
            i1 = (int)shmsgseq;
            i3 = MessageUtils.b(msgUid);
            localObject5 = new msg_svc.PbGroupMsgWithDrawReq.MessageInfo();
            uint32_msg_seq.set(i1 & 0xFFFFFFFF);
            uint32_msg_random.set(i3);
            if (msgtype == 63531)
            {
              localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, frienduin, istroop);
              if ((localFileManagerEntity != null) && (!TextUtils.isEmpty(Uuid))) {
                ((ArrayList)localObject3).add(Uuid);
              }
              uint32_msg_type.set(1);
            }
            msg_list.add((MessageMicro)localObject5);
            localArrayList.add(new RevokeMsgInfo(localMessageRecord));
            if (QLog.isColorLevel()) {
              QLog.d("revokeMsg", 2, String.format((String)localObject1 + ",istroop %s, frienduin %s, shmsgseq %s", new Object[] { Integer.valueOf(istroop), frienduin, Long.valueOf(shmsgseq) }));
            }
          }
          uint32_sub_cmd.set(paramInt);
          if (i2 == 1)
          {
            uint32_group_type.set(0);
            label1085:
            uint64_group_code.set(Long.valueOf(get0frienduin).longValue());
            localObject1 = new msgrevoke_userdef.MsgInfoUserDef();
            if (((ArrayList)localObject3).size() > 0) {
              str_file_uuid.addAll((Collection)localObject3);
            }
            if (paramInt != 1) {
              break label1318;
            }
            if (bool) {
              break label1203;
            }
            uint32_long_message_flag.set(0);
          }
          for (;;)
          {
            bytes_userdef.set(ByteStringMicro.copyFrom(((msgrevoke_userdef.MsgInfoUserDef)localObject1).toByteArray()));
            paramList = (List)localObject2;
            localObject1 = null;
            break;
            if (i2 != 3000) {
              break label1085;
            }
            uint32_group_type.set(1);
            break label1085;
            label1203:
            uint32_long_message_flag.set(1);
            paramList = paramList.iterator();
            while (paramList.hasNext())
            {
              localObject3 = (MessageRecord)paramList.next();
              i1 = (int)shmsgseq;
              localObject4 = new msgrevoke_userdef.MsgInfoUserDef.MsgInfoDef();
              uint32_msg_seq.set(i1 & 0xFFFFFFFF);
              long_msg_id.set(longMsgId);
              long_msg_num.set(longMsgCount);
              long_msg_index.set(longMsgIndex);
              long_msg_info.add((MessageMicro)localObject4);
            }
            continue;
            label1318:
            if (paramInt == 2)
            {
              paramList = paramList.iterator();
              while (paramList.hasNext())
              {
                localObject3 = (MessageRecord)paramList.next();
                i1 = (int)shmsgseq;
                localObject4 = new msgrevoke_userdef.MsgInfoUserDef.MsgInfoDef();
                uint32_msg_seq.set(i1 & 0xFFFFFFFF);
                if (((MessageRecord)localObject3).isLongMsg())
                {
                  long_msg_id.set(longMsgId);
                  long_msg_num.set(longMsgCount);
                  long_msg_index.set(longMsgIndex);
                }
                long_msg_info.add((MessageMicro)localObject4);
              }
            }
          }
          localObject1 = "";
        }
      }
      label1445:
      i1 = 0;
    }
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
    case 8001: 
      a(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 8002: 
      c(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 8003: 
      d(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    b(paramToServiceMsg, paramFromServiceMsg);
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 8001: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 8002: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        c((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    case 8003: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        d((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
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
  
  public void a(MessageRecord paramMessageRecord)
  {
    Object localObject;
    if ((paramMessageRecord == null) || ((istroop != 0) && (istroop != 1) && (istroop != 3000) && (istroop != 1000) && (istroop != 1004))) {
      if (QLog.isColorLevel())
      {
        localObject = new StringBuilder().append("<DELMSG><S>--->deleteMsgFromServerInner:");
        if (paramMessageRecord != null) {
          break label94;
        }
        paramMessageRecord = "mr is Null.";
        QLog.d("Q.msg.UncommonMessageProcessor", 2, paramMessageRecord);
      }
    }
    label94:
    label187:
    label454:
    for (;;)
    {
      return;
      paramMessageRecord = " isTroop:" + istroop;
      break;
      if ((!MsgProxyUtils.q(msgtype)) && (MsgProxyUtils.f(msgtype)))
      {
        localObject = new ArrayList();
        int i3;
        int i1;
        if ((paramMessageRecord instanceof MessageForLongMsg))
        {
          if (QLog.isColorLevel()) {
            QLog.w("Q.msg.UncommonMessageProcessor", 2, "--->deleteMsgFromServer : is long msg, sent from local, find the prepare slice to del.");
          }
          ((List)localObject).addAll(longMsgFragmentList);
          i3 = ((List)localObject).size();
          i1 = 0;
        }
        for (;;)
        {
          if (i1 >= i3) {
            break label454;
          }
          MessageRecord localMessageRecord = (MessageRecord)((List)localObject).get(i1);
          if (localMessageRecord.isSendFromLocal())
          {
            if (extraflag == 32772)
            {
              if (istroop == 0)
              {
                if (QLog.isColorLevel()) {
                  QLog.d("Q.msg.UncommonMessageProcessor", 2, "--->deleteMsgFromServer : delete a sending C2C msg, waitting for the response to complete.");
                }
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramMessageRecord);
                return;
                ((List)localObject).add(paramMessageRecord);
                break label187;
              }
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d("Q.msg.UncommonMessageProcessor", 2, "--->deleteMsgFromServer : delete a sending group/dics msg, waitting for the push to complete.");
              return;
            }
            if (extraflag == 32768) {
              break;
            }
          }
          int i2 = MobileQQService.c;
          MobileQQService.c = i2 + 1;
          long l1 = i2;
          SendMessageHandler localSendMessageHandler = new SendMessageHandler();
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1, localSendMessageHandler);
          i2 = 0;
          while (i2 < 12)
          {
            localSendMessageHandler.a(new nle(this, localMessageRecord, l1));
            i2 += 1;
          }
          i2 = 0;
          if (i2 < 6)
          {
            if (i2 == 0) {}
            for (l1 = 1080000L;; l1 = (6 - i2) * 1080000 / 6 - i2 * 2000)
            {
              long l2 = i2 * 1080000 / 6;
              localSendMessageHandler.getClass();
              localSendMessageHandler.a(l2, l1, "period");
              i2 += 1;
              break;
            }
          }
          i1 += 1;
        }
      }
    }
  }
  
  public void a(MessageRecord paramMessageRecord, ArrayList paramArrayList, ChatActivityFacade.HongbaoParams paramHongbaoParams)
  {
    paramArrayList = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramMessageRecord, paramArrayList, paramHongbaoParams);
    if (paramArrayList == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.UncommonMessageProcessor", 2, "sendBlessMsg error, msgReq is null!");
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(8019, false, new Object[] { Integer.valueOf(0), Long.valueOf(0L) });
      return;
    }
    a(false, true, true, 0L, new nlc(this, paramMessageRecord, paramArrayList));
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().f())
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(8016, false, null);
      b(paramString, paramInt1, paramInt2, paramInt3);
    }
  }
  
  public void a(String paramString, ArrayList paramArrayList)
  {
    if ((paramString == null) || (paramArrayList == null) || (paramArrayList.size() == 0)) {
      return;
    }
    long l1 = MessageCache.a();
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.UncommonMessageProcessor", 2, String.format("sendDirtyBlessTextCheckReq, time: %d, toUinCount: %d", new Object[] { Long.valueOf(l1), Integer.valueOf(paramArrayList.size()) }));
    }
    blessing_helper.msg localMsg = new blessing_helper.msg();
    version.set(1);
    uin.set(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin());
    time.set(l1);
    number.set(1);
    text.set(ByteStringMicro.copyFrom(paramString.getBytes()));
    touin_count.set(paramArrayList.size());
    paramString = paramArrayList.iterator();
    while (paramString.hasNext())
    {
      paramArrayList = (String)paramString.next();
      touin_list.add(Long.valueOf(paramArrayList));
    }
    paramString = jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a("SecSvcBlessingHelper.blessing_helper");
    extraData.putLong("bless_sendreq_time", l1);
    paramString.putWupBuffer(localMsg.toByteArray());
    paramString.setTimeout(15000L);
    paramString.setEnableFastResend(true);
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(paramString);
  }
  
  public void a(List paramList)
  {
    int i1 = MobileQQService.c;
    MobileQQService.c = i1 + 1;
    long l1 = i1;
    SendMessageHandler localSendMessageHandler = new SendMessageHandler();
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(l1, localSendMessageHandler);
    paramList = a(paramList, 2);
    if (paramList == null) {
      return;
    }
    extraData.putLong("msgSeq", l1);
    i1 = 0;
    while (i1 < 12)
    {
      localSendMessageHandler.a(new nld(this, paramList));
      i1 += 1;
    }
    i1 = 0;
    label86:
    if (i1 < 6) {
      if (i1 != 0) {
        break label135;
      }
    }
    label135:
    for (l1 = 1080000L;; l1 = (6 - i1) * 1080000 / 6 - i1 * 2000)
    {
      long l2 = i1 * 1080000 / 6;
      localSendMessageHandler.getClass();
      localSendMessageHandler.a(l2, l1, "period");
      i1 += 1;
      break label86;
      break;
    }
  }
  
  public void a(List paramList, boolean paramBoolean)
  {
    if ((paramBoolean) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().f())) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(8016, true, new Object[] { paramList, Boolean.valueOf(paramBoolean) });
  }
  
  public void b(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 8001: 
      a(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 8002: 
      c(paramToServiceMsg, paramFromServiceMsg);
      return;
    case 8003: 
      d(paramToServiceMsg, paramFromServiceMsg);
      return;
    }
    b(paramToServiceMsg, paramFromServiceMsg);
  }
}
