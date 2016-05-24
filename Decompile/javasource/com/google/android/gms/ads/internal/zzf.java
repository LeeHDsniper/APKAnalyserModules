package com.google.android.gms.ads.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzay;
import com.google.android.gms.internal.zzaz;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import com.google.android.gms.internal.zziq.zzb;
import java.util.List;

@zzgk
public class zzf
  extends zzc
{
  private boolean zzoM;
  
  public zzf(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel)
  {
    super(paramContext, paramAdSizeParcel, paramString, paramZzeh, paramVersionInfoParcel, null);
  }
  
  private boolean zzb(zzhj paramZzhj1, zzhj paramZzhj2)
  {
    if (zzDX) {}
    for (;;)
    {
      try
      {
        paramZzhj2 = zzyR.getView();
        if (paramZzhj2 == null)
        {
          zzb.zzaE("View in mediation adapter is null.");
          return false;
        }
        paramZzhj2 = (View)zze.zzp(paramZzhj2);
        View localView = zzos.zzqc.getNextView();
        if (localView != null)
        {
          if ((localView instanceof zzip)) {
            ((zzip)localView).destroy();
          }
          zzos.zzqc.removeView(localView);
        }
        if (zzGH == null) {
          continue;
        }
      }
      catch (RemoteException paramZzhj1)
      {
        try
        {
          zzb(paramZzhj2);
          if (zzos.zzqc.getChildCount() > 1) {
            zzos.zzqc.showNext();
          }
          if (paramZzhj1 != null)
          {
            paramZzhj1 = zzos.zzqc.getNextView();
            if (!(paramZzhj1 instanceof zzip)) {
              break label277;
            }
            ((zzip)paramZzhj1).zza(zzos.context, zzos.zzqf);
            zzos.zzbO();
          }
          zzos.zzqc.setVisibility(0);
          return true;
        }
        catch (Throwable paramZzhj1)
        {
          zzb.zzd("Could not add mediation view to view hierarchy.", paramZzhj1);
          return false;
        }
        paramZzhj1 = paramZzhj1;
        zzb.zzd("Could not get View from mediation adapter.", paramZzhj1);
        return false;
      }
      if (zzAR != null)
      {
        zzAR.zza(zzGH);
        zzos.zzqc.removeAllViews();
        zzos.zzqc.setMinimumWidth(zzGH.widthPixels);
        zzos.zzqc.setMinimumHeight(zzGH.heightPixels);
        zzb(zzAR.getWebView());
        continue;
        label277:
        if (paramZzhj1 != null) {
          zzos.zzqc.removeView(paramZzhj1);
        }
      }
    }
  }
  
  public void setManualImpressionsEnabled(boolean paramBoolean)
  {
    zzx.zzch("setManualImpressionsEnabled must be called from the main thread.");
    zzoM = paramBoolean;
  }
  
  public void showInterstitial()
  {
    throw new IllegalStateException("Interstitial is NOT supported by BannerAdManager.");
  }
  
  public boolean zza(AdRequestParcel paramAdRequestParcel)
  {
    return super.zza(zzd(paramAdRequestParcel));
  }
  
  public boolean zza(zzhj paramZzhj1, final zzhj paramZzhj2)
  {
    if (!super.zza(paramZzhj1, paramZzhj2)) {
      return false;
    }
    if ((zzos.zzbP()) && (!zzb(paramZzhj1, paramZzhj2)))
    {
      zze(0);
      return false;
    }
    zza(paramZzhj2, false);
    if (zzos.zzbP()) {
      if (zzAR != null)
      {
        if (zzGF != null) {
          zzou.zza(zzos.zzqf, paramZzhj2);
        }
        if (!paramZzhj2.zzbY()) {
          break label115;
        }
        zzou.zza(zzos.zzqf, paramZzhj2).zza(zzAR);
      }
    }
    for (;;)
    {
      return true;
      label115:
      zzAR.zzgS().zza(new zziq.zzb()
      {
        public void zzbf()
        {
          zzou.zza(zzos.zzqf, paramZzhj2).zza(paramZzhj2zzAR);
        }
      });
      continue;
      if ((zzos.zzqy != null) && (zzGF != null)) {
        zzou.zza(zzos.zzqf, paramZzhj2, zzos.zzqy);
      }
    }
  }
  
  protected boolean zzaU()
  {
    boolean bool = true;
    if (!zzp.zzbx().zza(zzos.context.getPackageManager(), zzos.context.getPackageName(), "android.permission.INTERNET"))
    {
      zzk.zzcE().zza(zzos.zzqc, zzos.zzqf, "Missing internet permission in AndroidManifest.xml.", "Missing internet permission in AndroidManifest.xml. You must have the following declaration: <uses-permission android:name=\"android.permission.INTERNET\" />");
      bool = false;
    }
    if (!zzp.zzbx().zzI(zzos.context))
    {
      zzk.zzcE().zza(zzos.zzqc, zzos.zzqf, "Missing AdActivity with android:configChanges in AndroidManifest.xml.", "Missing AdActivity with android:configChanges in AndroidManifest.xml. You must have the following declaration within the <application> element: <activity android:name=\"com.google.android.gms.ads.AdActivity\" android:configChanges=\"keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize\" />");
      bool = false;
    }
    if ((!bool) && (zzos.zzqc != null)) {
      zzos.zzqc.setVisibility(0);
    }
    return bool;
  }
  
  AdRequestParcel zzd(AdRequestParcel paramAdRequestParcel)
  {
    if (zzsv == zzoM) {
      return paramAdRequestParcel;
    }
    int i = versionCode;
    long l = zzsq;
    Bundle localBundle = extras;
    int j = zzsr;
    List localList = zzss;
    boolean bool2 = zzst;
    int k = zzsu;
    if ((zzsv) || (zzoM)) {}
    for (boolean bool1 = true;; bool1 = false) {
      return new AdRequestParcel(i, l, localBundle, j, localList, bool2, k, bool1, zzsw, zzsx, zzsy, zzsz, zzsA, zzsB, zzsC, zzsD, zzsE);
    }
  }
}
