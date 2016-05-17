import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import cooperation.readinjoy.ReadInJoyHelper;

public class nmb
  implements Runnable
{
  public nmb(ReadInJoyManager paramReadInJoyManager, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager) == null) {
      return;
    }
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putString("config_notify_guide_wording", jdField_a_of_type_JavaLangString);
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putInt("config_notify_guide_flag", 1);
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putLong("config_notify_guide_updated_time", NetConnInfoCenter.getServerTime());
    ReadInJoyHelper.a(ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager), true);
    ReadInJoyManager.b(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager);
  }
}
