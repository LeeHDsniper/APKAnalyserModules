import com.tencent.mobileqq.config.AboutConfig;
import com.tencent.mobileqq.data.ResourcePluginInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class ntu
  implements Runnable
{
  public ntu(AboutConfig paramAboutConfig, ResourcePluginInfo paramResourcePluginInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqConfigAboutConfig.a(jdField_a_of_type_ComTencentMobileqqDataResourcePluginInfo);
    jdField_a_of_type_ComTencentMobileqqConfigAboutConfig.b();
  }
}
