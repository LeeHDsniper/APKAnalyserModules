package com.google.android.gms.internal;

import android.app.Activity;
import android.os.RemoteException;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.reward.mediation.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

@zzgk
public final class zzes<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters>
  extends zzei.zza
{
  private final MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> zzzc;
  private final NETWORK_EXTRAS zzzd;
  
  public zzes(MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> paramMediationAdapter, NETWORK_EXTRAS paramNETWORK_EXTRAS)
  {
    zzzc = paramMediationAdapter;
    zzzd = paramNETWORK_EXTRAS;
  }
  
  private SERVER_PARAMETERS zzb(String paramString1, int paramInt, String paramString2)
    throws RemoteException
  {
    if (paramString1 != null) {
      try
      {
        localObject = new JSONObject(paramString1);
        paramString2 = new HashMap(((JSONObject)localObject).length());
        Iterator localIterator = ((JSONObject)localObject).keys();
        for (;;)
        {
          paramString1 = paramString2;
          if (!localIterator.hasNext()) {
            break;
          }
          paramString1 = (String)localIterator.next();
          paramString2.put(paramString1, ((JSONObject)localObject).getString(paramString1));
        }
        paramString1 = new HashMap(0);
      }
      catch (Throwable paramString1)
      {
        zzb.zzd("Could not get MediationServerParameters.", paramString1);
        throw new RemoteException();
      }
    }
    Object localObject = zzzc.getServerParametersType();
    paramString2 = null;
    if (localObject != null)
    {
      paramString2 = (MediationServerParameters)((Class)localObject).newInstance();
      paramString2.load(paramString1);
    }
    return paramString2;
  }
  
  public void destroy()
    throws RemoteException
  {
    try
    {
      zzzc.destroy();
      return;
    }
    catch (Throwable localThrowable)
    {
      zzb.zzd("Could not destroy adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public zzd getView()
    throws RemoteException
  {
    if (!(zzzc instanceof MediationBannerAdapter))
    {
      zzb.zzaE("MediationAdapter is not a MediationBannerAdapter: " + zzzc.getClass().getCanonicalName());
      throw new RemoteException();
    }
    try
    {
      zzd localZzd = zze.zzx(((MediationBannerAdapter)zzzc).getBannerView());
      return localZzd;
    }
    catch (Throwable localThrowable)
    {
      zzb.zzd("Could not get banner view from adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public boolean isInitialized()
  {
    return true;
  }
  
  public void pause()
    throws RemoteException
  {
    throw new RemoteException();
  }
  
  public void resume()
    throws RemoteException
  {
    throw new RemoteException();
  }
  
  public void showInterstitial()
    throws RemoteException
  {
    if (!(zzzc instanceof MediationInterstitialAdapter))
    {
      zzb.zzaE("MediationAdapter is not a MediationInterstitialAdapter: " + zzzc.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzb.zzaC("Showing interstitial from adapter.");
    try
    {
      ((MediationInterstitialAdapter)zzzc).showInterstitial();
      return;
    }
    catch (Throwable localThrowable)
    {
      zzb.zzd("Could not show interstitial from adapter.", localThrowable);
      throw new RemoteException();
    }
  }
  
  public void showVideo() {}
  
  public void zza(AdRequestParcel paramAdRequestParcel, String paramString) {}
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, zza paramZza, String paramString2)
    throws RemoteException
  {}
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
    throws RemoteException
  {
    zza(paramZzd, paramAdRequestParcel, paramString, null, paramZzej);
  }
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
    throws RemoteException
  {
    if (!(zzzc instanceof MediationInterstitialAdapter))
    {
      zzb.zzaE("MediationAdapter is not a MediationInterstitialAdapter: " + zzzc.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzb.zzaC("Requesting interstitial ad from adapter.");
    try
    {
      ((MediationInterstitialAdapter)zzzc).requestInterstitialAd(new zzet(paramZzej), (Activity)zze.zzp(paramZzd), zzb(paramString1, zzsu, paramString2), zzeu.zzg(paramAdRequestParcel), zzzd);
      return;
    }
    catch (Throwable paramZzd)
    {
      zzb.zzd("Could not request interstitial ad from adapter.", paramZzd);
      throw new RemoteException();
    }
  }
  
  public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList) {}
  
  public void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
    throws RemoteException
  {
    zza(paramZzd, paramAdSizeParcel, paramAdRequestParcel, paramString, null, paramZzej);
  }
  
  public void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
    throws RemoteException
  {
    if (!(zzzc instanceof MediationBannerAdapter))
    {
      zzb.zzaE("MediationAdapter is not a MediationBannerAdapter: " + zzzc.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzb.zzaC("Requesting banner ad from adapter.");
    try
    {
      ((MediationBannerAdapter)zzzc).requestBannerAd(new zzet(paramZzej), (Activity)zze.zzp(paramZzd), zzb(paramString1, zzsu, paramString2), zzeu.zzb(paramAdSizeParcel), zzeu.zzg(paramAdRequestParcel), zzzd);
      return;
    }
    catch (Throwable paramZzd)
    {
      zzb.zzd("Could not request banner ad from adapter.", paramZzd);
      throw new RemoteException();
    }
  }
  
  public zzek zzdS()
  {
    return null;
  }
  
  public zzel zzdT()
  {
    return null;
  }
}
