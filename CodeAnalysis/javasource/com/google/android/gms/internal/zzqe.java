package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.HitBuilders.ScreenViewBuilder;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.Container;

class zzqe
{
  private final Context mContext;
  private final zzqf zzpo;
  
  public zzqe(Context paramContext, Container paramContainer, zzqf paramZzqf)
  {
    mContext = paramContext;
    zzpo = zza(paramContainer, paramZzqf);
    zzBi();
  }
  
  private void zzBi()
  {
    if ((zzpo.zzBk()) && (!TextUtils.isEmpty(zzpo.getTrackingId())))
    {
      Tracker localTracker = zzfg(zzpo.getTrackingId());
      localTracker.enableAdvertisingIdCollection(zzpo.zzBl());
      zzb(new zza(localTracker));
    }
  }
  
  static zzqf zza(Container paramContainer, zzqf paramZzqf)
  {
    if ((paramContainer == null) || (paramContainer.isDefault())) {
      return paramZzqf;
    }
    paramZzqf = new zzqf.zza(paramZzqf.zzBj());
    paramZzqf.zzfh(paramContainer.getString("trackingId")).zzau(paramContainer.getBoolean("trackScreenViews")).zzav(paramContainer.getBoolean("collectAdIdentifiers"));
    return paramZzqf.zzBm();
  }
  
  public zzqf zzBh()
  {
    return zzpo;
  }
  
  void zzb(zzoj.zza paramZza)
  {
    zzx.zzv(paramZza);
    zzoj localZzoj = zzoj.zzaJ(mContext);
    localZzoj.zzaj(true);
    localZzoj.zza(paramZza);
  }
  
  Tracker zzfg(String paramString)
  {
    return GoogleAnalytics.getInstance(mContext).newTracker(paramString);
  }
  
  static class zza
    implements zzoj.zza
  {
    private final Tracker zzKq;
    
    zza(Tracker paramTracker)
    {
      zzKq = paramTracker;
    }
    
    public void zza(zzoq paramZzoq)
    {
      zzKq.setScreenName(paramZzoq.zzxT());
      HitBuilders.ScreenViewBuilder localScreenViewBuilder = new HitBuilders.ScreenViewBuilder();
      localScreenViewBuilder.set("&a", String.valueOf(paramZzoq.zzbp()));
      zzKq.send(localScreenViewBuilder.build());
    }
    
    public void zza(zzoq paramZzoq, Activity paramActivity) {}
  }
}
