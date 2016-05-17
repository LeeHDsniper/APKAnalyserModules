import com.tencent.mobileqq.app.message.BaseMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.RefreshMessageContext;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nkk
  implements Runnable
{
  public nkk(QQMessageFacade paramQQMessageFacade, int paramInt, String paramString, long paramLong, QQMessageFacade.RefreshMessageContext paramRefreshMessageContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_Int).a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, jdField_a_of_type_Long);
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = true;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.d = true;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.jdField_a_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.c = jdField_a_of_type_Int;
    jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
  }
}
