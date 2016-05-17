import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.OnLinePushMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.subaccount.SubAccountControll;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import mqq.observer.SubAccountObserver;

public class nkf
  extends SubAccountObserver
{
  public nkf(OnLinePushMessageProcessor paramOnLinePushMessageProcessor, SubAccountManager paramSubAccountManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void onGetKeyBack(String paramString1, String paramString2, String paramString3)
  {
    if ((paramString3 == null) || (jdField_a_of_type_ComTencentMobileqqAppMessageOnLinePushMessageProcessor.a == null) || (paramString1 == null)) {}
    while (!paramString1.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppMessageOnLinePushMessageProcessor.a.getAccount())) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqSubaccountDatamanagerSubAccountManager.a(paramString2, paramString3, true);
    SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppMessageOnLinePushMessageProcessor.a, (byte)1, paramString2);
    SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppMessageOnLinePushMessageProcessor.a, paramString2, false);
  }
}
