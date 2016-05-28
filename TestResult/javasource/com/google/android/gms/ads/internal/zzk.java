package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.RemoteException;
import android.view.View;
import android.view.Window;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.overlay.AdOverlayInfoParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzay;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzdk;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhv;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import com.google.android.gms.internal.zzir;

@zzgk
public class zzk
  extends zzc
  implements zzdk
{
  protected transient boolean zzpj = false;
  
  public zzk(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel, zzd paramZzd)
  {
    super(paramContext, paramAdSizeParcel, paramString, paramZzeh, paramVersionInfoParcel, paramZzd);
  }
  
  private void zzb(Bundle paramBundle)
  {
    zzp.zzbx().zzb(zzos.context, zzos.zzqb.zzIz, "gmob-apps", paramBundle, false);
  }
  
  private void zzbm()
  {
    if (zzos.zzbP())
    {
      zzos.zzbM();
      zzos.zzqg = null;
      zzos.zzpk = false;
      zzpj = false;
    }
  }
  
  public void showInterstitial()
  {
    zzx.zzch("showInterstitial must be called on the main UI thread.");
    if (zzos.zzqg == null)
    {
      zzb.zzaE("The interstitial has not loaded.");
      return;
    }
    if (((Boolean)zzby.zzuZ.get()).booleanValue()) {
      if (zzos.context.getApplicationContext() == null) {
        break label211;
      }
    }
    label211:
    for (String str = zzos.context.getApplicationContext().getPackageName();; localObject = zzos.context.getPackageName())
    {
      Bundle localBundle;
      if (!zzpj)
      {
        zzb.zzaE("It is not recommended to show an interstitial before onAdLoaded completes.");
        localBundle = new Bundle();
        localBundle.putString("appid", str);
        localBundle.putString("action", "show_interstitial_before_load_finish");
        zzb(localBundle);
      }
      if (!zzp.zzbx().zzO(zzos.context))
      {
        zzb.zzaE("It is not recommended to show an interstitial when app is not in foreground.");
        localBundle = new Bundle();
        localBundle.putString("appid", str);
        localBundle.putString("action", "show_interstitial_app_not_in_foreground");
        zzb(localBundle);
      }
      if (zzos.zzbQ()) {
        break;
      }
      if (!zzos.zzqg.zzDX) {
        break label225;
      }
      try
      {
        zzos.zzqg.zzyR.showInterstitial();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        zzb.zzd("Could not show interstitial.", localRemoteException);
        zzbm();
        return;
      }
    }
    label225:
    if (zzos.zzqg.zzAR == null)
    {
      zzb.zzaE("The interstitial failed to load.");
      return;
    }
    if (zzos.zzqg.zzAR.zzgW())
    {
      zzb.zzaE("The interstitial is already showing.");
      return;
    }
    zzos.zzqg.zzAR.zzC(true);
    if (zzos.zzqg.zzGF != null) {
      zzou.zza(zzos.zzqf, zzos.zzqg);
    }
    Object localObject = new InterstitialAdParameterParcel(zzos.zzpk, zzbl());
    int j = zzos.zzqg.zzAR.getRequestedOrientation();
    int i = j;
    if (j == -1) {
      i = zzos.zzqg.orientation;
    }
    localObject = new AdOverlayInfoParcel(this, this, this, zzos.zzqg.zzAR, i, zzos.zzqb, zzos.zzqg.zzEc, (InterstitialAdParameterParcel)localObject);
    zzp.zzbv().zza(zzos.context, (AdOverlayInfoParcel)localObject);
  }
  
  protected zzip zza(zzhj.zza paramZza, zze paramZze)
  {
    zzip localZzip = zzp.zzby().zza(zzos.context, zzos.zzqf, false, false, zzos.zzqa, zzos.zzqb, zzov);
    localZzip.zzgS().zzb(this, null, this, this, ((Boolean)zzby.zzuN.get()).booleanValue(), this, this, paramZze, null);
    localZzip.zzaG(zzGL.zzDQ);
    return localZzip;
  }
  
  public boolean zza(AdRequestParcel paramAdRequestParcel, zzcd paramZzcd)
  {
    if (zzos.zzqg != null)
    {
      zzb.zzaE("An interstitial is already loading. Aborting.");
      return false;
    }
    return super.zza(paramAdRequestParcel, paramZzcd);
  }
  
  protected boolean zza(AdRequestParcel paramAdRequestParcel, zzhj paramZzhj, boolean paramBoolean)
  {
    if ((zzos.zzbP()) && (zzAR != null)) {
      zzp.zzbz().zza(zzAR.getWebView());
    }
    return zzor.zzbr();
  }
  
  public boolean zza(zzhj paramZzhj1, zzhj paramZzhj2)
  {
    if (!super.zza(paramZzhj1, paramZzhj2)) {
      return false;
    }
    if ((!zzos.zzbP()) && (zzos.zzqy != null) && (zzGF != null)) {
      zzou.zza(zzos.zzqf, paramZzhj2, zzos.zzqy);
    }
    return true;
  }
  
  protected boolean zzaT()
  {
    if (super.zzaT())
    {
      zzpj = true;
      return true;
    }
    return false;
  }
  
  public void zzaV()
  {
    zzbm();
    super.zzaV();
  }
  
  public void zzaW()
  {
    recordImpression();
    super.zzaW();
  }
  
  protected boolean zzbl()
  {
    if (!(zzos.context instanceof Activity)) {}
    Window localWindow;
    do
    {
      return false;
      localWindow = ((Activity)zzos.context).getWindow();
    } while ((localWindow == null) || (localWindow.getDecorView() == null));
    Rect localRect1 = new Rect();
    Rect localRect2 = new Rect();
    localWindow.getDecorView().getGlobalVisibleRect(localRect1, null);
    localWindow.getDecorView().getWindowVisibleDisplayFrame(localRect2);
    if ((bottom != 0) && (bottom != 0) && (top == top)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void zzd(boolean paramBoolean)
  {
    zzos.zzpk = paramBoolean;
  }
}
