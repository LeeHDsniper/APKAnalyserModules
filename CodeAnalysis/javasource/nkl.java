import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nkl
  implements Runnable
{
  public nkl(QQMessageFacade paramQQMessageFacade, MessageRecord paramMessageRecord, MessageObserver paramMessageObserver, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.c(jdField_a_of_type_ComTencentMobileqqDataMessageRecord, jdField_a_of_type_ComTencentMobileqqAppMessageObserver, jdField_a_of_type_Boolean);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      QLog.e("Q.msg.QQMessageFacade", 1, "smr error :", localRuntimeException);
      throw localRuntimeException;
    }
  }
}
