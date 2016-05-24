package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.internal.reward.client.zzd;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.ads.internal.zzq;
import com.google.android.gms.common.internal.zzx;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

@zzgk
public class zzgx
  extends com.google.android.gms.ads.internal.zzb
  implements zzhb
{
  private zzd zzGg;
  private String zzGh;
  private boolean zzGi;
  private HashMap<String, zzgy> zzGj = new HashMap();
  
  public zzgx(Context paramContext, AdSizeParcel paramAdSizeParcel, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel)
  {
    super(paramContext, paramAdSizeParcel, null, paramZzeh, paramVersionInfoParcel, null);
  }
  
  public void destroy()
  {
    zzx.zzch("destroy must be called on the main UI thread.");
    Iterator localIterator = zzGj.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      try
      {
        zzgy localZzgy = (zzgy)zzGj.get(str);
        if ((localZzgy != null) && (localZzgy.zzfQ() != null)) {
          localZzgy.zzfQ().destroy();
        }
      }
      catch (RemoteException localRemoteException)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to destroy adapter: " + str);
      }
    }
  }
  
  public boolean isLoaded()
  {
    zzx.zzch("isLoaded must be called on the main UI thread.");
    return (zzos.zzqd == null) && (zzos.zzqe == null) && (zzos.zzqg != null) && (!zzGi);
  }
  
  public void onRewardedVideoAdClosed()
  {
    if (zzGg == null) {
      return;
    }
    try
    {
      zzGg.onRewardedVideoAdClosed();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onAdClosed().", localRemoteException);
    }
  }
  
  public void onRewardedVideoAdLeftApplication()
  {
    if (zzGg == null) {
      return;
    }
    try
    {
      zzGg.onRewardedVideoAdLeftApplication();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onAdLeftApplication().", localRemoteException);
    }
  }
  
  public void onRewardedVideoAdOpened()
  {
    zza(zzos.zzqg, false);
    if (zzGg == null) {
      return;
    }
    try
    {
      zzGg.onRewardedVideoAdOpened();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onAdOpened().", localRemoteException);
    }
  }
  
  public void onRewardedVideoStarted()
  {
    zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, zzos.zzqg, zzos.zzpZ, false, zzos.zzqg.zzyQ.zzys);
    if (zzGg == null) {
      return;
    }
    try
    {
      zzGg.onRewardedVideoStarted();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onVideoStarted().", localRemoteException);
    }
  }
  
  public void pause()
  {
    zzx.zzch("pause must be called on the main UI thread.");
    Iterator localIterator = zzGj.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      try
      {
        zzgy localZzgy = (zzgy)zzGj.get(str);
        if ((localZzgy != null) && (localZzgy.zzfQ() != null)) {
          localZzgy.zzfQ().pause();
        }
      }
      catch (RemoteException localRemoteException)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to pause adapter: " + str);
      }
    }
  }
  
  public void resume()
  {
    zzx.zzch("resume must be called on the main UI thread.");
    Iterator localIterator = zzGj.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      try
      {
        zzgy localZzgy = (zzgy)zzGj.get(str);
        if ((localZzgy != null) && (localZzgy.zzfQ() != null)) {
          localZzgy.zzfQ().resume();
        }
      }
      catch (RemoteException localRemoteException)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to resume adapter: " + str);
      }
    }
  }
  
  public void setUserId(String paramString)
  {
    zzx.zzch("setUserId must be called on the main UI thread.");
    zzGh = paramString;
  }
  
  public void zza(RewardedVideoAdRequestParcel paramRewardedVideoAdRequestParcel)
  {
    zzx.zzch("loadAd must be called on the main UI thread.");
    if (TextUtils.isEmpty(zzpZ))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Invalid ad unit id. Aborting.");
      return;
    }
    zzGi = false;
    zzos.zzpZ = zzpZ;
    super.zza(zzDy);
  }
  
  public void zza(zzd paramZzd)
  {
    zzx.zzch("setRewardedVideoAdListener must be called on the main UI thread.");
    zzGg = paramZzd;
  }
  
  public void zza(RewardItemParcel paramRewardItemParcel)
  {
    zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, zzos.zzqg, zzos.zzpZ, false, zzos.zzqg.zzyQ.zzyt);
    if (zzGg == null) {
      return;
    }
    try
    {
      if ((zzos.zzqg != null) && (zzos.zzqg.zzGG != null) && (!TextUtils.isEmpty(zzos.zzqg.zzGG.zzyB)))
      {
        zzGg.zza(new zzgv(zzos.zzqg.zzGG.zzyB, zzos.zzqg.zzGG.zzyC));
        return;
      }
    }
    catch (RemoteException paramRewardItemParcel)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onRewarded().", paramRewardItemParcel);
      return;
    }
    zzGg.zza(new zzgv(type, zzGE));
  }
  
  public void zza(final zzhj.zza paramZza, zzcd paramZzcd)
  {
    if (errorCode != -2)
    {
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          zzb(new zzhj(paramZza, null, null, null, null, null, null));
        }
      });
      return;
    }
    zzos.zzqz = 0;
    zzos.zzqe = new zzhe(zzos.context, zzGh, paramZza, this);
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("AdRenderer: " + zzos.zzqe.getClass().getName());
    zzos.zzqe.zzgn();
  }
  
  public boolean zza(zzhj paramZzhj1, zzhj paramZzhj2)
  {
    if (zzGg != null) {}
    try
    {
      zzGg.onRewardedVideoAdLoaded();
      return true;
    }
    catch (RemoteException paramZzhj1)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onAdLoaded().", paramZzhj1);
      }
    }
  }
  
  public zzgy zzar(String paramString)
  {
    localObject1 = (zzgy)zzGj.get(paramString);
    Object localObject2 = localObject1;
    if (localObject1 == null) {}
    try
    {
      localObject2 = new zzgy(zzow.zzab(paramString), this);
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Fail to instantiate adapter " + paramString, localException1);
    }
    catch (Exception localException1)
    {
      try
      {
        zzGj.put(paramString, localObject2);
        return localObject2;
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          localObject1 = localException1;
          Object localObject3 = localException2;
        }
      }
      localException1 = localException1;
    }
    return localObject1;
  }
  
  protected boolean zze(int paramInt)
  {
    com.google.android.gms.ads.internal.util.client.zzb.zzaE("Failed to load ad: " + paramInt);
    if (zzGg == null) {
      return false;
    }
    try
    {
      zzGg.onRewardedVideoAdFailedToLoad(paramInt);
      return true;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call RewardedVideoAdListener.onAdFailedToLoad().", localRemoteException);
    }
    return false;
  }
  
  public void zzfO()
  {
    zzx.zzch("showAd must be called on the main UI thread.");
    if (!isLoaded()) {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("The reward video has not loaded.");
    }
    zzgy localZzgy;
    do
    {
      return;
      zzGi = true;
      localZzgy = zzar(zzos.zzqg.zzyS);
    } while ((localZzgy == null) || (localZzgy.zzfQ() == null));
    try
    {
      localZzgy.zzfQ().showVideo();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call showVideo.", localRemoteException);
    }
  }
  
  public void zzfP()
  {
    onAdClicked();
  }
}
