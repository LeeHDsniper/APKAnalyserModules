package com.google.android.gms.ads.internal;

import android.os.Bundle;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.View;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.client.zzr.zza;
import com.google.android.gms.ads.internal.client.zzt;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.request.zza.zza;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzay;
import com.google.android.gms.internal.zzbh;
import com.google.android.gms.internal.zzbk;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzca;
import com.google.android.gms.internal.zzcc;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzch;
import com.google.android.gms.internal.zzdd;
import com.google.android.gms.internal.zzfm;
import com.google.android.gms.internal.zzfq;
import com.google.android.gms.internal.zzga.zza;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhk;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzhn;
import com.google.android.gms.internal.zzho;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhv;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import java.util.HashSet;

@zzgk
public abstract class zza
  extends zzr.zza
  implements com.google.android.gms.ads.internal.client.zza, com.google.android.gms.ads.internal.overlay.zzn, zza.zza, zzdd, zzga.zza, zzhn
{
  private zzcd zzon;
  private zzcc zzoo;
  private zzcc zzop;
  boolean zzoq = false;
  protected final zzo zzor;
  protected final zzq zzos;
  protected transient AdRequestParcel zzot;
  protected final zzay zzou;
  protected final zzd zzov;
  
  zza(zzq paramZzq, zzo paramZzo, zzd paramZzd)
  {
    zzos = paramZzq;
    if (paramZzo != null) {}
    for (;;)
    {
      zzor = paramZzo;
      zzov = paramZzd;
      zzp.zzbx().zzJ(zzos.context);
      zzp.zzbA().zzb(zzos.context, zzos.zzqb);
      zzou = zzp.zzbA().zzgh();
      return;
      paramZzo = new zzo(this);
    }
  }
  
  private boolean zzaR()
  {
    zzb.zzaD("Ad leaving application.");
    if (zzos.zzqk == null) {
      return false;
    }
    try
    {
      zzos.zzqk.onAdLeftApplication();
      return true;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not call AdListener.onAdLeftApplication().", localRemoteException);
    }
    return false;
  }
  
  public void destroy()
  {
    zzx.zzch("destroy must be called on the main UI thread.");
    zzor.cancel();
    zzou.zzf(zzos.zzqg);
    zzos.destroy();
  }
  
  public boolean isLoading()
  {
    return zzoq;
  }
  
  public boolean isReady()
  {
    zzx.zzch("isLoaded must be called on the main UI thread.");
    return (zzos.zzqd == null) && (zzos.zzqe == null) && (zzos.zzqg != null);
  }
  
  public void onAdClicked()
  {
    if (zzos.zzqg == null) {
      zzb.zzaE("Ad state was null when trying to ping click URLs.");
    }
    do
    {
      return;
      zzb.zzaC("Pinging click URLs.");
      zzos.zzqi.zzfU();
      if (zzos.zzqg.zzyw != null) {
        zzp.zzbx().zza(zzos.context, zzos.zzqb.zzIz, zzp.zzbx().zza(zzos.context, zzos.zzqg.zzyw, zzos.zzqg.zzDO));
      }
    } while (zzos.zzqj == null);
    try
    {
      zzos.zzqj.onAdClicked();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not notify onAdClicked event.", localRemoteException);
    }
  }
  
  public void onAppEvent(String paramString1, String paramString2)
  {
    if (zzos.zzql != null) {}
    try
    {
      zzos.zzql.onAppEvent(paramString1, paramString2);
      return;
    }
    catch (RemoteException paramString1)
    {
      zzb.zzd("Could not call the AppEventListener.", paramString1);
    }
  }
  
  public void pause()
  {
    zzx.zzch("pause must be called on the main UI thread.");
  }
  
  protected void recordImpression()
  {
    zzc(zzos.zzqg);
  }
  
  public void resume()
  {
    zzx.zzch("resume must be called on the main UI thread.");
  }
  
  public void setManualImpressionsEnabled(boolean paramBoolean)
  {
    throw new UnsupportedOperationException("Attempt to call setManualImpressionsEnabled for an unsupported ad type.");
  }
  
  public void stopLoading()
  {
    zzx.zzch("stopLoading must be called on the main UI thread.");
    zzoq = false;
    zzos.zzf(true);
  }
  
  Bundle zza(zzbk paramZzbk)
  {
    if (paramZzbk == null) {}
    for (;;)
    {
      return null;
      if (paramZzbk.zzcx()) {
        paramZzbk.wakeup();
      }
      Object localObject = paramZzbk.zzcv();
      if (localObject != null)
      {
        paramZzbk = ((zzbh)localObject).zzcm();
        zzb.zzaC("In AdManger: loadAd, " + ((zzbh)localObject).toString());
      }
      while (paramZzbk != null)
      {
        localObject = new Bundle(1);
        ((Bundle)localObject).putString("fingerprint", paramZzbk);
        ((Bundle)localObject).putInt("v", 1);
        return localObject;
        paramZzbk = null;
      }
    }
  }
  
  public void zza(AdSizeParcel paramAdSizeParcel)
  {
    zzx.zzch("setAdSize must be called on the main UI thread.");
    zzos.zzqf = paramAdSizeParcel;
    if ((zzos.zzqg != null) && (zzos.zzqg.zzAR != null) && (zzos.zzqz == 0)) {
      zzos.zzqg.zzAR.zza(paramAdSizeParcel);
    }
    if (zzos.zzqc == null) {
      return;
    }
    if (zzos.zzqc.getChildCount() > 1) {
      zzos.zzqc.removeView(zzos.zzqc.getNextView());
    }
    zzos.zzqc.setMinimumWidth(widthPixels);
    zzos.zzqc.setMinimumHeight(heightPixels);
    zzos.zzqc.requestLayout();
  }
  
  public void zza(zzm paramZzm)
  {
    zzx.zzch("setAdListener must be called on the main UI thread.");
    zzos.zzqj = paramZzm;
  }
  
  public void zza(com.google.android.gms.ads.internal.client.zzn paramZzn)
  {
    zzx.zzch("setAdListener must be called on the main UI thread.");
    zzos.zzqk = paramZzn;
  }
  
  public void zza(zzt paramZzt)
  {
    zzx.zzch("setAppEventListener must be called on the main UI thread.");
    zzos.zzql = paramZzt;
  }
  
  public void zza(zzu paramZzu)
  {
    zzx.zzch("setCorrelationIdProvider must be called on the main UI thread");
    zzos.zzqm = paramZzu;
  }
  
  public void zza(zzch paramZzch)
  {
    throw new IllegalStateException("setOnCustomRenderedAdLoadedListener is not supported for current ad type");
  }
  
  public void zza(zzfm paramZzfm)
  {
    throw new IllegalStateException("setInAppPurchaseListener is not supported for current ad type");
  }
  
  public void zza(zzfq paramZzfq, String paramString)
  {
    throw new IllegalStateException("setPlayStorePurchaseParams is not supported for current ad type");
  }
  
  public void zza(zzhj.zza paramZza)
  {
    if ((zzGM.zzEb != -1L) && (!TextUtils.isEmpty(zzGM.zzEl)))
    {
      long l = zzo(zzGM.zzEl);
      if (l != -1L)
      {
        zzcc localZzcc = zzon.zzb(l + zzGM.zzEb);
        zzon.zza(localZzcc, new String[] { "stc" });
      }
    }
    zzon.zzR(zzGM.zzEl);
    zzon.zza(zzoo, new String[] { "arf" });
    zzop = zzon.zzdl();
    zzos.zzqd = null;
    zzos.zzqh = paramZza;
    zza(paramZza, zzon);
  }
  
  protected abstract void zza(zzhj.zza paramZza, zzcd paramZzcd);
  
  public void zza(HashSet<zzhk> paramHashSet)
  {
    zzos.zza(paramHashSet);
  }
  
  public boolean zza(AdRequestParcel paramAdRequestParcel)
  {
    zzx.zzch("loadAd must be called on the main UI thread.");
    if ((zzos.zzqd != null) || (zzos.zzqe != null))
    {
      if (zzot != null) {
        zzb.zzaE("Aborting last ad request since another ad request is already in progress. The current request object will still be cached for future refreshes.");
      }
      zzot = paramAdRequestParcel;
      return false;
    }
    zzb.zzaD("Starting ad request.");
    zzoq = true;
    zzaL();
    zzoo = zzon.zzdl();
    if (!zzst) {
      zzb.zzaD("Use AdRequest.Builder.addTestDevice(\"" + zzk.zzcE().zzQ(zzos.context) + "\") to get test ads on this device.");
    }
    return zza(paramAdRequestParcel, zzon);
  }
  
  protected abstract boolean zza(AdRequestParcel paramAdRequestParcel, zzcd paramZzcd);
  
  boolean zza(zzhj paramZzhj)
  {
    return false;
  }
  
  protected abstract boolean zza(zzhj paramZzhj1, zzhj paramZzhj2);
  
  void zzaL()
  {
    zzon = new zzcd(((Boolean)zzby.zzuB.get()).booleanValue(), "load_ad", zzos.zzqf.zzsG);
    zzoo = new zzcc(-1L, null, null);
    zzop = new zzcc(-1L, null, null);
  }
  
  public com.google.android.gms.dynamic.zzd zzaM()
  {
    zzx.zzch("getAdFrame must be called on the main UI thread.");
    return zze.zzx(zzos.zzqc);
  }
  
  public AdSizeParcel zzaN()
  {
    zzx.zzch("getAdSize must be called on the main UI thread.");
    return zzos.zzqf;
  }
  
  public void zzaO()
  {
    zzaR();
  }
  
  public void zzaP()
  {
    zzx.zzch("recordManualImpression must be called on the main UI thread.");
    if (zzos.zzqg == null) {
      zzb.zzaE("Ad state was null when trying to ping manual tracking URLs.");
    }
    do
    {
      return;
      zzb.zzaC("Pinging manual tracking URLs.");
    } while (zzos.zzqg.zzDZ == null);
    zzp.zzbx().zza(zzos.context, zzos.zzqb.zzIz, zzp.zzbx().zza(zzos.context, zzos.zzqg.zzDZ, zzos.zzqg.zzDO));
  }
  
  protected boolean zzaQ()
  {
    zzb.v("Ad closing.");
    if (zzos.zzqk == null) {
      return false;
    }
    try
    {
      zzos.zzqk.onAdClosed();
      return true;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not call AdListener.onAdClosed().", localRemoteException);
    }
    return false;
  }
  
  protected boolean zzaS()
  {
    zzb.zzaD("Ad opening.");
    if (zzos.zzqk == null) {
      return false;
    }
    try
    {
      zzos.zzqk.onAdOpened();
      return true;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not call AdListener.onAdOpened().", localRemoteException);
    }
    return false;
  }
  
  protected boolean zzaT()
  {
    zzb.zzaD("Ad finished loading.");
    zzoq = false;
    if (zzos.zzqk == null) {
      return false;
    }
    try
    {
      zzos.zzqk.onAdLoaded();
      return true;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not call AdListener.onAdLoaded().", localRemoteException);
    }
    return false;
  }
  
  protected void zzb(View paramView)
  {
    zzos.zzqc.addView(paramView, zzp.zzbz().zzgy());
  }
  
  public void zzb(zzhj paramZzhj)
  {
    zzon.zza(zzop, new String[] { "awr" });
    zzos.zzqe = null;
    if ((errorCode != -2) && (errorCode != 3)) {
      zzp.zzbA().zzb(zzos.zzbL());
    }
    if (errorCode == -1) {
      zzoq = false;
    }
    do
    {
      return;
      if (zza(paramZzhj)) {
        zzb.zzaC("Ad refresh scheduled.");
      }
      if (errorCode != -2)
      {
        zze(errorCode);
        return;
      }
      if (zzos.zzqx == null) {
        zzos.zzqx = new zzho(zzos.zzpZ);
      }
      zzou.zze(zzos.zzqg);
    } while (!zza(zzos.zzqg, paramZzhj));
    zzos.zzqg = paramZzhj;
    zzos.zzbS();
    zzcd localZzcd = zzon;
    if (zzos.zzqg.zzbY())
    {
      paramZzhj = "1";
      label204:
      localZzcd.zzd("is_mraid", paramZzhj);
      localZzcd = zzon;
      if (!zzos.zzqg.zzDX) {
        break label379;
      }
      paramZzhj = "1";
      label234:
      localZzcd.zzd("is_mediation", paramZzhj);
      if ((zzos.zzqg.zzAR != null) && (zzos.zzqg.zzAR.zzgS() != null))
      {
        localZzcd = zzon;
        if (!zzos.zzqg.zzAR.zzgS().zzhc()) {
          break label386;
        }
      }
    }
    label379:
    label386:
    for (paramZzhj = "1";; paramZzhj = "0")
    {
      localZzcd.zzd("is_video", paramZzhj);
      zzon.zza(zzoo, new String[] { "ttc" });
      if (zzp.zzbA().zzgc() != null) {
        zzp.zzbA().zzgc().zza(zzon);
      }
      if (!zzos.zzbP()) {
        break;
      }
      zzaT();
      return;
      paramZzhj = "0";
      break label204;
      paramZzhj = "0";
      break label234;
    }
  }
  
  protected boolean zzb(AdRequestParcel paramAdRequestParcel)
  {
    paramAdRequestParcel = zzos.zzqc.getParent();
    return ((paramAdRequestParcel instanceof View)) && (((View)paramAdRequestParcel).isShown()) && (zzp.zzbx().zzgq());
  }
  
  public void zzc(AdRequestParcel paramAdRequestParcel)
  {
    if (zzb(paramAdRequestParcel))
    {
      zza(paramAdRequestParcel);
      return;
    }
    zzb.zzaD("Ad is not visible. Not refreshing ad.");
    zzor.zzf(paramAdRequestParcel);
  }
  
  protected void zzc(zzhj paramZzhj)
  {
    if (paramZzhj == null) {
      zzb.zzaE("Ad state was null when trying to ping impression URLs.");
    }
    do
    {
      return;
      zzb.zzaC("Pinging Impression URLs.");
      zzos.zzqi.zzfT();
    } while (zzyx == null);
    zzp.zzbx().zza(zzos.context, zzos.zzqb.zzIz, zzp.zzbx().zza(zzos.context, zzyx, zzDO));
  }
  
  protected boolean zze(int paramInt)
  {
    zzb.zzaE("Failed to load ad: " + paramInt);
    zzoq = false;
    if (zzos.zzqk == null) {
      return false;
    }
    try
    {
      zzos.zzqk.onAdFailedToLoad(paramInt);
      return true;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not call AdListener.onAdFailedToLoad().", localRemoteException);
    }
    return false;
  }
  
  long zzo(String paramString)
  {
    int k = paramString.indexOf("ufe");
    int j = paramString.indexOf(',', k);
    int i = j;
    if (j == -1) {
      i = paramString.length();
    }
    try
    {
      long l = Long.parseLong(paramString.substring(k + 4, i));
      return l;
    }
    catch (IndexOutOfBoundsException paramString)
    {
      zzb.zzaE("Invalid index for Url fetch time in CSI latency info.");
      return -1L;
    }
    catch (NumberFormatException paramString)
    {
      for (;;)
      {
        zzb.zzaE("Cannot find valid format of Url fetch time in CSI latency info.");
      }
    }
  }
}
