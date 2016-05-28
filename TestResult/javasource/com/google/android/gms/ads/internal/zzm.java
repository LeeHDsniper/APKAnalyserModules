package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.ads.AdActivity;
import com.google.android.gms.ads.internal.client.MobileAdsSettingsParcel;
import com.google.android.gms.ads.internal.client.zzv.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.purchase.InAppPurchaseActivity;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzoj;
import com.google.android.gms.internal.zzoj.zza;
import com.google.android.gms.internal.zzoq;
import com.google.android.gms.internal.zzqf;
import com.google.android.gms.internal.zzqf.zza;
import com.google.android.gms.internal.zzqg;
import com.google.android.gms.internal.zzqg.zza;
import java.util.regex.Pattern;

@zzgk
public class zzm
  extends zzv.zza
  implements zzoj.zza, zzqg.zza
{
  private static final Object zzpm = new Object();
  private static zzm zzpn;
  private final Context mContext;
  zzqf zzpo;
  String zzpp;
  String zzpq;
  private boolean zzpr;
  private boolean zzps;
  
  zzm(Context paramContext)
  {
    mContext = paramContext;
    zzpr = false;
  }
  
  public static zzm zzq(Context paramContext)
  {
    synchronized (zzpm)
    {
      if (zzpn == null) {
        zzpn = new zzm(paramContext.getApplicationContext());
      }
      paramContext = zzpn;
      return paramContext;
    }
  }
  
  public String getClientId()
  {
    synchronized (zzpm)
    {
      if (!zzps) {
        return null;
      }
      String str = GoogleAnalytics.getInstance(mContext).getClientId();
      return str;
    }
  }
  
  public void zza(zzoq paramZzoq) {}
  
  public void zza(zzoq paramZzoq, Activity paramActivity)
  {
    if ((paramZzoq == null) || (paramActivity == null)) {}
    do
    {
      return;
      if ((paramActivity instanceof AdActivity))
      {
        int i = zzp.zzbx().zzk(paramActivity);
        if (i == 1)
        {
          paramZzoq.zzam(true);
          paramZzoq.setScreenName("Interstitial Ad");
          return;
        }
        if ((i == 2) || (i == 3))
        {
          paramZzoq.setScreenName("Expanded Ad");
          return;
        }
        paramZzoq.setScreenName(null);
        return;
      }
    } while (!(paramActivity instanceof InAppPurchaseActivity));
    paramZzoq.setScreenName(null);
  }
  
  public void zza(String paramString, MobileAdsSettingsParcel paramMobileAdsSettingsParcel)
  {
    synchronized (zzpm)
    {
      if (zzpr)
      {
        zzb.zzaE("Mobile ads is initialized already.");
        return;
      }
      if (mContext == null)
      {
        zzb.zzaE("Fail to initialize mobile ads because context is null.");
        return;
      }
    }
    if (TextUtils.isEmpty(paramString))
    {
      zzb.zzaE("Fail to initialize mobile ads because ApplicationCode is empty.");
      return;
    }
    zzpr = true;
    zzb(paramString, paramMobileAdsSettingsParcel);
  }
  
  void zzb(String paramString, MobileAdsSettingsParcel paramMobileAdsSettingsParcel)
  {
    if ((paramMobileAdsSettingsParcel != null) && (zzty))
    {
      if (!zzp.zzbx().zza(mContext.getPackageManager(), mContext.getPackageName(), "android.permission.INTERNET")) {
        zzb.e("Missing permission android.permission.INTERNET");
      }
    }
    else {
      return;
    }
    if (!zzp.zzbx().zza(mContext.getPackageManager(), mContext.getPackageName(), "android.permission.ACCESS_NETWORK_STATE"))
    {
      zzb.e("Missing permission android.permission.ACCESS_NETWORK_STATE");
      return;
    }
    if (!Pattern.matches("ca-app-[a-z0-9_-]+~[a-z0-9_-]+", paramString)) {
      throw new IllegalArgumentException("Please provide a valid application code");
    }
    zzps = true;
    zzpp = paramString;
    zzpq = zztz;
    paramString = zzqg.zzaR(mContext);
    paramMobileAdsSettingsParcel = new zzqf.zza(zzpp);
    if (!TextUtils.isEmpty(zzpq)) {
      paramMobileAdsSettingsParcel.zzfh(zzpq);
    }
    paramString.zza(paramMobileAdsSettingsParcel.zzBm());
    paramString.zza(this);
    zzoj.zzaJ(mContext).zza(this);
    paramString.start();
  }
  
  public boolean zzbn()
  {
    synchronized (zzpm)
    {
      boolean bool = zzps;
      return bool;
    }
  }
  
  public void zzbo()
  {
    zzpo = zzqg.zzaR(mContext).zzBn();
  }
  
  public int zzbp()
  {
    synchronized (zzpm)
    {
      if (!zzps) {
        return -1;
      }
      zzoq localZzoq = zzoj.zzaJ(mContext).zzxw();
      if (localZzoq != null)
      {
        int i = localZzoq.zzbp();
        return i;
      }
    }
    return -1;
  }
}
