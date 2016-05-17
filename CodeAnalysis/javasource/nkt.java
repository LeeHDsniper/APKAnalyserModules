import android.os.Bundle;
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

public class nkt
  implements ProtoReqManager.IProtoRespBack
{
  public nkt(SystemMessageProcessor paramSystemMessageProcessor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ProtoReqManager.ProtoResp paramProtoResp, ProtoReqManager.ProtoReq paramProtoReq)
  {
    ToServiceMsg localToServiceMsg = (ToServiceMsg)a;
    if (a.getResultCode() != 1000) {
      a.a(4012, false, localToServiceMsg);
    }
    for (;;)
    {
      try
      {
        paramProtoResp = a.getWupBuffer();
        localRspSystemMsgAction = new structmsg.RspSystemMsgAction();
        localRspSystemMsgAction.mergeFrom(paramProtoResp);
        j = head.result.get();
        if (j != 0) {
          continue;
        }
        bool1 = true;
        paramProtoResp = msg_detail.get();
        if (paramProtoResp != null) {
          continue;
        }
        paramProtoResp = "";
      }
      catch (Exception paramProtoResp)
      {
        structmsg.RspSystemMsgAction localRspSystemMsgAction;
        int j;
        boolean bool1;
        int i;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgReadedReportResp exception", paramProtoResp);
        boolean bool2 = false;
        continue;
        continue;
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
      bool2 = bool1;
      if (QLog.isColorLevel())
      {
        QLog.d("Q.systemmsg.", 2, "sendFriendSystemMsgActionResp result:" + j + " msg:" + paramProtoResp);
        bool2 = bool1;
      }
      a.a(4011, bool2, localToServiceMsg);
      return;
      paramProtoReq = head.msg_fail.get();
      paramProtoResp = paramProtoReq;
      if (paramProtoReq == null) {
        paramProtoResp = "";
      }
      extraData.putString("system_msg_action_resp_error_key", paramProtoResp);
      bool1 = false;
    }
  }
}
