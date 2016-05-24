package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeContentAd.OnContentAdLoadedListener;

@zzgk
public class zzcz
  extends zzcu.zza
{
  private final NativeContentAd.OnContentAdLoadedListener zzwE;
  
  public zzcz(NativeContentAd.OnContentAdLoadedListener paramOnContentAdLoadedListener)
  {
    zzwE = paramOnContentAdLoadedListener;
  }
  
  public void zza(zzcp paramZzcp)
  {
    zzwE.onContentAdLoaded(zzb(paramZzcp));
  }
  
  zzcq zzb(zzcp paramZzcp)
  {
    return new zzcq(paramZzcp);
  }
}
