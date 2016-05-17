package com.tencent.beacon.a;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningTaskInfo;
import android.content.ComponentName;
import android.content.Context;
import java.util.Iterator;
import java.util.List;

public final class a
  implements Runnable
{
  private final Context a;
  private final ActivityManager b;
  private final String c;
  
  public a(Context paramContext)
  {
    a = paramContext;
    b = ((ActivityManager)a.getSystemService("activity"));
    c = b.e(a);
  }
  
  public final void run()
  {
    com.tencent.beacon.d.a.a("Activity Monitor Task was started.", new Object[0]);
    int i = 0;
    for (;;)
    {
      int j = i + 1;
      if (i >= 10) {
        break;
      }
      Iterator localIterator = b.getRunningTasks(Integer.MAX_VALUE).iterator();
      while (localIterator.hasNext())
      {
        ActivityManager.RunningTaskInfo localRunningTaskInfo = (ActivityManager.RunningTaskInfo)localIterator.next();
        if (topActivity.getPackageName().equals(c))
        {
          b.a = true;
          com.tencent.beacon.d.a.a("Found activity %s.", new Object[] { topActivity.getClassName() });
          com.tencent.beacon.d.a.a("Activity Monitor Task was exited.", new Object[0]);
          return;
        }
      }
      try
      {
        Thread.sleep(1000L);
        i = j;
      }
      catch (InterruptedException localInterruptedException)
      {
        com.tencent.beacon.d.a.a(localInterruptedException);
        i = j;
      }
    }
    com.tencent.beacon.d.a.a("Activity Monitor Task was exited.", new Object[0]);
  }
}
