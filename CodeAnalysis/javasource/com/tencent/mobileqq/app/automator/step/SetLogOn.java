package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.log.ReportLog;
import mqq.manager.ServerConfigManager.ConfigType;

public class SetLogOn
  extends AsyncStep
{
  public SetLogOn()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    String str = a.b.a(ServerConfigManager.ConfigType.common, "QQIniUrl");
    if ((str != null) && (str.length() > 0)) {
      ReportLog.g = str.trim();
    }
    ReportLog.a(a.b.a(), true);
    return 7;
  }
}
