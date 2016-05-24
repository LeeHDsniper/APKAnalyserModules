package com.google.android.gms.analytics.internal;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import com.google.android.gms.analytics.AnalyticsReceiver;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;

public class zzv
  extends zzd
{
  private boolean zzMV;
  private boolean zzMW;
  private AlarmManager zzMX = (AlarmManager)getContext().getSystemService("alarm");
  
  protected zzv(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  private PendingIntent zzjW()
  {
    Intent localIntent = new Intent(getContext(), AnalyticsReceiver.class);
    localIntent.setAction("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
    return PendingIntent.getBroadcast(getContext(), 0, localIntent, 0);
  }
  
  public void cancel()
  {
    zzio();
    zzMW = false;
    zzMX.cancel(zzjW());
  }
  
  public boolean zzbr()
  {
    return zzMW;
  }
  
  protected void zzhB()
  {
    try
    {
      zzMX.cancel(zzjW());
      if (zzif().zzjt() > 0L)
      {
        ActivityInfo localActivityInfo = getContext().getPackageManager().getReceiverInfo(new ComponentName(getContext(), AnalyticsReceiver.class), 2);
        if ((localActivityInfo != null) && (enabled))
        {
          zzaY("Receiver registered. Using alarm for local dispatch.");
          zzMV = true;
        }
      }
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException) {}
  }
  
  public boolean zzjU()
  {
    return zzMV;
  }
  
  public void zzjV()
  {
    zzio();
    zzx.zza(zzjU(), "Receiver not registered");
    long l1 = zzif().zzjt();
    if (l1 > 0L)
    {
      cancel();
      long l2 = zzid().elapsedRealtime();
      zzMW = true;
      zzMX.setInexactRepeating(2, l2 + l1, 0L, zzjW());
    }
  }
}
