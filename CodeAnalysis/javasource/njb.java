import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.BaseMessageManager;
import com.tencent.mobileqq.app.message.UncommonMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;

public class njb
  implements Runnable
{
  public njb(BaseMessageManager paramBaseMessageManager, MessageRecord paramMessageRecord, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a().f(jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a();
    long l1 = System.currentTimeMillis();
    long l2 = jdField_a_of_type_Long;
    if (!jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop, jdField_a_of_type_ComTencentMobileqqDataMessageRecord.uniseq)) {
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord, 15000L - (l1 - l2));
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a().f(null);
      return;
      jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a().a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord.frienduin, jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop, UncommonMessageProcessor.h, UncommonMessageProcessor.o);
    }
  }
}
