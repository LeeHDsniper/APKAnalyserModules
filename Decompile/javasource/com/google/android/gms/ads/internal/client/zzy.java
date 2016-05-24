package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.internal.zzci;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzfr;
import com.google.android.gms.internal.zzfv;
import java.util.concurrent.atomic.AtomicBoolean;

public class zzy
{
  private final zzg zznK;
  private boolean zzoM;
  private String zzoZ;
  private AppEventListener zzsK;
  private AdSize[] zzsL;
  private zza zzsn;
  private AdListener zzso;
  private final zzeg zztk = new zzeg();
  private final AtomicBoolean zztl;
  private zzr zztm;
  private String zztn;
  private ViewGroup zzto;
  private InAppPurchaseListener zztp;
  private PlayStorePurchaseListener zztq;
  private OnCustomRenderedAdLoadedListener zztr;
  
  public zzy(ViewGroup paramViewGroup)
  {
    this(paramViewGroup, null, false, zzg.zzcA());
  }
  
  public zzy(ViewGroup paramViewGroup, AttributeSet paramAttributeSet, boolean paramBoolean)
  {
    this(paramViewGroup, paramAttributeSet, paramBoolean, zzg.zzcA());
  }
  
  zzy(ViewGroup paramViewGroup, AttributeSet paramAttributeSet, boolean paramBoolean, zzg paramZzg)
  {
    this(paramViewGroup, paramAttributeSet, paramBoolean, paramZzg, null);
  }
  
  zzy(ViewGroup paramViewGroup, AttributeSet paramAttributeSet, boolean paramBoolean, zzg paramZzg, zzr paramZzr)
  {
    zzto = paramViewGroup;
    zznK = paramZzg;
    zztm = paramZzr;
    zztl = new AtomicBoolean(false);
    if (paramAttributeSet != null) {
      paramZzg = paramViewGroup.getContext();
    }
    try
    {
      paramAttributeSet = new zzj(paramZzg, paramAttributeSet);
      zzsL = paramAttributeSet.zzi(paramBoolean);
      zzoZ = paramAttributeSet.getAdUnitId();
      if (paramViewGroup.isInEditMode()) {
        zzk.zzcE().zza(paramViewGroup, new AdSizeParcel(paramZzg, zzsL[0]), "Ads by Google");
      }
      return;
    }
    catch (IllegalArgumentException paramAttributeSet)
    {
      zzk.zzcE().zza(paramViewGroup, new AdSizeParcel(paramZzg, AdSize.BANNER), paramAttributeSet.getMessage(), paramAttributeSet.getMessage());
    }
  }
  
  private void zzcR()
  {
    try
    {
      zzd localZzd = zztm.zzaM();
      if (localZzd == null) {
        return;
      }
      zzto.addView((View)com.google.android.gms.dynamic.zze.zzp(localZzd));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to get an ad frame.", localRemoteException);
    }
  }
  
  public void destroy()
  {
    try
    {
      if (zztm != null) {
        zztm.destroy();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to destroy AdView.", localRemoteException);
    }
  }
  
  public AdListener getAdListener()
  {
    return zzso;
  }
  
  public AdSize getAdSize()
  {
    try
    {
      if (zztm != null)
      {
        Object localObject = zztm.zzaN();
        if (localObject != null)
        {
          localObject = ((AdSizeParcel)localObject).zzcC();
          return localObject;
        }
      }
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to get the current AdSize.", localRemoteException);
      if (zzsL != null) {
        return zzsL[0];
      }
    }
    return null;
  }
  
  public AdSize[] getAdSizes()
  {
    return zzsL;
  }
  
  public String getAdUnitId()
  {
    return zzoZ;
  }
  
  public AppEventListener getAppEventListener()
  {
    return zzsK;
  }
  
  public InAppPurchaseListener getInAppPurchaseListener()
  {
    return zztp;
  }
  
  public String getMediationAdapterClassName()
  {
    try
    {
      if (zztm != null)
      {
        String str = zztm.getMediationAdapterClassName();
        return str;
      }
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to get the mediation adapter class name.", localRemoteException);
    }
    return null;
  }
  
  public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener()
  {
    return zztr;
  }
  
  public boolean isLoading()
  {
    try
    {
      if (zztm != null)
      {
        boolean bool = zztm.isLoading();
        return bool;
      }
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to check if ad is loading.", localRemoteException);
    }
    return false;
  }
  
  public void pause()
  {
    try
    {
      if (zztm != null) {
        zztm.pause();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to call pause.", localRemoteException);
    }
  }
  
  public void recordManualImpression()
  {
    if (zztl.getAndSet(true)) {}
    for (;;)
    {
      return;
      try
      {
        if (zztm != null)
        {
          zztm.zzaP();
          return;
        }
      }
      catch (RemoteException localRemoteException)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to record impression.", localRemoteException);
      }
    }
  }
  
  public void resume()
  {
    try
    {
      if (zztm != null) {
        zztm.resume();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to call resume.", localRemoteException);
    }
  }
  
  public void setAdListener(AdListener paramAdListener)
  {
    try
    {
      zzso = paramAdListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramAdListener == null) {
          break label38;
        }
      }
      label38:
      for (paramAdListener = new zzc(paramAdListener);; paramAdListener = null)
      {
        localZzr.zza(paramAdListener);
        return;
      }
      return;
    }
    catch (RemoteException paramAdListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the AdListener.", paramAdListener);
    }
  }
  
  public void setAdSizes(AdSize... paramVarArgs)
  {
    if (zzsL != null) {
      throw new IllegalStateException("The ad size can only be set once on AdView.");
    }
    zza(paramVarArgs);
  }
  
