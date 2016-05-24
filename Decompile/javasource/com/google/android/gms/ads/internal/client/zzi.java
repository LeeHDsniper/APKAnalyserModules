package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class zzi
  extends zzt.zza
{
  private final AppEventListener zzsK;
  
  public zzi(AppEventListener paramAppEventListener)
  {
    zzsK = paramAppEventListener;
  }
  
  public void onAppEvent(String paramString1, String paramString2)
  {
    zzsK.onAppEvent(paramString1, paramString2);
  }
}
