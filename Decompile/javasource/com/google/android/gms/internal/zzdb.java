package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener;

@zzgk
public class zzdb
  extends zzcw.zza
{
  private final NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener zzwG;
  
  public zzdb(NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener paramOnCustomTemplateAdLoadedListener)
  {
    zzwG = paramOnCustomTemplateAdLoadedListener;
  }
  
  public void zza(zzcr paramZzcr)
  {
    zzwG.onCustomTemplateAdLoaded(new zzcs(paramZzcr));
  }
}
