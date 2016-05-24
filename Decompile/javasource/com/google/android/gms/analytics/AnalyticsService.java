package com.google.android.gms.analytics;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zzb;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzr;
import com.google.android.gms.analytics.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzqd;

public final class AnalyticsService
  extends Service
{
  private static Boolean zzKe;
  private final Handler mHandler = new Handler();
  
  public AnalyticsService() {}
  
  public static boolean zzW(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzKe != null) {
      return zzKe.booleanValue();
    }
    boolean bool = zzam.zza(paramContext, AnalyticsService.class);
    zzKe = Boolean.valueOf(bool);
    return bool;
  }
  
  private void zzhr()
  {
    try
    {
      synchronized (AnalyticsReceiver.zzpm)
      {
        zzqd localZzqd = AnalyticsReceiver.zzKc;
        if ((localZzqd != null) && (localZzqd.isHeld())) {
          localZzqd.release();
        }
        return;
      }
      return;
    }
    catch (SecurityException localSecurityException) {}
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }
  
  public void onCreate()
  {
    super.onCreate();
    zzf localZzf = zzf.zzX(this);
    zzaf localZzaf = localZzf.zzie();
    if (localZzf.zzif().zzjk())
    {
      localZzaf.zzaY("Device AnalyticsService is starting up");
      return;
    }
    localZzaf.zzaY("Local AnalyticsService is starting up");
  }
  
  public void onDestroy()
  {
    zzf localZzf = zzf.zzX(this);
    zzaf localZzaf = localZzf.zzie();
    if (localZzf.zzif().zzjk()) {
      localZzaf.zzaY("Device AnalyticsService is shutting down");
    }
    for (;;)
    {
      super.onDestroy();
      return;
      localZzaf.zzaY("Local AnalyticsService is shutting down");
    }
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, final int paramInt2)
  {
    zzhr();
    final zzf localZzf = zzf.zzX(this);
    final zzaf localZzaf = localZzf.zzie();
    paramIntent = paramIntent.getAction();
    if (localZzf.zzif().zzjk()) {
      localZzaf.zza("Device AnalyticsService called. startId, action", Integer.valueOf(paramInt2), paramIntent);
    }
    for (;;)
    {
      if ("com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(paramIntent)) {
        localZzf.zzhz().zza(new zzw()
        {
          public void zzc(Throwable paramAnonymousThrowable)
          {
            AnalyticsService.zza(AnalyticsService.this).post(new Runnable()
            {
              public void run()
              {
                if (stopSelfResult(zzKf))
                {
                  if (zzKg.zzif().zzjk()) {
                    zzKh.zzaY("Device AnalyticsService processed last dispatch request");
                  }
                }
                else {
                  return;
                }
                zzKh.zzaY("Local AnalyticsService processed last dispatch request");
              }
            });
          }
        });
      }
      return 2;
      localZzaf.zza("Local AnalyticsService called. startId, action", Integer.valueOf(paramInt2), paramIntent);
    }
  }
}
