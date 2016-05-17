import com.tencent.mobileqq.activity.qwallet.PasswdRedBagDBManager;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagInfo;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mcp
  implements Runnable
{
  public mcp(PasswdRedBagManager paramPasswdRedBagManager, PasswdRedBagInfo paramPasswdRedBagInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PasswdRedBagManager.a(jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagManager).a(jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagInfo);
  }
}
