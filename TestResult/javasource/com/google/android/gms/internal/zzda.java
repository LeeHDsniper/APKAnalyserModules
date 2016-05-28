package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeCustomTemplateAd.OnCustomClickListener;

@zzgk
public class zzda
  extends zzcv.zza
{
  private final NativeCustomTemplateAd.OnCustomClickListener zzwF;
  
  public zzda(NativeCustomTemplateAd.OnCustomClickListener paramOnCustomClickListener)
  {
    zzwF = paramOnCustomClickListener;
  }
  
  public void zza(zzcr paramZzcr, String paramString)
  {
    zzwF.onCustomClick(new zzcs(paramZzcr), paramString);
  }
}
