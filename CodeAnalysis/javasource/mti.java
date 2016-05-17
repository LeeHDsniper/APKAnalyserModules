import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build.VERSION;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ScreenShot;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.util.ReflectionUtil;
import com.tencent.mobileqq.utils.kapalaiadapter.KapalaiAdapterUtil;
import com.tencent.mobileqq.utils.kapalaiadapter.MobileIssueSettings;
import com.tencent.qphone.base.util.QLog;

class mti
  implements Runnable
{
  mti(mth paramMth, BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool = true;
    Object localObject;
    if (!jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume())
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getSharedPreferences("screen_shot", 4).getString("currentactivity", null);
      bool = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getClass().getName().equals(localObject);
    }
    if ((!bool) || (!SettingCloneUtil.readValue(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, null, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367557), "qqsetting_screenshot_key", false)) || (!ReflectionUtil.a(BaseApplicationImpl.a)) || (!jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isSupportScreenShot())) {}
    label218:
    label246:
    for (;;)
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.screenShot == null)
      {
        if (!jdField_a_of_type_ComTencentMobileqqAppBaseActivity.isResume())
        {
          localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getApplicationContext();
          jdField_a_of_type_ComTencentMobileqqAppBaseActivity.screenShot = new ScreenShot((Context)localObject, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getWindow());
        }
      }
      else
      {
        bool = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.screenShot.a();
        if (bool) {
          continue;
        }
        if (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.screenShot.b()) {
          break label218;
        }
        BaseActivity.access$000(jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
      }
      for (;;)
      {
        if (!QLog.isColorLevel()) {
          break label246;
        }
        QLog.d("BaseActivity", 2, "snapshot activate " + bool);
        return;
        localObject = jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
        break;
        if ((!MobileIssueSettings.g) && (Build.VERSION.SDK_INT < 11)) {
          KapalaiAdapterUtil.a().a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getWindow());
        }
      }
    }
  }
}
