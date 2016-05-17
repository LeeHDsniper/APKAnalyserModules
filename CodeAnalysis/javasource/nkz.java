import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.transfile.ProtoReqManager.IProtoRespBack;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoReq;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoResp;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.util.QLog;
import tencent.mobileim.structmsg.structmsg.RspHead;
import tencent.mobileim.structmsg.structmsg.RspSystemMsgRead;

public class nkz
  implements ProtoReqManager.IProtoRespBack
{
  public nkz(SystemMessageProcessor paramSystemMessageProcessor, long paramLong1, long paramLong2, long paramLong3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ProtoReqManager.ProtoResp paramProtoResp, ProtoReqManager.ProtoReq paramProtoReq)
  {
    try
    {
      paramProtoResp = a.getWupBuffer();
      paramProtoReq = new structmsg.RspSystemMsgRead();
      paramProtoReq.mergeFrom(paramProtoResp);
      int i = head.result.get();
      if (QLog.isColorLevel()) {
        QLog.d("Q.systemmsg.", 2, "clearGroupSystemMsgResp reqSeq=" + jdField_a_of_type_Long + ";resultCode=" + i + ";latestFriendSeq=" + b + ";latestGroupSeq=" + c);
      }
      return;
    }
    catch (Exception paramProtoResp)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("Q.systemmsg.", 2, "clearGroupSystemMsgResp exception", paramProtoResp);
    }
  }
}
