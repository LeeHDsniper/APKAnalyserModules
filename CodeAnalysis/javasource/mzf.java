import android.os.Process;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.CoreService;
import com.tencent.mobileqq.app.GuardManager;
import com.tencent.mobileqq.app.MemoryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.app.AppRuntime;

public class mzf
  extends myg
{
  public mzf()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a()
  {
    super.a();
    if (jdField_a_of_type_Long >= mye.a().a(jdField_a_of_type_ComTencentMobileqqAppGuardManager.jdField_a_of_type_Array2dOfLong, jdField_a_of_type_ComTencentMobileqqAppGuardManager.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppGuardManager.b, MemoryManager.a(Process.myPid())) / 12000L) {
      jdField_a_of_type_ComTencentMobileqqAppGuardManager.a(7, null);
    }
    while (b != 1L) {
      return;
    }
    MemoryManager.a().a();
  }
  
  protected void a(String paramString)
  {
    GuardManager localGuardManager = jdField_a_of_type_ComTencentMobileqqAppGuardManager;
    if ("com.tencent.mobileqq".equals(paramString)) {}
    for (int i = 2;; i = 3)
    {
      localGuardManager.a(i, paramString);
      return;
    }
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
    CoreService.a();
    jdField_a_of_type_ComTencentMobileqqAppGuardManager.e();
    BaseApplicationImpl.a.a().onGuardEvent(3, 0L, 0L);
  }
}
