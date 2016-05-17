package com.tencent.mobileqq.startup.step;

import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.commonsdk.soload.SoLoadUtilNew;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.pluginsdk.IPluginAdapterProxy;
import com.tencent.mobileqq.utils.SoLoadReportImpl;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import cooperation.plugin.PluginAdapterImpl;
import mqq.app.Foreground;
import mqq.os.MqqHandler;

public class OldApplication
  extends Step
{
  public OldApplication() {}
  
  protected boolean a()
  {
    mqq.app.MainService.isDebugVersion = false;
    if (BaseApplicationImpl.i == 1)
    {
      long l = SystemClock.uptimeMillis();
      BaseApplicationImpl.jdField_a_of_type_Long = l;
      BaseApplicationImpl.b = l;
      BaseApplicationImpl.c = BaseApplicationImpl.jdField_a_of_type_Long;
      BaseApplicationImpl.jdField_a_of_type_MqqOsMqqHandler = new MqqHandler();
      IPluginAdapterProxy.setProxy(new PluginAdapterImpl());
    }
    for (;;)
    {
      BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.a();
      SoLoadUtilNew.setReport(new SoLoadReportImpl());
      TimeFormatterUtils.a();
      BaseApplicationImpl.appnewmsgicon = 2130838558;
      BaseApplicationImpl.appnewavmsgicon = 2130838902;
      BaseApplicationImpl.qqlaunchicon = 2130838445;
      BaseApplicationImpl.qqWifiLayout = 2130904359;
      BaseApplicationImpl.qqWifiStateIconViewId = 2131302326;
      BaseApplicationImpl.qqWifiStateTextViewId = 2131302329;
      BaseApplicationImpl.qqWifiOperationTextViewId = 2131302330;
      BaseApplicationImpl.qqWifiSettingViewId = 2131297902;
      BaseApplicationImpl.qqWifiStateTextSingleLine = 2131302331;
      BaseApplicationImpl.qqWifiTextDoubleLine = 2131302328;
      BaseApplicationImpl.qqWifiRedTouchViewId = 2131302327;
      BaseApplicationImpl.qqWifiConnecticon3 = 2130841043;
      BaseApplicationImpl.qqWifiNoSignal = 2130841044;
      BaseApplicationImpl.qqWifiUserful = 2130841049;
      BaseApplicationImpl.qqWifiSettings = 2130841048;
      BaseApplicationImpl.qqWifiOperation = 2130841042;
      BaseApplicationImpl.qqwifinotifyusefulicon = 2130841047;
      BaseApplicationImpl.qqwifinotifynoneicon = 2130841046;
      BaseApplicationImpl.qqwifinotifyconnectedicon = 2130841045;
      BaseApplicationImpl.qqwifinotifydivide = 2131427527;
      BaseApplicationImpl.defaultNotifSoundResourceId = 2131165185;
      BaseApplicationImpl.devlockQuickloginIcon = 2130839766;
      Foreground.init(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, ThreadManager.b(), BaseApplicationImpl.processName);
      try
      {
        Class.forName("android.os.AsyncTask");
        if (BaseApplicationImpl.i == 1)
        {
          return true;
          if (BaseApplicationImpl.i == 4) {
            continue;
          }
          IPluginAdapterProxy.setProxy(new PluginAdapterImpl());
        }
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        for (;;)
        {
          localClassNotFoundException.printStackTrace();
        }
      }
    }
    return false;
  }
}
