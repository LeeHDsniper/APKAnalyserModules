package com.google.android.gms.ads.internal.request;

import java.lang.ref.WeakReference;

public final class zzg
  extends zzk.zza
{
  private final WeakReference<zzc.zza> zzDV;
  
  public zzg(zzc.zza paramZza)
  {
    zzDV = new WeakReference(paramZza);
  }
  
  public void zzb(AdResponseParcel paramAdResponseParcel)
  {
    zzc.zza localZza = (zzc.zza)zzDV.get();
    if (localZza != null) {
      localZza.zzb(paramAdResponseParcel);
    }
  }
}
