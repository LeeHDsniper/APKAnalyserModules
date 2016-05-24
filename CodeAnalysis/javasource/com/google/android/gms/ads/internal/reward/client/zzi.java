package com.google.android.gms.ads.internal.reward.client;

import android.content.Context;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.reward.RewardedVideoAd;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;

public class zzi
  implements RewardedVideoAd
{
  private final Context mContext;
  private String zzGh;
  private RewardedVideoAdListener zzGm;
  private final zzb zzGn;
  private final Object zzpc = new Object();
  
  public zzi(Context paramContext, zzb paramZzb)
  {
    zzGn = paramZzb;
    mContext = paramContext;
  }
  
  public void destroy()
  {
    synchronized (zzpc)
    {
      if (zzGn == null) {
        return;
      }
    }
    try
    {
      zzGn.destroy();
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward destroy to RewardedVideoAd", localRemoteException);
      }
    }
  }
  
  public RewardedVideoAdListener getRewardedVideoAdListener()
  {
    synchronized (zzpc)
    {
      RewardedVideoAdListener localRewardedVideoAdListener = zzGm;
      return localRewardedVideoAdListener;
    }
  }
  
  public String getUserId()
  {
    synchronized (zzpc)
    {
      String str = zzGh;
      return str;
    }
  }
  
  public boolean isLoaded()
  {
    boolean bool;
    synchronized (zzpc)
    {
      if (zzGn == null) {
        return false;
      }
    }
    return false;
  }
  
  public void loadAd(String paramString, AdRequest paramAdRequest)
  {
    synchronized (zzpc)
    {
      if (zzGn == null) {
        return;
      }
    }
    try
    {
      zzGn.zza(com.google.android.gms.ads.internal.client.zzg.zzcA().zza(mContext, paramAdRequest.zzaF(), paramString));
      return;
      paramString = finally;
      throw paramString;
    }
    catch (RemoteException paramString)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward loadAd to RewardedVideoAd", paramString);
      }
    }
  }
  
  public void pause()
  {
    synchronized (zzpc)
    {
      if (zzGn == null) {
        return;
      }
    }
    try
    {
      zzGn.pause();
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward pause to RewardedVideoAd", localRemoteException);
      }
    }
  }
  
  public void resume()
  {
    synchronized (zzpc)
    {
      if (zzGn == null) {
        return;
      }
    }
    try
    {
      zzGn.resume();
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward resume to RewardedVideoAd", localRemoteException);
      }
    }
  }
  
  public void setRewardedVideoAdListener(RewardedVideoAdListener paramRewardedVideoAdListener)
  {
    synchronized (zzpc)
    {
      zzGm = paramRewardedVideoAdListener;
      zzb localZzb = zzGn;
      if (localZzb != null) {}
      try
      {
        zzGn.zza(new zzg(paramRewardedVideoAdListener));
        return;
      }
      catch (RemoteException paramRewardedVideoAdListener)
      {
        for (;;)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward setRewardedVideoAdListener to RewardedVideoAd", paramRewardedVideoAdListener);
        }
      }
    }
  }
  
  public void setUserId(String paramString)
  {
    synchronized (zzpc)
    {
      if (!TextUtils.isEmpty(zzGh))
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("A user id has already been set, ignoring.");
        return;
      }
      zzGh = paramString;
      zzb localZzb = zzGn;
      if (localZzb == null) {}
    }
    try
    {
      zzGn.setUserId(paramString);
      return;
      paramString = finally;
      throw paramString;
    }
    catch (RemoteException paramString)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward setUserId to RewardedVideoAd", paramString);
      }
    }
  }
  
  public void show()
  {
    synchronized (zzpc)
    {
      if (zzGn == null) {
        return;
      }
    }
    try
    {
      zzGn.show();
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not forward show to RewardedVideoAd", localRemoteException);
      }
    }
  }
}
