package com.google.android.gms.ads.internal.request;

import android.content.Context;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhq;

@zzgk
public final class zzc
{
  public static zzhq zza(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zza paramZza)
  {
    zza(paramContext, paramAdRequestInfoParcel, paramZza, new zzb()
    {
      public boolean zzd(AdRequestInfoParcel paramAnonymousAdRequestInfoParcel)
      {
        return (zzqb.zzIC) || ((GooglePlayServicesUtil.zzag(zzrn)) && (!((Boolean)zzby.zzuw.get()).booleanValue()));
      }
    });
  }
  
  static zzhq zza(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zza paramZza, zzb paramZzb)
  {
    if (paramZzb.zzd(paramAdRequestInfoParcel)) {
      return zzb(paramContext, paramAdRequestInfoParcel, paramZza);
    }
    return zzc(paramContext, paramAdRequestInfoParcel, paramZza);
  }
  
  private static zzhq zzb(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zza paramZza)
  {
    zzb.zzaC("Fetching ad response from local ad request service.");
    paramContext = new zzd.zza(paramContext, paramAdRequestInfoParcel, paramZza);
    paramContext.zzgn();
    return paramContext;
  }
  
  private static zzhq zzc(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zza paramZza)
  {
    zzb.zzaC("Fetching ad response from remote ad request service.");
    if (!zzk.zzcE().zzR(paramContext))
    {
      zzb.zzaE("Failed to connect to remote ad request service.");
      return null;
    }
    return new zzd.zzb(paramContext, paramAdRequestInfoParcel, paramZza);
  }
  
  public static abstract interface zza
  {
    public abstract void zzb(AdResponseParcel paramAdResponseParcel);
  }
  
  static abstract interface zzb
  {
    public abstract boolean zzd(AdRequestInfoParcel paramAdRequestInfoParcel);
  }
}
