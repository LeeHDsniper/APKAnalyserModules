package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.NativeAdMapper;
import com.google.android.gms.ads.mediation.NativeAppInstallAdMapper;
import com.google.android.gms.ads.mediation.NativeContentAdMapper;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONObject;

@zzgk
public final class zzen
  extends zzei.zza
{
  private final MediationAdapter zzyW;
  private zzeo zzyX;
  
  public zzen(MediationAdapter paramMediationAdapter)
  {
    zzyW = paramMediationAdapter;
  }
  
  private Bundle zza(String paramString1, int paramInt, String paramString2)
    throws RemoteException
  {
    com.google.android.gms.ads.internal.util.client.zzb.zzaE("Server parameters: " + paramString1);
    Bundle localBundle;
    try
    {
      localBundle = new Bundle();
      if (paramString1 != null)
      {
        paramString1 = new JSONObject(paramString1);
        localBundle = new Bundle();
        Iterator localIterator = paramString1.keys();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          localBundle.putString(str, paramString1.getString(str));
        }
      }
      if (!(zzyW instanceof AdMobAdapter)) {
        break label138;
      }
    }
    catch (Throwable paramString1)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not get Server Parameters Bundle.", paramString1);
      throw new RemoteException();
    }
    localBundle.putString("adJson", paramString2);
    localBundle.putInt("tagForChildDirectedTreatment", paramInt);
    label138:
    return localBundle;
  }
  
  public void destroy()
    throws RemoteException
  {
    try
    {
      zzyW.onDestroy();
      return;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not destroy adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public zzd getView()
    throws RemoteException
  {
    if (!(zzyW instanceof MediationBannerAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationBannerAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    try
    {
      zzd localZzd = zze.zzx(((MediationBannerAdapter)zzyW).getBannerView());
      return localZzd;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not get banner view from adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public boolean isInitialized()
    throws RemoteException
  {
    if (!(zzyW instanceof MediationRewardedVideoAdAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationRewardedVideoAdAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Check if adapter is initialized.");
    try
    {
      boolean bool = ((MediationRewardedVideoAdAdapter)zzyW).isInitialized();
      return bool;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not check if adapter is initialized.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public void pause()
    throws RemoteException
  {
    try
    {
      zzyW.onPause();
      return;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not pause adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public void resume()
    throws RemoteException
  {
    try
    {
      zzyW.onResume();
      return;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not resume adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public void showInterstitial()
    throws RemoteException
  {
    if (!(zzyW instanceof MediationInterstitialAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationInterstitialAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Showing interstitial from adapter.");
    try
    {
      ((MediationInterstitialAdapter)zzyW).showInterstitial();
      return;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not show interstitial from adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public void showVideo()
    throws RemoteException
  {
    if (!(zzyW instanceof MediationRewardedVideoAdAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationRewardedVideoAdAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Show rewarded video ad from adapter.");
    try
    {
      ((MediationRewardedVideoAdAdapter)zzyW).showVideo();
      return;
    }
    catch (Throwable localThrowable)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not show rewarded video ad from adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public void zza(AdRequestParcel paramAdRequestParcel, String paramString)
    throws RemoteException
  {
    if (!(zzyW instanceof MediationRewardedVideoAdAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationRewardedVideoAdAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Requesting rewarded video ad from adapter.");
    for (;;)
    {
      try
      {
        MediationRewardedVideoAdAdapter localMediationRewardedVideoAdAdapter = (MediationRewardedVideoAdAdapter)zzyW;
        if (zzss == null) {
          break label204;
        }
        localObject1 = new HashSet(zzss);
        Object localObject2;
        if (zzsq == -1L)
        {
          localObject2 = null;
          localObject2 = new zzem((Date)localObject2, zzsr, (Set)localObject1, zzsy, zzst, zzsu);
          if (zzsA != null)
          {
            localObject1 = zzsA.getBundle(localMediationRewardedVideoAdAdapter.getClass().getName());
            localMediationRewardedVideoAdAdapter.loadAd((MediationAdRequest)localObject2, zza(paramString, zzsu, null), (Bundle)localObject1);
          }
        }
        else
        {
          localObject2 = new Date(zzsq);
          continue;
        }
        localObject1 = null;
      }
      catch (Throwable paramAdRequestParcel)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not load rewarded video ad from adapter.", paramAdRequestParcel);
        throw new RemoteException();
      }
      continue;
      label204:
      Object localObject1 = null;
    }
  }
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, com.google.android.gms.ads.internal.reward.mediation.client.zza paramZza, String paramString2)
    throws RemoteException
  {
    if (!(zzyW instanceof MediationRewardedVideoAdAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationRewardedVideoAdAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Initialize rewarded video adapter.");
    for (;;)
    {
      try
      {
        MediationRewardedVideoAdAdapter localMediationRewardedVideoAdAdapter = (MediationRewardedVideoAdAdapter)zzyW;
        if (zzss == null) {
          break label228;
        }
        localObject1 = new HashSet(zzss);
        Object localObject2;
        if (zzsq == -1L)
        {
          localObject2 = null;
          localObject2 = new zzem((Date)localObject2, zzsr, (Set)localObject1, zzsy, zzst, zzsu);
          if (zzsA != null)
          {
            localObject1 = zzsA.getBundle(localMediationRewardedVideoAdAdapter.getClass().getName());
            localMediationRewardedVideoAdAdapter.initialize((Context)zze.zzp(paramZzd), (MediationAdRequest)localObject2, paramString1, new com.google.android.gms.ads.internal.reward.mediation.client.zzb(paramZza), zza(paramString2, zzsu, null), (Bundle)localObject1);
          }
        }
        else
        {
          localObject2 = new Date(zzsq);
          continue;
        }
        localObject1 = null;
      }
      catch (Throwable paramZzd)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not initialize rewarded video adapter.", paramZzd);
        throw new RemoteException();
      }
      continue;
      label228:
      Object localObject1 = null;
    }
  }
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
    throws RemoteException
  {
    zza(paramZzd, paramAdRequestParcel, paramString, null, paramZzej);
  }
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
    throws RemoteException
  {
    if (!(zzyW instanceof MediationInterstitialAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationInterstitialAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Requesting interstitial ad from adapter.");
    for (;;)
    {
      try
      {
        MediationInterstitialAdapter localMediationInterstitialAdapter = (MediationInterstitialAdapter)zzyW;
        if (zzss == null) {
          break label228;
        }
        localObject1 = new HashSet(zzss);
        Object localObject2;
        if (zzsq == -1L)
        {
          localObject2 = null;
          localObject2 = new zzem((Date)localObject2, zzsr, (Set)localObject1, zzsy, zzst, zzsu);
          if (zzsA != null)
          {
            localObject1 = zzsA.getBundle(localMediationInterstitialAdapter.getClass().getName());
            localMediationInterstitialAdapter.requestInterstitialAd((Context)zze.zzp(paramZzd), new zzeo(paramZzej), zza(paramString1, zzsu, paramString2), (MediationAdRequest)localObject2, (Bundle)localObject1);
          }
        }
        else
        {
          localObject2 = new Date(zzsq);
          continue;
        }
        localObject1 = null;
      }
      catch (Throwable paramZzd)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not request interstitial ad from adapter.", paramZzd);
        throw new RemoteException();
      }
      continue;
      label228:
      Object localObject1 = null;
    }
  }
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList)
    throws RemoteException
  {
    if (!(zzyW instanceof com.google.android.gms.ads.mediation.zza))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationNativeAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    for (;;)
    {
      try
      {
        com.google.android.gms.ads.mediation.zza localZza = (com.google.android.gms.ads.mediation.zza)zzyW;
        if (zzss == null) {
          break label235;
        }
        localHashSet = new HashSet(zzss);
        Date localDate;
        if (zzsq == -1L)
        {
          localDate = null;
          paramList = new zzer(localDate, zzsr, localHashSet, zzsy, zzst, zzsu, paramNativeAdOptionsParcel, paramList);
          if (zzsA != null)
          {
            paramNativeAdOptionsParcel = zzsA.getBundle(localZza.getClass().getName());
            zzyX = new zzeo(paramZzej);
            localZza.requestNativeAd((Context)zze.zzp(paramZzd), zzyX, zza(paramString1, zzsu, paramString2), paramList, paramNativeAdOptionsParcel);
          }
        }
        else
        {
          localDate = new Date(zzsq);
          continue;
        }
        paramNativeAdOptionsParcel = null;
      }
      catch (Throwable paramZzd)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not request interstitial ad from adapter.", paramZzd);
        throw new RemoteException();
      }
      continue;
      label235:
      HashSet localHashSet = null;
    }
  }
  
  public void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
    throws RemoteException
  {
    zza(paramZzd, paramAdSizeParcel, paramAdRequestParcel, paramString, null, paramZzej);
  }
  
  public void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
    throws RemoteException
  {
    if (!(zzyW instanceof MediationBannerAdapter))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("MediationAdapter is not a MediationBannerAdapter: " + zzyW.getClass().getCanonicalName());
      throw new RemoteException();
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("Requesting banner ad from adapter.");
    for (;;)
    {
      try
      {
        MediationBannerAdapter localMediationBannerAdapter = (MediationBannerAdapter)zzyW;
        if (zzss == null) {
          break label244;
        }
        localObject1 = new HashSet(zzss);
        Object localObject2;
        if (zzsq == -1L)
        {
          localObject2 = null;
          localObject2 = new zzem((Date)localObject2, zzsr, (Set)localObject1, zzsy, zzst, zzsu);
          if (zzsA != null)
          {
            localObject1 = zzsA.getBundle(localMediationBannerAdapter.getClass().getName());
            localMediationBannerAdapter.requestBannerAd((Context)zze.zzp(paramZzd), new zzeo(paramZzej), zza(paramString1, zzsu, paramString2), com.google.android.gms.ads.zza.zza(width, height, zzsG), (MediationAdRequest)localObject2, (Bundle)localObject1);
          }
        }
        else
        {
          localObject2 = new Date(zzsq);
          continue;
        }
        localObject1 = null;
      }
      catch (Throwable paramZzd)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not request banner ad from adapter.", paramZzd);
        throw new RemoteException();
      }
      continue;
      label244:
      Object localObject1 = null;
    }
  }
  
  public zzek zzdS()
  {
    NativeAdMapper localNativeAdMapper = zzyX.zzdU();
    if ((localNativeAdMapper instanceof NativeAppInstallAdMapper)) {
      return new zzep((NativeAppInstallAdMapper)localNativeAdMapper);
    }
    return null;
  }
  
  public zzel zzdT()
  {
    NativeAdMapper localNativeAdMapper = zzyX.zzdU();
    if ((localNativeAdMapper instanceof NativeContentAdMapper)) {
      return new zzeq((NativeContentAdMapper)localNativeAdMapper);
    }
    return null;
  }
}
