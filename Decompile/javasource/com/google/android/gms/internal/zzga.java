package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zza;
import com.google.android.gms.ads.internal.zzn;

@zzgk
public class zzga
{
  public zzga() {}
  
  public zzhq zza(Context paramContext, zza paramZza, zzhj.zza paramZza1, zzan paramZzan, zzip paramZzip, zzeh paramZzeh, zza paramZza2, zzcd paramZzcd)
  {
    AdResponseParcel localAdResponseParcel = zzGM;
    if (zzDX) {
      paramContext = new zzgd(paramContext, paramZza1, paramZzip, paramZzeh, paramZza2, paramZzcd);
    }
    for (;;)
    {
      zzb.zzaC("AdRenderer: " + paramContext.getClass().getName());
      paramContext.zzgo();
      return paramContext;
      if (zzsJ)
      {
        if ((paramZza instanceof zzn))
        {
          paramContext = new zzge(paramContext, (zzn)paramZza, new zzbc(), paramZza1, paramZzan, paramZza2);
        }
        else
        {
          paramZza1 = new StringBuilder().append("Invalid NativeAdManager type. Found: ");
          if (paramZza != null) {}
          for (paramContext = paramZza.getClass().getName();; paramContext = "null") {
            throw new IllegalArgumentException(paramContext + "; Required: NativeAdManager.");
          }
        }
      }
      else if (zzEd) {
        paramContext = new zzfy(paramContext, paramZza1, paramZzip, paramZza2);
      } else if ((((Boolean)zzby.zzuM.get()).booleanValue()) && (zzlv.zzpV()) && (!zzlv.isAtLeastL()) && (zzaNzzsH)) {
        paramContext = new zzgc(paramContext, paramZza1, paramZzip, paramZza2);
      } else {
        paramContext = new zzgb(paramContext, paramZza1, paramZzip, paramZza2);
      }
    }
  }
  
  public static abstract interface zza
  {
    public abstract void zzb(zzhj paramZzhj);
  }
}
