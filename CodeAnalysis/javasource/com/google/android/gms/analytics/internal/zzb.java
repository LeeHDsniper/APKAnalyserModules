package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.content.Intent;
import com.google.android.gms.analytics.AnalyticsReceiver;
import com.google.android.gms.analytics.AnalyticsService;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzof;

public class zzb
  extends zzd
{
  private final zzl zzLq;
  
  public zzb(zzf paramZzf, zzg paramZzg)
  {
    super(paramZzf);
    zzx.zzv(paramZzg);
    zzLq = paramZzg.zzj(paramZzf);
  }
  
  void onServiceConnected()
  {
    zzic();
    zzLq.onServiceConnected();
  }
  
  public void start()
  {
    zzLq.start();
  }
  
  public void zzI(final boolean paramBoolean)
  {
    zza("Network connectivity status changed", Boolean.valueOf(paramBoolean));
    zzig().zzf(new Runnable()
    {
      public void run()
      {
        zzb.zza(zzb.this).zzI(paramBoolean);
      }
    });
  }
  
  public long zza(zzh paramZzh)
  {
    zzio();
    zzx.zzv(paramZzh);
    zzic();
    long l = zzLq.zza(paramZzh, true);
    if (l == 0L) {
      zzLq.zzc(paramZzh);
    }
    return l;
  }
  
  public void zza(final zzab paramZzab)
  {
    zzx.zzv(paramZzab);
    zzio();
    zzb("Hit delivery requested", paramZzab);
    zzig().zzf(new Runnable()
    {
      public void run()
      {
        zzb.zza(zzb.this).zza(paramZzab);
      }
    });
  }
  
  public void zza(final zzw paramZzw)
  {
    zzio();
    zzig().zzf(new Runnable()
    {
      public void run()
      {
        zzb.zza(zzb.this).zzb(paramZzw);
      }
    });
  }
  
  public void zza(final String paramString, final Runnable paramRunnable)
  {
    zzx.zzh(paramString, "campaign param can't be empty");
    zzig().zzf(new Runnable()
    {
      public void run()
      {
        zzb.zza(zzb.this).zzbg(paramString);
        if (paramRunnable != null) {
          paramRunnable.run();
        }
      }
    });
  }
  
  protected void zzhB()
  {
    zzLq.zza();
  }
  
  public void zzhV()
  {
    zzio();
    Context localContext = getContext();
    if ((AnalyticsReceiver.zzV(localContext)) && (AnalyticsService.zzW(localContext)))
    {
      Intent localIntent = new Intent(localContext, AnalyticsService.class);
      localIntent.setAction("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
      localContext.startService(localIntent);
      return;
    }
    zza(null);
  }
  
  public void zzhX()
  {
    zzio();
    zzof.zzic();
    zzLq.zzhX();
  }
  
  public void zzhY()
  {
    zzaY("Radio powered up");
    zzhV();
  }
  
  void zzhZ()
  {
    zzic();
    zzLq.zzhZ();
  }
}
