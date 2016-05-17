import android.os.Bundle;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler.SendMessageRunnable;
import com.tencent.qphone.base.remote.ToServiceMsg;

public class nld
  extends SendMessageHandler.SendMessageRunnable
{
  public nld(UncommonMessageProcessor paramUncommonMessageProcessor, ToServiceMsg paramToServiceMsg)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.setTimeout(c);
    jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.extraData.putInt("retryIndex", jdField_a_of_type_Int);
    jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.extraData.putLong("timeOut", c);
    jdField_a_of_type_ComTencentMobileqqAppMessageUncommonMessageProcessor.a.c(jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg);
  }
}
