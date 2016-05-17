package com.tencent.mobileqq.app.automator.step;

import ConfigPush.FileStoragePushFSSvcList;
import com.tencent.kingkong.Common;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.preop.PTTPreDownloader;
import com.tencent.mobileqq.servlet.PushServlet;
import com.tencent.mobileqq.transfile.FMTSrvAddrProvider;
import mqq.app.MobileQQ;
import nhv;

public class GetGeneralSettings
  extends AsyncStep
{
  private FriendListObserver a;
  
  public GetGeneralSettings()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    ??? = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
    if (??? != null)
    {
      Common.SetContext(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a());
      Common.SetQQUni((String)???);
    }
    if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.d == 1) {}
    for (boolean bool = true; bool; bool = false)
    {
      if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver == null)
      {
        jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new nhv(this, null);
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver, true);
      }
      if (!jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(bool)) {
        break;
      }
      return 2;
    }
    for (;;)
    {
      synchronized (aa)
      {
        FileStoragePushFSSvcList localFileStoragePushFSSvcList = FMTSrvAddrProvider.a().a();
        if (localFileStoragePushFSSvcList != null)
        {
          PushServlet.a(localFileStoragePushFSSvcList, jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b);
          FMTSrvAddrProvider.a().b(null);
        }
        PTTPreDownloader.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b).a(true, true);
        if ("0".endsWith(DeviceProfileManager.b().a(DeviceProfileManager.DpcNames.KKFixerConfig.name(), "0")))
        {
          Common.SetDPCStatus(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getApplication().getApplicationContext(), false);
          return 7;
        }
      }
      Common.SetDPCStatus(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getApplication().getApplicationContext(), true);
      Common.SetContext(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getApplication().getApplicationContext());
      Common.SetSafeStatus(true);
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = null;
    }
  }
}
