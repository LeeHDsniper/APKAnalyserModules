import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler.SendMessageRunnable;

public class nle
  extends SendMessageHandler.SendMessageRunnable
{
  public nle(UncommonMessageProcessor paramUncommonMessageProcessor, MessageRecord paramMessageRecord, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    UncommonMessageProcessor.a(jdField_a_of_type_ComTencentMobileqqAppMessageUncommonMessageProcessor, jdField_a_of_type_ComTencentMobileqqDataMessageRecord, jdField_a_of_type_Long, c, jdField_a_of_type_Int);
  }
}
