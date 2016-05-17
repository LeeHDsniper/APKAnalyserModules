import android.os.Handler;
import com.tencent.mobileqq.app.message.BaseMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.RefreshMessageContext;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class niz
  implements Runnable
{
  public niz(BaseMessageManager paramBaseMessageManager, String paramString, int paramInt1, int paramInt2, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a("refreshMessageListHead uin = " + jdField_a_of_type_JavaLangString + ", type = " + jdField_a_of_type_Int + ", count = " + b + ", context = " + jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext, ", timestamp = " + System.currentTimeMillis());
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.b(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, b, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
    jdField_a_of_type_ComTencentMobileqqAppMessageBaseMessageManager.a.a.post(new nja(this));
  }
}
