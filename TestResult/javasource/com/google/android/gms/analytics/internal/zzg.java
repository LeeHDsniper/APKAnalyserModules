package com.google.android.gms.analytics.internal;

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlo;
import com.google.android.gms.internal.zzof;

public class zzg
{
  private final Context zzLR;
  private final Context zzqO;
  
  public zzg(Context paramContext)
  {
    zzx.zzv(paramContext);
    paramContext = paramContext.getApplicationContext();
    zzx.zzb(paramContext, "Application context can't be null");
    zzqO = paramContext;
    zzLR = paramContext;
  }
  
  public Context getApplicationContext()
  {
    return zzqO;
  }
  
  protected zzof zzY(Context paramContext)
  {
    return zzof.zzaI(paramContext);
  }
  
  protected zzu zza(zzf paramZzf)
  {
    return new zzu(paramZzf);
  }
  
  protected zzk zzb(zzf paramZzf)
  {
    return new zzk(paramZzf);
  }
  
  protected zza zzc(zzf paramZzf)
  {
    return new zza(paramZzf);
  }
  
  protected zzn zzd(zzf paramZzf)
  {
    return new zzn(paramZzf);
  }
  
  protected zzan zze(zzf paramZzf)
  {
    return new zzan(paramZzf);
  }
  
  protected zzaf zzf(zzf paramZzf)
  {
    return new zzaf(paramZzf);
  }
  
  protected zzr zzg(zzf paramZzf)
  {
    return new zzr(paramZzf);
  }
  
  protected zzlm zzh(zzf paramZzf)
  {
    return zzlo.zzpN();
  }
  
  protected GoogleAnalytics zzi(zzf paramZzf)
  {
    return new GoogleAnalytics(paramZzf);
  }
  
  public Context zziq()
  {
    return zzLR;
  }
  
  zzl zzj(zzf paramZzf)
  {
    return new zzl(paramZzf, this);
  }
  
  zzag zzk(zzf paramZzf)
  {
    return new zzag(paramZzf);
  }
  
  protected zzb zzl(zzf paramZzf)
  {
    return new zzb(paramZzf, this);
  }
  
  public zzj zzm(zzf paramZzf)
  {
    return new zzj(paramZzf);
  }
  
  public zzah zzn(zzf paramZzf)
  {
    return new zzah(paramZzf);
  }
  
  public zzi zzo(zzf paramZzf)
  {
    return new zzi(paramZzf);
  }
  
  public zzv zzp(zzf paramZzf)
  {
    return new zzv(paramZzf);
  }
  
  public zzai zzq(zzf paramZzf)
  {
    return new zzai(paramZzf);
  }
}
