package com.google.android.gms.ads;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.doubleclick.PublisherAdRequest;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.formats.NativeAppInstallAd.OnAppInstallAdLoadedListener;
import com.google.android.gms.ads.formats.NativeContentAd.OnContentAdLoadedListener;
import com.google.android.gms.ads.formats.NativeCustomTemplateAd.OnCustomClickListener;
import com.google.android.gms.ads.formats.NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener;
import com.google.android.gms.ads.internal.client.zzc;
import com.google.android.gms.ads.internal.client.zzd;
import com.google.android.gms.ads.internal.client.zzg;
import com.google.android.gms.ads.internal.client.zzo;
import com.google.android.gms.ads.internal.client.zzp;
import com.google.android.gms.ads.internal.client.zzx;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzcy;
import com.google.android.gms.internal.zzcz;
import com.google.android.gms.internal.zzda;
import com.google.android.gms.internal.zzdb;
import com.google.android.gms.internal.zzeg;

public class AdLoader
{
  private final Context mContext;
  private final zzg zznK;
  private final zzo zznL;
  
  AdLoader(Context paramContext, zzo paramZzo)
  {
    this(paramContext, paramZzo, zzg.zzcA());
  }
  
  AdLoader(Context paramContext, zzo paramZzo, zzg paramZzg)
  {
    mContext = paramContext;
    zznL = paramZzo;
    zznK = paramZzg;
  }
  
  private void zza(zzx paramZzx)
  {
    try
    {
      zznL.zze(zznK.zza(mContext, paramZzx));
      return;
    }
    catch (RemoteException paramZzx)
    {
      zzb.zzb("Failed to load ad.", paramZzx);
    }
  }
  
  public String getMediationAdapterClassName()
  {
    try
    {
      String str = zznL.getMediationAdapterClassName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Failed to get the mediation adapter class name.", localRemoteException);
    }
    return null;
  }
  
  public boolean isLoading()
  {
    try
    {
      boolean bool = zznL.isLoading();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Failed to check if ad is loading.", localRemoteException);
    }
    return false;
  }
  
  public void loadAd(AdRequest paramAdRequest)
  {
    zza(paramAdRequest.zzaF());
  }
  
  public void loadAd(PublisherAdRequest paramPublisherAdRequest)
  {
    zza(paramPublisherAdRequest.zzaF());
  }
  
  public static class Builder
  {
    private final Context mContext;
    private final zzp zznM;
    
    Builder(Context paramContext, zzp paramZzp)
    {
      mContext = paramContext;
      zznM = paramZzp;
    }
    
    public Builder(Context paramContext, String paramString)
    {
      this(paramContext, zzd.zza(paramContext, paramString, new zzeg()));
    }
    
    public AdLoader build()
    {
      try
      {
        AdLoader localAdLoader = new AdLoader(mContext, zznM.zzbk());
        return localAdLoader;
      }
      catch (RemoteException localRemoteException)
      {
        zzb.zzb("Failed to build AdLoader.", localRemoteException);
      }
      return null;
    }
    
    public Builder forAppInstallAd(NativeAppInstallAd.OnAppInstallAdLoadedListener paramOnAppInstallAdLoadedListener)
    {
      try
      {
        zznM.zza(new zzcy(paramOnAppInstallAdLoadedListener));
        return this;
      }
      catch (RemoteException paramOnAppInstallAdLoadedListener)
      {
        zzb.zzd("Failed to add app install ad listener", paramOnAppInstallAdLoadedListener);
      }
      return this;
    }
    
    public Builder forContentAd(NativeContentAd.OnContentAdLoadedListener paramOnContentAdLoadedListener)
    {
      try
      {
        zznM.zza(new zzcz(paramOnContentAdLoadedListener));
        return this;
      }
      catch (RemoteException paramOnContentAdLoadedListener)
      {
        zzb.zzd("Failed to add content ad listener", paramOnContentAdLoadedListener);
      }
      return this;
    }
    
    public Builder forCustomTemplateAd(String paramString, NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener paramOnCustomTemplateAdLoadedListener, NativeCustomTemplateAd.OnCustomClickListener paramOnCustomClickListener)
    {
      try
      {
        zzp localZzp = zznM;
        zzdb localZzdb = new zzdb(paramOnCustomTemplateAdLoadedListener);
        if (paramOnCustomClickListener == null) {}
        for (paramOnCustomTemplateAdLoadedListener = null;; paramOnCustomTemplateAdLoadedListener = new zzda(paramOnCustomClickListener))
        {
          localZzp.zza(paramString, localZzdb, paramOnCustomTemplateAdLoadedListener);
          return this;
        }
        return this;
      }
      catch (RemoteException paramString)
      {
        zzb.zzd("Failed to add custom template ad listener", paramString);
      }
    }
    
    public Builder withAdListener(AdListener paramAdListener)
    {
      try
      {
        zznM.zzb(new zzc(paramAdListener));
        return this;
      }
      catch (RemoteException paramAdListener)
      {
        zzb.zzd("Failed to set AdListener.", paramAdListener);
      }
      return this;
    }
    
    public Builder withNativeAdOptions(NativeAdOptions paramNativeAdOptions)
    {
      try
      {
        zznM.zza(new NativeAdOptionsParcel(paramNativeAdOptions));
        return this;
      }
      catch (RemoteException paramNativeAdOptions)
      {
        zzb.zzd("Failed to specify native ad options", paramNativeAdOptions);
      }
      return this;
    }
  }
}
