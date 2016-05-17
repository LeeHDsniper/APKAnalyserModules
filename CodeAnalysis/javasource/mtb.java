import android.content.SharedPreferences;
import android.os.Process;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.CoreService;
import com.tencent.mobileqq.app.DeviceAbilityCollector;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.startup.step.SetSplash;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import mqq.app.AppRuntime;

public class mtb
  extends myg
{
  private String b;
  
  public mtb()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = null;
  }
  
  protected void a()
  {
    jdField_a_of_type_Long += 1L;
    jdField_b_of_type_Long += 1L;
    c += 1L;
    if ((jdField_b_of_type_Long == 1L) && (SetSplash.b()) && (jdField_a_of_type_ComTencentMobileqqAppGuardManager.d == null))
    {
      if (QLog.isColorLevel()) {
        QLog.d("setsplash", 2, "needshowsplashtoday , kill myself");
      }
      ReportController.a(null, "CliOper", "", "", "0X800483B", "0X800483B", 0, 0, "", "", "", "");
      System.exit(-1);
    }
    int i = GuardManager.a();
    if (jdField_a_of_type_Long >= mye.a().a(jdField_a_of_type_ComTencentMobileqqAppGuardManager.jdField_a_of_type_Array2dOfLong, jdField_a_of_type_ComTencentMobileqqAppGuardManager.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppGuardManager.b, MemoryManager.a(Process.myPid())) / 12000L)
    {
      jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(5, jdField_b_of_type_JavaLangString);
      if ((jdField_b_of_type_Long != 50L) && (jdField_b_of_type_Long != 51L)) {
        break label439;
      }
      jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(false, new String[0]);
    }
    for (;;)
    {
      if ((jdField_b_of_type_Long == 5L) || (jdField_b_of_type_Long == 6L))
      {
        SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences("sp_dex_patch", 4);
        boolean bool1 = localSharedPreferences.getBoolean("enable", false);
        String str = localSharedPreferences.getString("name", "");
        boolean bool2 = localSharedPreferences.getBoolean("verify", false);
        if ((bool1) && (bool2) && ((TextUtils.isEmpty(BaseApplicationImpl.j)) || (!str.equals(BaseApplicationImpl.k)) || (!BaseApplicationImpl.e)))
        {
          QLog.d("BaseApplicationImpl", 1, "background timed kill myself to speed patch, to install name=" + str + ", installed name=" + BaseApplicationImpl.k + ", install result=" + BaseApplicationImpl.j + ", isRestartInstall=" + BaseApplicationImpl.e);
          jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(false, new String[0]);
        }
      }
      return;
      if (jdField_b_of_type_Long == 1L)
      {
        MemoryManager.a().a();
        DeviceAbilityCollector.a(BaseApplicationImpl.getContext());
        break;
      }
      if ((jdField_b_of_type_Long != 3L) && (jdField_b_of_type_Long != 4L)) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(false, new String[] { "com.tencent.mobileqq:qzone", jdField_b_of_type_JavaLangString });
      break;
      label439:
      if ((jdField_b_of_type_Long == i) || (jdField_b_of_type_Long == i + 1)) {
        jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(false, "com.tencent.mobileqq:qzone");
      }
    }
  }
  
  protected void a(String paramString)
  {
    jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(3, paramString);
  }
  
  protected void b()
  {
    if (jdField_a_of_type_Long > 2L) {
      jdField_a_of_type_Long -= 2L;
    }
  }
  
  protected void b(String paramString)
  {
    super.b(paramString);
    jdField_b_of_type_JavaLangString = paramString;
    if ("fake_p_msg".equals(paramString)) {
      jdField_a_of_type_Long = (mye.a().a(jdField_a_of_type_ComTencentMobileqqAppGuardManager.jdField_a_of_type_Array2dOfLong, jdField_a_of_type_ComTencentMobileqqAppGuardManager.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppGuardManager.b, MemoryManager.a(Process.myPid())) / 12000L - 2L);
    }
    CoreService.a();
    jdField_a_of_type_ComTencentMobileqqAppGuardManager.e();
    BaseApplicationImpl.a.a().onGuardEvent(1, 0L, 0L);
  }
}
