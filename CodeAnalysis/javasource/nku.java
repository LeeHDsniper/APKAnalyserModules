import android.os.Bundle;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.transfile.ProtoReqManager.IProtoRespBack;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoReq;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoResp;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import tencent.mobileim.structmsg.structmsg.RspHead;
import tencent.mobileim.structmsg.structmsg.RspSystemMsgAction;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgActionInfo;

public class nku
  implements ProtoReqManager.IProtoRespBack
{
  public nku(SystemMessageProcessor paramSystemMessageProcessor, int paramInt1, int paramInt2, structmsg.SystemMsgActionInfo paramSystemMsgActionInfo, structmsg.StructMsg paramStructMsg, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ProtoReqManager.ProtoResp paramProtoResp, ProtoReqManager.ProtoReq paramProtoReq)
  {
    bool1 = true;
    ToServiceMsg localToServiceMsg = (ToServiceMsg)a;
    if (a.getResultCode() != 1000)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageSystemMessageProcessor.a(4012, false, localToServiceMsg);
      if (QLog.isColorLevel()) {
        QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgReadedReportResp exception code:" + a.getResultCode());
      }
      return;
    }
    try
    {
      paramProtoResp = a.getWupBuffer();
      localRspSystemMsgAction = new structmsg.RspSystemMsgAction();
      localRspSystemMsgAction.mergeFrom(paramProtoResp);
      j = head.result.get();
      if (j != 0) {
        break label428;
      }
      paramProtoResp = msg_detail.get();
      if (paramProtoResp != null) {
        break label534;
      }
      paramProtoResp = "";
    }
    catch (Exception paramProtoResp)
    {
      for (;;)
      {
        structmsg.RspSystemMsgAction localRspSystemMsgAction;
        int j;
        int i;
        boolean bool2;
        if (QLog.isColorLevel()) {
          QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgReadedReportResp exception", paramProtoResp);
        }
        bool1 = false;
      }
    }
    i = -1;
    if (remark_result.has()) {
      i = remark_result.get();
    }
    extraData.putString("system_msg_action_resp_key", paramProtoResp);
    extraData.putInt("system_msg_action_resp_result_code_key", head.result.get());
    extraData.putInt("system_msg_action_resp_type_key", type.get());
    extraData.putString("system_msg_action_resp_invalid_decided_key", msg_invalid_decided.get());
    extraData.putInt("system_msg_action_resp_remark_result_key", i);
    bool2 = extraData.getBoolean("isUncommonlyUsedFrd");
    if ((bool1) && (jdField_a_of_type_Int == 0))
    {
      paramProtoReq = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppMessageSystemMessageProcessor.a.a(1);
      if ((b != 3016) && (b != 2016)) {
        break label466;
      }
      if ((jdField_a_of_type_TencentMobileimStructmsgStructmsg$SystemMsgActionInfo.group_id.has()) && (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg != null) && (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_source.has())) {
        paramProtoReq.a(String.valueOf(jdField_a_of_type_Long), jdField_a_of_type_TencentMobileimStructmsgStructmsg$SystemMsgActionInfo.group_id.get(), b, jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_source.get(), false, bool2);
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgActionResp result:" + j + " msg:" + paramProtoResp);
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageSystemMessageProcessor.a(4011, bool1, localToServiceMsg);
      return;
      label428:
      paramProtoReq = head.msg_fail.get();
      paramProtoResp = paramProtoReq;
      if (paramProtoReq == null) {
        paramProtoResp = "";
      }
      extraData.putString("system_msg_action_resp_error_key", paramProtoResp);
      bool1 = false;
      break;
      label466:
      if (jdField_a_of_type_TencentMobileimStructmsgStructmsg$SystemMsgActionInfo.group_id.has()) {
        paramProtoReq.a(String.valueOf(jdField_a_of_type_Long), jdField_a_of_type_TencentMobileimStructmsgStructmsg$SystemMsgActionInfo.group_id.get(), b, null, false, bool2);
      }
    }
  }
}
