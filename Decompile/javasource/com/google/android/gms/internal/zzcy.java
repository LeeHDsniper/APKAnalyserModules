package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeAppInstallAd.OnAppInstallAdLoadedListener;

@zzgk
public class zzcy
  extends zzct.zza
{
  private final NativeAppInstallAd.OnAppInstallAdLoadedListener zzwD;
  
  public zzcy(NativeAppInstallAd.OnAppInstallAdLoadedListener paramOnAppInstallAdLoadedListener)
  {
    zzwD = paramOnAppInstallAdLoadedListener;
  }
  
  public void zza(zzcn paramZzcn)
  {
    zzwD.onAppInstallAdLoaded(zzb(paramZzcn));
  }
  
  zzco zzb(zzcn paramZzcn)
  {
    return new zzco(paramZzcn);
  }
}
