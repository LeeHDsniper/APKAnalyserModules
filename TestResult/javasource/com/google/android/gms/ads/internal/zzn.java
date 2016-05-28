package com.google.android.gms.ads.internal;

import android.content.Context;
import android.os.Handler;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.formats.zzd;
import com.google.android.gms.ads.internal.formats.zze;
import com.google.android.gms.ads.internal.formats.zzf;
import com.google.android.gms.ads.internal.formats.zzg;
import com.google.android.gms.ads.internal.formats.zzh.zza;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzch;
import com.google.android.gms.internal.zzcj;
import com.google.android.gms.internal.zzct;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzcv;
import com.google.android.gms.internal.zzcw;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzek;
import com.google.android.gms.internal.zzel;
import com.google.android.gms.internal.zzfm;
import com.google.android.gms.internal.zzga;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzlh;
import java.util.List;

@zzgk
public class zzn
  extends zzb
{
  public zzn(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel)
  {
    super(paramContext, paramAdSizeParcel, paramString, paramZzeh, paramVersionInfoParcel, null);
  }
  
  private static zzd zza(zzek paramZzek)
    throws RemoteException
  {
    String str1 = paramZzek.getHeadline();
    List localList = paramZzek.getImages();
    String str2 = paramZzek.getBody();
    if (paramZzek.zzds() != null) {}
    for (zzcj localZzcj = paramZzek.zzds();; localZzcj = null) {
      return new zzd(str1, localList, str2, localZzcj, paramZzek.getCallToAction(), paramZzek.getStarRating(), paramZzek.getStore(), paramZzek.getPrice(), null, paramZzek.getExtras());
    }
  }
  
  private static zze zza(zzel paramZzel)
    throws RemoteException
  {
    String str1 = paramZzel.getHeadline();
    List localList = paramZzel.getImages();
    String str2 = paramZzel.getBody();
    if (paramZzel.zzdw() != null) {}
    for (zzcj localZzcj = paramZzel.zzdw();; localZzcj = null) {
      return new zze(str1, localList, str2, localZzcj, paramZzel.getCallToAction(), paramZzel.getAdvertiser(), null, paramZzel.getExtras());
    }
  }
  
  private void zza(final zzd paramZzd)
  {
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        try
        {
          zzos.zzqp.zza(paramZzd);
          return;
        }
        catch (RemoteException localRemoteException)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call OnAppInstallAdLoadedListener.onAppInstallAdLoaded().", localRemoteException);
        }
      }
    });
  }
  
  private void zza(final zze paramZze)
  {
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        try
        {
          zzos.zzqq.zza(paramZze);
          return;
        }
        catch (RemoteException localRemoteException)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call OnContentAdLoadedListener.onContentAdLoaded().", localRemoteException);
        }
      }
    });
  }
  
  private void zza(final zzhj paramZzhj, final String paramString)
  {
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        try
        {
          ((zzcw)zzos.zzqs.get(paramString)).zza((zzf)paramZzhjzzGK);
          return;
        }
        catch (RemoteException localRemoteException)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call onCustomTemplateAdLoadedListener.onCustomTemplateAdLoaded().", localRemoteException);
        }
      }
    });
  }
  
  public void pause()
  {
    throw new IllegalStateException("Native Ad DOES NOT support pause().");
  }
  
  public void recordImpression()
  {
    zza(zzos.zzqg, false);
  }
  
  public void resume()
  {
    throw new IllegalStateException("Native Ad DOES NOT support resume().");
  }
  
  public void showInterstitial()
  {
    throw new IllegalStateException("Interstitial is NOT supported by NativeAdManager.");
  }
  
  public void zza(zzch paramZzch)
  {
    throw new IllegalStateException("CustomRendering is NOT supported by NativeAdManager.");
  }
  
  public void zza(zzfm paramZzfm)
  {
    throw new IllegalStateException("In App Purchase is NOT supported by NativeAdManager.");
  }
  
  public void zza(final zzhj.zza paramZza, zzcd paramZzcd)
  {
    if (zzqf != null) {
      zzos.zzqf = zzqf;
    }
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
    zzos.zzqe = zzp.zzbw().zza(zzos.context, this, paramZza, zzos.zzqa, null, zzow, this, paramZzcd);
    com.google.android.gms.ads.internal.util.client.zzb.zzaC("AdRenderer: " + zzos.zzqe.getClass().getName());
  }
  
  public void zza(zzlh<String, zzcw> paramZzlh)
  {
    zzx.zzch("setOnCustomTemplateAdLoadedListeners must be called on the main UI thread.");
    zzos.zzqs = paramZzlh;
  }
  
  public void zza(List<String> paramList)
  {
    zzx.zzch("setNativeTemplates must be called on the main UI thread.");
    zzos.zzqv = paramList;
  }
  
  protected boolean zza(AdRequestParcel paramAdRequestParcel, zzhj paramZzhj, boolean paramBoolean)
  {
    return zzor.zzbr();
  }
  
  protected boolean zza(zzhj paramZzhj1, zzhj paramZzhj2)
  {
    zza(null);
    if (!zzos.zzbP()) {
      throw new IllegalStateException("Native ad DOES NOT have custom rendering mode.");
    }
    if (zzDX) {}
    for (;;)
    {
      try
      {
        localObject1 = zzyR.zzdS();
        localObject2 = zzyR.zzdT();
        if (localObject1 == null) {
          continue;
        }
        localObject2 = zza((zzek)localObject1);
        ((zzd)localObject2).zza(new zzg(zzos.context, this, zzos.zzqa, (zzek)localObject1));
        zza((zzd)localObject2);
      }
      catch (RemoteException localRemoteException)
      {
        Object localObject1;
        Object localObject2;
        com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to get native ad mapper", localRemoteException);
        continue;
        com.google.android.gms.ads.internal.util.client.zzb.zzaE("No matching mapper for retrieved native ad template.");
        zze(0);
        return false;
      }
      return super.zza(paramZzhj1, paramZzhj2);
      if (localObject2 != null)
      {
        localObject1 = zza((zzel)localObject2);
        ((zze)localObject1).zza(new zzg(zzos.context, this, zzos.zzqa, (zzel)localObject2));
        zza((zze)localObject1);
      }
      else
      {
        zzh.zza localZza = zzGK;
        if (((localZza instanceof zze)) && (zzos.zzqq != null))
        {
          zza((zze)zzGK);
        }
        else if (((localZza instanceof zzd)) && (zzos.zzqp != null))
        {
          zza((zzd)zzGK);
        }
        else
        {
          if ((!(localZza instanceof zzf)) || (zzos.zzqs == null) || (zzos.zzqs.get(((zzf)localZza).getCustomTemplateId()) == null)) {
            break;
          }
          zza(paramZzhj2, ((zzf)localZza).getCustomTemplateId());
        }
      }
    }
    com.google.android.gms.ads.internal.util.client.zzb.zzaE("No matching listener for retrieved native ad template.");
    zze(0);
    return false;
  }
  
  public void zzb(NativeAdOptionsParcel paramNativeAdOptionsParcel)
  {
    zzx.zzch("setNativeAdOptions must be called on the main UI thread.");
    zzos.zzqt = paramNativeAdOptionsParcel;
  }
  
  public void zzb(zzct paramZzct)
  {
    zzx.zzch("setOnAppInstallAdLoadedListener must be called on the main UI thread.");
    zzos.zzqp = paramZzct;
  }
  
  public void zzb(zzcu paramZzcu)
  {
    zzx.zzch("setOnContentAdLoadedListener must be called on the main UI thread.");
    zzos.zzqq = paramZzcu;
  }
  
  public void zzb(zzlh<String, zzcv> paramZzlh)
  {
    zzx.zzch("setOnCustomClickListener must be called on the main UI thread.");
    zzos.zzqr = paramZzlh;
  }
  
  public zzlh<String, zzcw> zzbq()
  {
    zzx.zzch("getOnCustomTemplateAdLoadedListeners must be called on the main UI thread.");
    return zzos.zzqs;
  }
  
  public zzcv zzr(String paramString)
  {
    zzx.zzch("getOnCustomClickListener must be called on the main UI thread.");
    return (zzcv)zzos.zzqr.get(paramString);
  }
}
