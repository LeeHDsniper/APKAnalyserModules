package com.google.android.gms.internal;

import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;

@zzgk
public final class zzci
  extends zzch.zza
{
  private final OnCustomRenderedAdLoadedListener zztr;
  
  public zzci(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    zztr = paramOnCustomRenderedAdLoadedListener;
  }
  
  public void zza(zzcg paramZzcg)
  {
    zztr.onCustomRenderedAdLoaded(new zzcf(paramZzcg));
  }
}
