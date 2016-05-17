package com.tencent.feedback.anr;

import android.content.Context;
import com.tencent.feedback.eup.CrashReport;
import com.tencent.feedback.eup.CrashStrategyBean;

public class ANRReport
{
  public ANRReport() {}
  
  public static void startANRMonitor(Context paramContext)
  {
    c.a(paramContext).startWatching();
  }
  
  public static void stopANRMonitor()
  {
    if (c.a(null) != null) {
      c.a(null).stopWatching();
    }
  }
  
  public static boolean uploadANRInfo(Context paramContext, int paramInt, String paramString1, String paramString2, String paramString3, long paramLong)
  {
    com.tencent.feedback.common.c localC = com.tencent.feedback.common.c.a(paramContext);
    if (localC == null)
    {
      com.tencent.feedback.common.e.d("commonInfo is null not init ?", new Object[0]);
      return false;
    }
    CrashStrategyBean localCrashStrategyBean = CrashReport.getCrashRuntimeStrategy();
    if (localCrashStrategyBean == null)
    {
      com.tencent.feedback.common.e.d("crash strategy null,not init?", new Object[0]);
      return false;
    }
    paramString1 = com.tencent.feedback.eup.b.a(paramContext, localC.g(), localC.h(), localC.j(), localC.y(), paramString1, "main", "", "ANR_RQD_EXCEPTION", "", paramString2, paramLong, paramString3, null);
    paramString1.a((byte)3);
    boolean bool = com.tencent.feedback.eup.c.a(paramContext).a(paramString1, localCrashStrategyBean);
    com.tencent.feedback.common.e.b("sha1:%s %d", new Object[] { paramString1.o(), Integer.valueOf(paramString1.m()) });
    com.tencent.feedback.common.e.b("handle anr %b", new Object[] { Boolean.valueOf(bool) });
    return bool;
  }
  
  public static void uploadANRInfoAsync(Context paramContext, final int paramInt, final String paramString1, final String paramString2, final String paramString3, final long paramLong)
  {
    if ((paramInt <= 0) || (paramString1 == null) || (paramLong <= 0L))
    {
      com.tencent.feedback.common.e.d("anr args unright pid, procName ,anrTime should not be null", new Object[0]);
      return;
    }
    com.tencent.feedback.common.b.b().a(new Runnable()
    {
      public final void run()
      {
        ANRReport.uploadANRInfo(a, paramInt, paramString1, paramString2, paramString3, paramLong);
      }
    });
  }
}
