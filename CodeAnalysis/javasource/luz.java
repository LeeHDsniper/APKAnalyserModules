import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class luz
  implements Runnable
{
  public luz(MainAssistObserver paramMainAssistObserver, QQMessageFacade paramQQMessageFacade, QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.e();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new lva(this, i));
  }
}
