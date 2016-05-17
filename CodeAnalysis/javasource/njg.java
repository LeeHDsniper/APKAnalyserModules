import android.os.Bundle;
import com.tencent.mobileqq.app.message.BaseMessageProcessor;
import com.tencent.mobileqq.app.message.BaseMessageProcessor.RequestBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler.SendMessageRunnable;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;

public class njg
  extends SendMessageHandler.SendMessageRunnable
{
  public njg(BaseMessageProcessor paramBaseMessageProcessor, BaseMessageProcessor.RequestBuilder paramRequestBuilder, long paramLong1, long paramLong2, boolean paramBoolean1, boolean paramBoolean2)
  {
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    ToServiceMsg localToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageProcessor$RequestBuilder.a();
    if (localToServiceMsg == null) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "prepareRetryRunnable cmd=" + localToServiceMsg.getServiceCmd() + ",reqSeq=" + jdField_a_of_type_Long + " timeout: " + c + " retryIndex:" + jdField_a_of_type_Int);
    }
    extraData.putLong("timeOut", c);
    extraData.putLong("startTime", jdField_b_of_type_Long);
    extraData.putInt("retryIndex", jdField_a_of_type_Int);
    localToServiceMsg.setTimeout(c);
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageProcessor.a(localToServiceMsg, jdField_a_of_type_Long, jdField_a_of_type_Boolean, jdField_b_of_type_Boolean);
  }
}
