import com.tencent.mobileqq.config.ConfigManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.TimerTask;

public class ntv
  extends TimerTask
{
  int jdField_a_of_type_Int;
  
  public ntv(ConfigManager paramConfigManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  public void run()
  {
    synchronized (ConfigManager.a(jdField_a_of_type_ComTencentMobileqqConfigConfigManager))
    {
      jdField_a_of_type_Int += 1;
      if (jdField_a_of_type_Int > 30)
      {
        jdField_a_of_type_ComTencentMobileqqConfigConfigManager.d();
        cancel();
      }
      return;
    }
  }
}
