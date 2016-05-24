package com.google.android.gms.analytics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzr;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzqd;

public final class AnalyticsReceiver
  extends BroadcastReceiver
{
  static zzqd zzKc;
  static Boolean zzKd;
  static Object zzpm = new Object();
  
  public AnalyticsReceiver() {}
  
  public static boolean zzV(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzKd != null) {
      return zzKd.booleanValue();
    }
    boolean bool = zzam.zza(paramContext, AnalyticsReceiver.class, false);
    zzKd = Boolean.valueOf(bool);
    return bool;
  }
  
  public void onReceive(Context paramContext, Intent arg2)
  {
    Object localObject = zzf.zzX(paramContext);
    localZzaf = ((zzf)localObject).zzie();
    ??? = ???.getAction();
    if (((zzf)localObject).zzif().zzjk()) {
      localZzaf.zza("Device AnalyticsReceiver got", ???);
    }
    for (;;)
    {
      boolean bool;
      if ("com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(???))
      {
        bool = AnalyticsService.zzW(paramContext);
        localObject = new Intent(paramContext, AnalyticsService.class);
        ((Intent)localObject).setAction("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
      }
      synchronized (zzpm)
      {
        paramContext.startService((Intent)localObject);
        if (!bool)
        {
          return;
          localZzaf.zza("Local AnalyticsReceiver got", ???);
          continue;
        }
        try
        {
          if (zzKc == null)
          {
            zzKc = new zzqd(paramContext, 1, "Analytics WakeLock");
            zzKc.setReferenceCounted(false);
          }
          zzKc.acquire(1000L);
        }
        catch (SecurityException paramContext)
        {
          for (;;)
          {
            localZzaf.zzbb("Analytics service at risk of not starting. For more reliable analytics, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions.");
          }
        }
        return;
      }
    }
  }
}
