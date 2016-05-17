import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.BaseMessageProcessor;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.remote.ToServiceMsg;
import msf.msgsvc.msg_svc.PbMsgReadedReportReq;

public class njh
  implements BaseMessageProcessor.RequestBuilder
{
  public njh(BaseMessageProcessor paramBaseMessageProcessor, msg_svc.PbMsgReadedReportReq paramPbMsgReadedReportReq)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ToServiceMsg a()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageProcessor.a.a("PbMessageSvc.PbMsgReadedReport");
    byte[] arrayOfByte = jdField_a_of_type_MsfMsgsvcMsg_svc$PbMsgReadedReportReq.toByteArray();
    if (arrayOfByte != null)
    {
      localToServiceMsg.putWupBuffer(arrayOfByte);
      localToServiceMsg.setEnableFastResend(true);
      return localToServiceMsg;
    }
    return null;
  }
}
