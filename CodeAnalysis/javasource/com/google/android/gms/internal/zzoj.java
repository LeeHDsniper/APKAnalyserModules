package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.List;

public class zzoj
{
  private static final zza[] zzaIm = new zza[0];
  private static zzoj zzaIn;
  private final Application zzaIo;
  private zzoq zzaIp;
  private final List<zza> zzaIq;
  private zzot zzaIr;
  
  private zzoj(Application paramApplication)
  {
    zzx.zzv(paramApplication);
    zzaIo = paramApplication;
    zzaIq = new ArrayList();
  }
  
  public static zzoj zzaJ(Context paramContext)
  {
    zzx.zzv(paramContext);
    paramContext = (Application)paramContext.getApplicationContext();
    zzx.zzv(paramContext);
    try
    {
      if (zzaIn == null) {
        zzaIn = new zzoj(paramContext);
      }
      paramContext = zzaIn;
      return paramContext;
    }
    finally {}
  }
  
  private zza[] zzxz()
  {
    synchronized (zzaIq)
    {
      if (zzaIq.isEmpty())
      {
        arrayOfZza = zzaIm;
        return arrayOfZza;
      }
      zza[] arrayOfZza = (zza[])zzaIq.toArray(new zza[zzaIq.size()]);
      return arrayOfZza;
    }
  }
  
  public void zza(zza paramZza)
  {
    zzx.zzv(paramZza);
    synchronized (zzaIq)
    {
      zzaIq.remove(paramZza);
      zzaIq.add(paramZza);
      return;
    }
  }
  
  public void zzaj(boolean paramBoolean)
  {
    if (Build.VERSION.SDK_INT < 14) {
      Log.i("com.google.android.gms.measurement.ScreenViewService", "AutoScreeViewTracking is not supported on API 14 or earlier devices");
    }
    while (zzxy() == paramBoolean) {
      return;
    }
    if (paramBoolean)
    {
      zzaIr = new zzot(this);
      zzaIo.registerActivityLifecycleCallbacks(zzaIr);
      return;
    }
    zzaIo.unregisterActivityLifecycleCallbacks(zzaIr);
    zzaIr = null;
  }
  
  public void zzb(zzoq paramZzoq, Activity paramActivity)
  {
    int j = 0;
    zzx.zzv(paramZzoq);
    zza[] arrayOfZza = null;
    int i;
    if (paramZzoq.isMutable())
    {
      if ((paramActivity instanceof zzoi)) {
        ((zzoi)paramActivity).zzb(paramZzoq);
      }
      if (zzaIp != null)
      {
        paramZzoq.zzhT(zzaIp.zzbp());
        paramZzoq.zzdU(zzaIp.zzxT());
      }
      arrayOfZza = zzxz();
      i = 0;
      while (i < arrayOfZza.length)
      {
        arrayOfZza[i].zza(paramZzoq, paramActivity);
        i += 1;
      }
      paramZzoq.zzxX();
      if (!TextUtils.isEmpty(paramZzoq.zzxT())) {}
    }
    for (;;)
    {
      return;
      if ((zzaIp != null) && (zzaIp.zzbp() == paramZzoq.zzbp()))
      {
        zzaIp = paramZzoq;
        return;
      }
      zzxx();
      zzaIp = paramZzoq;
      paramActivity = arrayOfZza;
      i = j;
      if (arrayOfZza == null)
      {
        paramActivity = zzxz();
        i = j;
      }
      while (i < paramActivity.length)
      {
        paramActivity[i].zza(paramZzoq);
        i += 1;
      }
    }
  }
  
  public zzoq zzxw()
  {
    return zzaIp;
  }
  
  public void zzxx()
  {
    zzaIp = null;
  }
  
  public boolean zzxy()
  {
    return zzaIr != null;
  }
  
  public static abstract interface zza
  {
    public abstract void zza(zzoq paramZzoq);
    
    public abstract void zza(zzoq paramZzoq, Activity paramActivity);
  }
}
