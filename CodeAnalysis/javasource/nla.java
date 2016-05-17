import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.remote.ToServiceMsg;
import tencent.mobileim.structmsg.structmsg.ReqSystemMsgRead;

public class nla
  implements BaseMessageProcessor.RequestBuilder
{
  public nla(SystemMessageProcessor paramSystemMessageProcessor, long paramLong1, long paramLong2, structmsg.ReqSystemMsgRead paramReqSystemMsgRead)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ToServiceMsg a()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageSystemMessageProcessor.a.a("ProfileService.Pb.ReqSystemMsgRead");
    extraData.putLong("latestFriendSeq", jdField_a_of_type_Long);
    extraData.putLong("latestGroupSeq", b);
    extraData.putLong("type", 1L);
    localToServiceMsg.putWupBuffer(jdField_a_of_type_TencentMobileimStructmsgStructmsg$ReqSystemMsgRead.toByteArray());
    localToServiceMsg.setEnableFastResend(true);
    return localToServiceMsg;
  }
}
