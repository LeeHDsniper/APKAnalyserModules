package com.tencent.mobileqq.app.automator.step;

import android.util.Log;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mqq.shared_file_accessor.LogUtil;

public class AutomatorFinish
  extends AsyncStep
{
  public AutomatorFinish()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    long l = System.currentTimeMillis() - a.a;
    StatisticCollector.a(a.b.a()).a(null, "actQQInit", true, l, a.e, null, null);
    Log.i("AutoMonitor", "QQInitialize, cost=" + l + ", totalFailCount=" + a.e);
    LogUtil.timeLogEnd(a.b.a(), null, null, null, Long.toString(l), "all-ended", null, false, null);
    return 7;
  }
}
