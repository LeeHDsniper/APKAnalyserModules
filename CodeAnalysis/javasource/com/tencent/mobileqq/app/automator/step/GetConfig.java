package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.LebaHelper;
import com.tencent.mobileqq.app.PluginConfigProxy;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.config.AboutConfig;
import com.tencent.mobileqq.config.ResourcePluginListener;
import com.tencent.mobileqq.earlydownload.EarlyDownloadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.plugin.IPluginManager;
import nht;
import protocol.KQQConfig.GetResourceReqInfo;

public class GetConfig
  extends AsyncStep
{
  private ResourcePluginListener a;
  
  public GetConfig()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    Object localObject = new PluginConfigProxy();
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().a((PluginConfigProxy)localObject);
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().a((PluginConfigProxy)localObject);
    ((PluginConfigProxy)localObject).a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b);
    ((IPluginManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(26)).a();
    ((EarlyDownloadManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(76)).b();
    localObject = (ConfigHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(4);
    ((ConfigHandler)localObject).a(null, new GetResourceReqInfo[] { ((ConfigHandler)localObject).e(), ((ConfigHandler)localObject).g(), ((ConfigHandler)localObject).b(), ((ConfigHandler)localObject).f(), ((ConfigHandler)localObject).c() });
    return 2;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqConfigResourcePluginListener == null)
    {
      jdField_a_of_type_ComTencentMobileqqConfigResourcePluginListener = new nht(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqConfigResourcePluginListener);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqConfigResourcePluginListener);
    }
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqConfigResourcePluginListener = null;
  }
}
