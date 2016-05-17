import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.widget.CheckBox;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jkw
  implements DialogInterface.OnClickListener
{
  public jkw(NotificationActivity paramNotificationActivity, CheckBox paramCheckBox, boolean paramBoolean, SharedPreferences paramSharedPreferences)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    try
    {
      boolean bool = jdField_a_of_type_AndroidWidgetCheckBox.isChecked();
      if (jdField_a_of_type_Boolean != bool) {
        jdField_a_of_type_AndroidContentSharedPreferences.edit().putBoolean("MemoryAlertAutoClear", bool).commit();
      }
      MemoryManager.a().a(jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity, jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.app);
      return;
    }
    catch (Exception paramDialogInterface) {}finally
    {
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.finish();
    }
  }
}
