import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.C2CMessageManager;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class njk
  implements Runnable
{
  public njk(C2CMessageManager paramC2CMessageManager, MessageRecord paramMessageRecord)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager", 2, "doMsgRevokeRequest " + jdField_a_of_type_ComTencentMobileqqDataMessageRecord.getLogColorContent());
    }
    jdField_a_of_type_ComTencentMobileqqAppMessageC2CMessageManager.a.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageRecord, 15000L);
  }
}
