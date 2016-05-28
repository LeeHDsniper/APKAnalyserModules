package com.google.android.gms.ads.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.purchase.GInAppPurchaseManagerInfoParcel;
import com.google.android.gms.ads.internal.purchase.zzc;
import com.google.android.gms.ads.internal.purchase.zzf;
import com.google.android.gms.ads.internal.purchase.zzi;
import com.google.android.gms.ads.internal.purchase.zzj;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel.zza;
import com.google.android.gms.ads.internal.request.CapabilityParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzay;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzdi;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzea;
import com.google.android.gms.internal.zzeb;
import com.google.android.gms.internal.zzec;
import com.google.android.gms.internal.zzef;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzfj;
import com.google.android.gms.internal.zzfm;
import com.google.android.gms.internal.zzfq;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhk;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzho;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhv;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zzlh;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@zzgk
public abstract class zzb
  extends zza
  implements com.google.android.gms.ads.internal.overlay.zzg, zzj, zzdi, zzeb
{
  private final Messenger mMessenger;
  protected final zzeh zzow;
  protected transient boolean zzox;
  
  public zzb(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel, zzd paramZzd)
  {
    this(new zzq(paramContext, paramAdSizeParcel, paramString, paramVersionInfoParcel), paramZzeh, null, paramZzd);
  }
  
  zzb(zzq paramZzq, zzeh paramZzeh, zzo paramZzo, zzd paramZzd)
  {
    super(paramZzq, paramZzo, paramZzd);
    zzow = paramZzeh;
    mMessenger = new Messenger(new zzfj(zzos.context));
    zzox = false;
  }
  
  private AdRequestInfoParcel.zza zza(AdRequestParcel paramAdRequestParcel, Bundle paramBundle)
  {
    ApplicationInfo localApplicationInfo = zzos.context.getApplicationInfo();
    DisplayMetrics localDisplayMetrics;
    String str1;
    Object localObject;
    int j;
    String str2;
    boolean bool3;
    long l1;
    Bundle localBundle;
    ArrayList localArrayList;
    PackageInfo localPackageInfo2;
    try
    {
      PackageInfo localPackageInfo1 = zzos.context.getPackageManager().getPackageInfo(packageName, 0);
      localDisplayMetrics = zzos.context.getResources().getDisplayMetrics();
      str1 = null;
      localObject = str1;
      if (zzos.zzqc != null)
      {
        localObject = str1;
        if (zzos.zzqc.getParent() != null)
        {
          localObject = new int[2];
          zzos.zzqc.getLocationOnScreen((int[])localObject);
          int k = localObject[0];
          int m = localObject[1];
          int n = zzos.zzqc.getWidth();
          int i1 = zzos.zzqc.getHeight();
          j = 0;
          i = j;
          if (zzos.zzqc.isShown())
          {
            i = j;
            if (k + n > 0)
            {
              i = j;
              if (m + i1 > 0)
              {
                i = j;
                if (k <= widthPixels)
                {
                  i = j;
                  if (m <= heightPixels) {
                    i = 1;
                  }
                }
              }
            }
          }
          localObject = new Bundle(5);
          ((Bundle)localObject).putInt("x", k);
          ((Bundle)localObject).putInt("y", m);
          ((Bundle)localObject).putInt("width", n);
          ((Bundle)localObject).putInt("height", i1);
          ((Bundle)localObject).putInt("visible", i);
        }
      }
      str1 = zzp.zzbA().zzga();
      zzos.zzqi = new zzhk(str1, zzos.zzpZ);
      zzos.zzqi.zzh(paramAdRequestParcel);
      str2 = zzp.zzbx().zza(zzos.context, zzos.zzqc, zzos.zzqf);
      j = zzm.zzq(zzos.context).zzbp();
      bool3 = zzm.zzq(zzos.context).zzbn();
      l2 = 0L;
      l1 = l2;
      if (zzos.zzqm == null) {}
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      try
      {
        l1 = zzos.zzqm.getValue();
        String str3 = UUID.randomUUID().toString();
        localBundle = zzp.zzbA().zza(zzos.context, this, str1);
        localArrayList = new ArrayList();
        int i = 0;
        while (i < zzos.zzqs.size())
        {
          localArrayList.add(zzos.zzqs.keyAt(i));
          i += 1;
          continue;
          localNameNotFoundException = localNameNotFoundException;
          localPackageInfo2 = null;
        }
      }
      catch (RemoteException localRemoteException)
      {
        for (;;)
        {
          long l2;
          com.google.android.gms.ads.internal.util.client.zzb.zzaE("Cannot get correlation id, default to 0.");
          l1 = l2;
        }
      }
    }
    boolean bool1;
    if (zzos.zzqn != null)
    {
      bool1 = true;
      if ((zzos.zzqo == null) || (!zzp.zzbA().zzgj())) {
        break label649;
      }
    }
    label649:
    for (boolean bool2 = true;; bool2 = false)
    {
      return new AdRequestInfoParcel.zza((Bundle)localObject, paramAdRequestParcel, zzos.zzqf, zzos.zzpZ, localApplicationInfo, localPackageInfo2, str1, zzp.zzbA().getSessionId(), zzos.zzqb, localBundle, zzos.zzqv, localArrayList, paramBundle, zzp.zzbA().zzge(), mMessenger, widthPixels, heightPixels, density, str2, bool3, j, l1, localRemoteException, zzby.zzde(), zzos.zzpY, zzos.zzqt, new CapabilityParcel(bool1, bool2));
      bool1 = false;
      break;
    }
  }
  
  public String getMediationAdapterClassName()
  {
    if (zzos.zzqg == null) {
      return null;
    }
    return zzos.zzqg.zzyS;
  }
  
  public void onAdClicked()
  {
    if (zzos.zzqg == null)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Ad state was null when trying to ping click URLs.");
      return;
    }
    if ((zzos.zzqg.zzGG != null) && (zzos.zzqg.zzGG.zzyw != null)) {
      zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, zzos.zzqg, zzos.zzpZ, false, zzp.zzbx().zza(zzos.context, zzos.zzqg.zzGG.zzyw, zzos.zzqg.zzDO));
    }
    if ((zzos.zzqg.zzyQ != null) && (zzos.zzqg.zzyQ.zzyp != null)) {
      zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, zzos.zzqg, zzos.zzpZ, false, zzp.zzbx().zza(zzos.context, zzos.zzqg.zzyQ.zzyp, zzos.zzqg.zzDO));
    }
    super.onAdClicked();
  }
  
  public void pause()
  {
    zzx.zzch("pause must be called on the main UI thread.");
    if ((zzos.zzqg != null) && (zzos.zzqg.zzAR != null) && (zzos.zzbP())) {
      zzp.zzbz().zza(zzos.zzqg.zzAR.getWebView());
    }
    if ((zzos.zzqg != null) && (zzos.zzqg.zzyR != null)) {}
    try
    {
      zzos.zzqg.zzyR.pause();
      zzou.zzg(zzos.zzqg);
      zzor.pause();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Could not pause mediation adapter.");
      }
    }
  }
  
  public void resume()
  {
    zzx.zzch("resume must be called on the main UI thread.");
    if ((zzos.zzqg != null) && (zzos.zzqg.zzAR != null) && (zzos.zzbP())) {
      zzp.zzbz().zzb(zzos.zzqg.zzAR.getWebView());
    }
    if ((zzos.zzqg != null) && (zzos.zzqg.zzyR != null)) {}
    try
    {
      zzos.zzqg.zzyR.resume();
      zzor.resume();
      zzou.zzh(zzos.zzqg);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Could not resume mediation adapter.");
      }
    }
  }
  
  public void showInterstitial()
  {
    throw new IllegalStateException("showInterstitial is not supported for current ad type");
  }
  
  public void zza(zzfm paramZzfm)
  {
    zzx.zzch("setInAppPurchaseListener must be called on the main UI thread.");
    zzos.zzqn = paramZzfm;
  }
  
  public void zza(zzfq paramZzfq, String paramString)
  {
    zzx.zzch("setPlayStorePurchaseParams must be called on the main UI thread.");
    zzos.zzqw = new com.google.android.gms.ads.internal.purchase.zzk(paramString);
    zzos.zzqo = paramZzfq;
    if ((!zzp.zzbA().zzgd()) && (paramZzfq != null)) {
      new zzc(zzos.context, zzos.zzqo, zzos.zzqw).zzgn();
    }
  }
  
  protected void zza(zzhj paramZzhj, boolean paramBoolean)
  {
    if (paramZzhj == null) {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Ad state was null when trying to ping impression URLs.");
    }
    do
    {
      return;
      super.zzc(paramZzhj);
      if ((zzGG != null) && (zzGG.zzyx != null)) {
        zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, paramZzhj, zzos.zzpZ, paramBoolean, zzp.zzbx().zza(zzos.context, zzGG.zzyx, zzDO));
      }
    } while ((zzyQ == null) || (zzyQ.zzyq == null));
    zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, paramZzhj, zzos.zzpZ, paramBoolean, zzp.zzbx().zza(zzos.context, zzyQ.zzyq, zzDO));
  }
  
  public void zza(String paramString, ArrayList<String> paramArrayList)
  {
    paramArrayList = new com.google.android.gms.ads.internal.purchase.zzd(paramString, paramArrayList, zzos.context, zzos.zzqb.zzIz);
    if (zzos.zzqn == null)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("InAppPurchaseListener is not set. Try to launch default purchase flow.");
      if (!com.google.android.gms.ads.internal.client.zzk.zzcE().zzR(zzos.context))
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Google Play Service unavailable, cannot launch default purchase flow.");
        return;
      }
      if (zzos.zzqo == null)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("PlayStorePurchaseListener is not set.");
        return;
      }
      if (zzos.zzqw == null)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("PlayStorePurchaseVerifier is not initialized.");
        return;
      }
      if (zzos.zzqA)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("An in-app purchase request is already in progress, abort");
        return;
      }
      zzos.zzqA = true;
      try
      {
        if (!zzos.zzqo.isValidPurchase(paramString))
        {
          zzos.zzqA = false;
          return;
        }
      }
      catch (RemoteException paramString)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Could not start In-App purchase.");
        zzos.zzqA = false;
        return;
      }
      zzp.zzbH().zza(zzos.context, zzos.zzqb.zzIC, new GInAppPurchaseManagerInfoParcel(zzos.context, zzos.zzqw, paramArrayList, this));
      return;
    }
    try
    {
      zzos.zzqn.zza(paramArrayList);
      return;
    }
    catch (RemoteException paramString)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Could not start In-App purchase.");
    }
  }
  
  public void zza(String paramString, boolean paramBoolean, int paramInt, final Intent paramIntent, zzf paramZzf)
  {
    try
    {
      if (zzos.zzqo != null) {
        zzos.zzqo.zza(new com.google.android.gms.ads.internal.purchase.zzg(zzos.context, paramString, paramBoolean, paramInt, paramIntent, paramZzf));
      }
      zzhu.zzHK.postDelayed(new Runnable()
      {
        public void run()
        {
          int i = zzp.zzbH().zzd(paramIntent);
          zzp.zzbH();
          if ((i == 0) && (zzos.zzqg != null) && (zzos.zzqg.zzAR != null) && (zzos.zzqg.zzAR.zzgQ() != null)) {
            zzos.zzqg.zzAR.zzgQ().close();
          }
          zzos.zzqA = false;
        }
      }, 500L);
      return;
    }
    catch (RemoteException paramString)
    {
      for (;;)
      {
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("Fail to invoke PlayStorePurchaseListener.");
      }
    }
  }
  
  public boolean zza(AdRequestParcel paramAdRequestParcel, zzcd paramZzcd)
  {
    if (!zzaU()) {
      return false;
    }
    Bundle localBundle = zza(zzp.zzbA().zzF(zzos.context));
    zzor.cancel();
    zzos.zzqz = 0;
    paramAdRequestParcel = zza(paramAdRequestParcel, localBundle);
    paramZzcd.zzd("seq_num", zzDB);
    if (zzDQ != null) {
      paramZzcd.zzd("request_id", zzDQ);
    }
    if (zzDz != null) {
      paramZzcd.zzd("app_version", String.valueOf(zzDz.versionCode));
    }
    zzos.zzqd = zzp.zzbt().zza(zzos.context, paramAdRequestParcel, zzos.zzqa, this);
    return true;
  }
  
  protected boolean zza(AdRequestParcel paramAdRequestParcel, zzhj paramZzhj, boolean paramBoolean)
  {
    if ((!paramBoolean) && (zzos.zzbP()))
    {
      if (zzyA <= 0L) {
        break label43;
      }
      zzor.zza(paramAdRequestParcel, zzyA);
    }
    for (;;)
    {
      return zzor.zzbr();
      label43:
      if ((zzGG != null) && (zzGG.zzyA > 0L)) {
        zzor.zza(paramAdRequestParcel, zzGG.zzyA);
      } else if ((!zzDX) && (errorCode == 2)) {
        zzor.zzf(paramAdRequestParcel);
      }
    }
  }
  
  boolean zza(zzhj paramZzhj)
  {
    boolean bool = false;
    Object localObject;
    if (zzot != null)
    {
      localObject = zzot;
      zzot = null;
    }
    for (;;)
    {
      return zza((AdRequestParcel)localObject, paramZzhj, bool);
      AdRequestParcel localAdRequestParcel = zzDy;
      localObject = localAdRequestParcel;
      if (extras != null)
      {
        bool = extras.getBoolean("_noRefresh", false);
        localObject = localAdRequestParcel;
      }
    }
  }
  
  protected boolean zza(zzhj paramZzhj1, zzhj paramZzhj2)
  {
    int i = 0;
    if ((paramZzhj1 != null) && (zzyT != null)) {
      zzyT.zza(null);
    }
    if (zzyT != null) {
      zzyT.zza(this);
    }
    int j;
    if (zzGG != null)
    {
      j = zzGG.zzyD;
      i = zzGG.zzyE;
    }
    for (;;)
    {
      zzos.zzqx.zzf(j, i);
      return true;
      j = 0;
    }
  }
  
  protected boolean zzaU()
  {
    boolean bool = true;
    if ((!zzp.zzbx().zza(zzos.context.getPackageManager(), zzos.context.getPackageName(), "android.permission.INTERNET")) || (!zzp.zzbx().zzI(zzos.context))) {
      bool = false;
    }
    return bool;
  }
  
  public void zzaV()
  {
    zzou.zze(zzos.zzqg);
    zzox = false;
    zzaQ();
    zzos.zzqi.zzfV();
  }
  
  public void zzaW()
  {
    zzox = true;
    zzaS();
  }
  
  public void zzaX()
  {
    onAdClicked();
  }
  
  public void zzaY()
  {
    zzaV();
  }
  
  public void zzaZ()
  {
    zzaO();
  }
  
  public void zzb(zzhj paramZzhj)
  {
    super.zzb(paramZzhj);
    if ((errorCode == 3) && (zzGG != null) && (zzGG.zzyy != null))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Pinging no fill URLs.");
      zzp.zzbJ().zza(zzos.context, zzos.zzqb.zzIz, paramZzhj, zzos.zzpZ, false, zzGG.zzyy);
    }
  }
  
  protected boolean zzb(AdRequestParcel paramAdRequestParcel)
  {
    return (super.zzb(paramAdRequestParcel)) && (!zzox);
  }
  
  public void zzba()
  {
    zzaW();
  }
  
  public void zzbb()
  {
    if (zzos.zzqg != null) {
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("Mediation adapter " + zzos.zzqg.zzyS + " refreshed, but mediation adapters should never refresh.");
    }
    zza(zzos.zzqg, true);
    zzaT();
  }
}
