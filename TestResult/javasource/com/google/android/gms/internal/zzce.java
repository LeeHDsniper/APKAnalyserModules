package com.google.android.gms.internal;

import android.view.View;
import com.google.android.gms.ads.internal.zzg;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;

@zzgk
public final class zzce
  extends zzcg.zza
{
  private final zzg zzvv;
  private final String zzvw;
  private final String zzvx;
  
  public zzce(zzg paramZzg, String paramString1, String paramString2)
  {
    zzvv = paramZzg;
    zzvw = paramString1;
    zzvx = paramString2;
  }
  
  public String getContent()
  {
    return zzvx;
  }
  
  public void recordClick()
  {
    zzvv.recordClick();
  }
  
  public void recordImpression()
  {
    zzvv.recordImpression();
  }
  
  public void zza(zzd paramZzd)
  {
    if (paramZzd == null) {
      return;
    }
    zzvv.zzc((View)zze.zzp(paramZzd));
  }
  
  public String zzdp()
  {
    return zzvw;
  }
}
