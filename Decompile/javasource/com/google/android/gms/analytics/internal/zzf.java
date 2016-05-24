package com.google.android.gms.analytics.internal;

import android.app.Application;
import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlo;
import com.google.android.gms.internal.zzof;

public class zzf
{
  private static zzf zzLC;
  private final Context mContext;
  private final Context zzLD;
  private final zzr zzLE;
  private final zzaf zzLF;
  private final zzof zzLG;
  private final zzb zzLH;
  private final zzv zzLI;
  private final zzan zzLJ;
  private final zzai zzLK;
  private final GoogleAnalytics zzLL;
  private final zzn zzLM;
  private final zza zzLN;
  private final zzk zzLO;
  private final zzu zzLP;
  private final zzlm zzpO;
  
  protected zzf(zzg paramZzg)
  {
    Object localObject1 = paramZzg.getApplicationContext();
    zzx.zzb(localObject1, "Application context can't be null");
    zzx.zzb(localObject1 instanceof Application, "getApplicationContext didn't return the application");
    Object localObject2 = paramZzg.zziq();
    zzx.zzv(localObject2);
    mContext = ((Context)localObject1);
    zzLD = ((Context)localObject2);
    zzpO = paramZzg.zzh(this);
    zzLE = paramZzg.zzg(this);
    localObject2 = paramZzg.zzf(this);
    ((zzaf)localObject2).zza();
    zzLF = ((zzaf)localObject2);
    if (zzif().zzjk()) {
      zzie().zzba("Google Analytics " + zze.VERSION + " is starting up.");
    }
    for (;;)
    {
      localObject2 = paramZzg.zzq(this);
      ((zzai)localObject2).zza();
      zzLK = ((zzai)localObject2);
      localObject2 = paramZzg.zze(this);
      ((zzan)localObject2).zza();
      zzLJ = ((zzan)localObject2);
      localObject2 = paramZzg.zzl(this);
      zzn localZzn = paramZzg.zzd(this);
      zza localZza = paramZzg.zzc(this);
      zzk localZzk = paramZzg.zzb(this);
      zzu localZzu = paramZzg.zza(this);
      localObject1 = paramZzg.zzY((Context)localObject1);
      ((zzof)localObject1).zza(zzip());
      zzLG = ((zzof)localObject1);
      localObject1 = paramZzg.zzi(this);
      localZzn.zza();
      zzLM = localZzn;
      localZza.zza();
      zzLN = localZza;
      localZzk.zza();
      zzLO = localZzk;
      localZzu.zza();
      zzLP = localZzu;
      paramZzg = paramZzg.zzp(this);
      paramZzg.zza();
      zzLI = paramZzg;
      ((zzb)localObject2).zza();
      zzLH = ((zzb)localObject2);
      if (zzif().zzjk()) {
        zzie().zzb("Device AnalyticsService version", zze.VERSION);
      }
      ((GoogleAnalytics)localObject1).zza();
      zzLL = ((GoogleAnalytics)localObject1);
      ((zzb)localObject2).start();
      return;
      zzie().zzba("Google Analytics " + zze.VERSION + " is starting up. " + "To enable debug logging on a device run:\n" + "  adb shell setprop log.tag.GAv4 DEBUG\n" + "  adb logcat -s GAv4");
    }
  }
  
  public static zzf zzX(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzLC == null) {}
    try
    {
      if (zzLC == null)
      {
        zzlm localZzlm = zzlo.zzpN();
        long l1 = localZzlm.elapsedRealtime();
        paramContext = new zzf(new zzg(paramContext.getApplicationContext()));
        zzLC = paramContext;
        GoogleAnalytics.zzhx();
        l1 = localZzlm.elapsedRealtime() - l1;
        long l2 = ((Long)zzy.zzNO.get()).longValue();
        if (l1 > l2) {
          paramContext.zzie().zzc("Slow initialization (ms)", Long.valueOf(l1), Long.valueOf(l2));
        }
      }
      return zzLC;
    }
    finally {}
  }
  
  private void zza(zzd paramZzd)
  {
    zzx.zzb(paramZzd, "Analytics service not created/initialized");
    zzx.zzb(paramZzd.isInitialized(), "Analytics service not initialized");
  }
  
  public Context getContext()
  {
    return mContext;
  }
  
  public zzan zzhA()
  {
    zza(zzLJ);
    return zzLJ;
  }
  
  public zzb zzhz()
  {
    zza(zzLH);
    return zzLH;
  }
  
  public void zzic() {}
  
  public zzlm zzid()
  {
    return zzpO;
  }
  
  public zzaf zzie()
  {
    zza(zzLF);
    return zzLF;
  }
  
  public zzr zzif()
  {
    return zzLE;
  }
  
  public zzof zzig()
  {
    zzx.zzv(zzLG);
    return zzLG;
  }
  
  public zzv zzih()
  {
    zza(zzLI);
    return zzLI;
  }
  
  public zzai zzii()
  {
    zza(zzLK);
    return zzLK;
  }
  
  public zzk zzil()
  {
    zza(zzLO);
    return zzLO;
  }
  
  public zzu zzim()
  {
    return zzLP;
  }
  
  protected Thread.UncaughtExceptionHandler zzip()
  {
    new Thread.UncaughtExceptionHandler()
    {
      public void uncaughtException(Thread paramAnonymousThread, Throwable paramAnonymousThrowable)
      {
        paramAnonymousThread = zzir();
        if (paramAnonymousThread != null) {
          paramAnonymousThread.zze("Job execution failed", paramAnonymousThrowable);
        }
      }
    };
  }
  
  public Context zziq()
  {
    return zzLD;
  }
  
  public zzaf zzir()
  {
    return zzLF;
  }
  
  public GoogleAnalytics zzis()
  {
    zzx.zzv(zzLL);
    zzx.zzb(zzLL.isInitialized(), "Analytics instance not initialized");
    return zzLL;
  }
  
  public zzai zzit()
  {
    if ((zzLK == null) || (!zzLK.isInitialized())) {
      return null;
    }
    return zzLK;
  }
  
  public zza zziu()
  {
    zza(zzLN);
    return zzLN;
  }
  
  public zzn zziv()
  {
    zza(zzLM);
    return zzLM;
  }
}