  public void setAdUnitId(String paramString)
  {
    if (zzoZ != null) {
      throw new IllegalStateException("The ad unit ID can only be set once on AdView.");
    }
    zzoZ = paramString;
  }
  
  public void setAppEventListener(AppEventListener paramAppEventListener)
  {
    try
    {
      zzsK = paramAppEventListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramAppEventListener == null) {
          break label38;
        }
      }
      label38:
      for (paramAppEventListener = new zzi(paramAppEventListener);; paramAppEventListener = null)
      {
        localZzr.zza(paramAppEventListener);
        return;
      }
      return;
    }
    catch (RemoteException paramAppEventListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the AppEventListener.", paramAppEventListener);
    }
  }
  
  public void setInAppPurchaseListener(InAppPurchaseListener paramInAppPurchaseListener)
  {
    if (zztq != null) {
      throw new IllegalStateException("Play store purchase parameter has already been set.");
    }
    try
    {
      zztp = paramInAppPurchaseListener;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramInAppPurchaseListener == null) {
          break label56;
        }
      }
      label56:
      for (paramInAppPurchaseListener = new zzfr(paramInAppPurchaseListener);; paramInAppPurchaseListener = null)
      {
        localZzr.zza(paramInAppPurchaseListener);
        return;
      }
      return;
    }
    catch (RemoteException paramInAppPurchaseListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the InAppPurchaseListener.", paramInAppPurchaseListener);
    }
  }
  
  public void setManualImpressionsEnabled(boolean paramBoolean)
  {
    zzoM = paramBoolean;
    try
    {
      if (zztm != null) {
        zztm.setManualImpressionsEnabled(zzoM);
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set manual impressions.", localRemoteException);
    }
  }
  
  public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    zztr = paramOnCustomRenderedAdLoadedListener;
    try
    {
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramOnCustomRenderedAdLoadedListener == null) {
          break label38;
        }
      }
      label38:
      for (paramOnCustomRenderedAdLoadedListener = new zzci(paramOnCustomRenderedAdLoadedListener);; paramOnCustomRenderedAdLoadedListener = null)
      {
        localZzr.zza(paramOnCustomRenderedAdLoadedListener);
        return;
      }
      return;
    }
    catch (RemoteException paramOnCustomRenderedAdLoadedListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the onCustomRenderedAdLoadedListener.", paramOnCustomRenderedAdLoadedListener);
    }
  }
  
  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    if (zztp != null) {
      throw new IllegalStateException("InAppPurchaseListener has already been set.");
    }
    try
    {
      zztq = paramPlayStorePurchaseListener;
      zztn = paramString;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramPlayStorePurchaseListener == null) {
          break label62;
        }
      }
      label62:
      for (paramPlayStorePurchaseListener = new zzfv(paramPlayStorePurchaseListener);; paramPlayStorePurchaseListener = null)
      {
        localZzr.zza(paramPlayStorePurchaseListener, paramString);
        return;
      }
      return;
    }
    catch (RemoteException paramPlayStorePurchaseListener)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the play store purchase parameter.", paramPlayStorePurchaseListener);
    }
  }
  
  public void zza(zza paramZza)
  {
    try
    {
      zzsn = paramZza;
      zzr localZzr;
      if (zztm != null)
      {
        localZzr = zztm;
        if (paramZza == null) {
          break label38;
        }
      }
      label38:
      for (paramZza = new zzb(paramZza);; paramZza = null)
      {
        localZzr.zza(paramZza);
        return;
      }
      return;
    }
    catch (RemoteException paramZza)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the AdClickListener.", paramZza);
    }
  }
  
  public void zza(zzx paramZzx)
  {
    try
    {
      if (zztm == null) {
        zzcS();
      }
      if (zztm.zza(zznK.zza(zzto.getContext(), paramZzx))) {
        zztk.zze(paramZzx.zzcN());
      }
      return;
    }
    catch (RemoteException paramZzx)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to load ad.", paramZzx);
    }
  }
  
  public void zza(AdSize... paramVarArgs)
  {
    zzsL = paramVarArgs;
    try
    {
      if (zztm != null) {
        zztm.zza(new AdSizeParcel(zzto.getContext(), zzsL));
      }
      zzto.requestLayout();
      return;
    }
    catch (RemoteException paramVarArgs)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to set the ad size.", paramVarArgs);
      }
    }
  }
  
  void zzcS()
    throws RemoteException
  {
    if (((zzsL == null) || (zzoZ == null)) && (zztm == null)) {
      throw new IllegalStateException("The ad size and ad unit ID must be set before loadAd is called.");
    }
    zztm = zzcT();
    if (zzso != null) {
      zztm.zza(new zzc(zzso));
    }
    if (zzsn != null) {
      zztm.zza(new zzb(zzsn));
    }
    if (zzsK != null) {
      zztm.zza(new zzi(zzsK));
    }
    if (zztp != null) {
      zztm.zza(new zzfr(zztp));
    }
    if (zztq != null) {
      zztm.zza(new zzfv(zztq), zztn);
    }
    if (zztr != null) {
      zztm.zza(new zzci(zztr));
    }
    zztm.zza(zzk.zzcG());
    zztm.setManualImpressionsEnabled(zzoM);
    zzcR();
  }
  
  protected zzr zzcT()
    throws RemoteException
  {
    Context localContext = zzto.getContext();
    return zzk.zzcF().zza(localContext, new AdSizeParcel(localContext, zzsL), zzoZ, zztk);
  }
}
