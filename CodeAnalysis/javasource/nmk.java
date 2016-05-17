import android.app.Activity;
import com.tencent.mobileqq.activity.UpgradeTipsDialog;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.upgrade.UpgradeController;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nmk
  implements Runnable
{
  public nmk(UpgradeController paramUpgradeController, Activity paramActivity, QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    new UpgradeTipsDialog(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, UpgradeController.a(jdField_a_of_type_ComTencentMobileqqAppUpgradeUpgradeController), null);
  }
}
