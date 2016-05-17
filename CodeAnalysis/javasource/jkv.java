import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.widget.CheckBox;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class jkv
  implements DialogInterface.OnClickListener
{
  public jkv(NotificationActivity paramNotificationActivity, CheckBox paramCheckBox, boolean paramBoolean, SharedPreferences paramSharedPreferences)
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
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.finish();
      return;
    }
    catch (Exception paramDialogInterface)
    {
      for (;;) {}
    }
  }
}
