package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqwifi.QQWiFiHelper;
import cooperation.qqwifi.VacContentServlet;
import mqq.app.MobileQQ;
import mqq.app.NewIntent;

public class ReportQQWifiInfo
  extends AsyncStep
{
  public ReportQQWifiInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (QLog.isColorLevel()) {
      QLog.i("ReportQQWifiInfo", 2, "dostep");
    }
    if ((QQWiFiHelper.a(a.b.getApplication())) || (QQWiFiHelper.b(a.b.getApplication())))
    {
      if (QLog.isColorLevel()) {
        QLog.i("ReportQQWifiInfo", 2, "start report");
      }
      QQWiFiHelper.a(a.b, true);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.i("ReportQQWifiInfo", 2, "return ok");
      }
      if (QQWiFiHelper.b(a.b.getApplication().getApplicationContext(), a.b.a()))
      {
        localObject = new NewIntent(a.b.getApplication(), VacContentServlet.class);
        ((NewIntent)localObject).putExtra("content_id", 2);
        a.b.startServlet((NewIntent)localObject);
      }
      Object localObject = BaseApplication.getContext().getSharedPreferences(a.b.a(), 0);
      int i = ((SharedPreferences)localObject).getInt("showQQWiFiNotifyCount", 0);
      if (i > 0)
      {
        ReportController.b(a.b, "CliOper", "", "", "QQWIFI", "showQQWiFiNotifyCount", 0, 0, "" + i, "", "", "");
        ((SharedPreferences)localObject).edit().putInt("showQQWiFiNotifyCount", 0).commit();
      }
      i = ((SharedPreferences)localObject).getInt("QQWiFiShowRedTouch", 0);
      if (i != 0)
      {
        ReportController.b(a.b, "CliOper", "", "", "QQWIFI", "QQWiFiShowRedTouch", 0, 0, "" + i, "", "", "");
        ((SharedPreferences)localObject).edit().putInt("QQWiFiShowRedTouch", 0).commit();
      }
      i = ((SharedPreferences)localObject).getInt("showQQWiFiAvailExtend", 0);
      if (i > 0)
      {
        ReportController.b(a.b, "CliOper", "", "", "QQWIFI", "showQQWiFiAvailExtend", 0, 0, "" + i, "", "", "");
        ((SharedPreferences)localObject).edit().putInt("showQQWiFiAvailExtend", 0).commit();
      }
      return 7;
      if (QLog.isColorLevel()) {
        QLog.i("ReportQQWifiInfo", 2, "do not need report");
      }
    }
  }
}
