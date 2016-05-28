package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.internal.reward.client.zzb.zza;
import com.google.android.gms.ads.internal.reward.client.zzd;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;

public class zzgw
  extends zzb.zza
{
  private final Context mContext;
  private final zzgx zzGf;
  private final VersionInfoParcel zzpa;
  private final Object zzpc;
  
  public zzgw(Context paramContext, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel)
  {
    mContext = paramContext;
    zzpa = paramVersionInfoParcel;
    zzGf = new zzgx(paramContext, AdSizeParcel.zzcB(), paramZzeh, paramVersionInfoParcel);
    zzpc = new Object();
  }
  
  public void destroy()
  {
    synchronized (zzpc)
    {
      zzGf.destroy();
      return;
    }
  }
  
  public boolean isLoaded()
  {
    synchronized (zzpc)
    {
      boolean bool = zzGf.isLoaded();
      return bool;
    }
  }
  
  public void pause()
  {
    synchronized (zzpc)
    {
      zzGf.pause();
      return;
    }
  }
  
  public void resume()
  {
    synchronized (zzpc)
    {
      zzGf.resume();
      return;
    }
  }
  
  public void setUserId(String paramString)
  {
    synchronized (zzpc)
    {
      zzGf.setUserId(paramString);
      return;
    }
  }
  
  public void show()
  {
    synchronized (zzpc)
    {
      zzGf.zzfO();
      return;
    }
  }
  
  public void zza(RewardedVideoAdRequestParcel paramRewardedVideoAdRequestParcel)
  {
    synchronized (zzpc)
    {
      zzGf.zza(paramRewardedVideoAdRequestParcel);
      return;
    }
  }
  
  public void zza(zzd paramZzd)
  {
    synchronized (zzpc)
    {
      zzGf.zza(paramZzd);
      return;
    }
  }
}
