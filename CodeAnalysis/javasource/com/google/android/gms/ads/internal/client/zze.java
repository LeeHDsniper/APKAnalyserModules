package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzf;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zze
  extends zzg<zzs>
{
  public zze()
  {
    super("com.google.android.gms.ads.AdManagerCreatorImpl");
  }
  
  private zzr zza(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeg paramZzeg, int paramInt)
  {
    try
    {
      com.google.android.gms.dynamic.zzd localZzd = com.google.android.gms.dynamic.zze.zzx(paramContext);
      paramContext = zzr.zza.zzk(((zzs)zzar(paramContext)).zza(localZzd, paramAdSizeParcel, paramString, paramZzeg, 7895000, paramInt));
      return paramContext;
    }
    catch (zzg.zza paramContext)
    {
      zzb.zza("Could not create remote AdManager.", paramContext);
      return null;
    }
    catch (RemoteException paramContext)
    {
      for (;;) {}
    }
  }
  
  public zzr zza(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeg paramZzeg)
  {
    Object localObject;
    if (zzk.zzcE().zzR(paramContext))
    {
      zzr localZzr = zza(paramContext, paramAdSizeParcel, paramString, paramZzeg, 1);
      localObject = localZzr;
      if (localZzr != null) {}
    }
    else
    {
      zzb.zzaC("Using BannerAdManager from the client jar.");
      localObject = new zzf(paramContext, paramAdSizeParcel, paramString, paramZzeg, new VersionInfoParcel(7895000, 7895000, true));
    }
    return localObject;
  }
  
  public zzr zzb(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeg paramZzeg)
  {
    Object localObject;
    if (zzk.zzcE().zzR(paramContext))
    {
      zzr localZzr = zza(paramContext, paramAdSizeParcel, paramString, paramZzeg, 2);
      localObject = localZzr;
      if (localZzr != null) {}
    }
    else
    {
      zzb.zzaE("Using InterstitialAdManager from the client jar.");
      localObject = new com.google.android.gms.ads.internal.zzk(paramContext, paramAdSizeParcel, paramString, paramZzeg, new VersionInfoParcel(7895000, 7895000, true), com.google.android.gms.ads.internal.zzd.zzbd());
    }
    return localObject;
  }
  
  protected zzs zze(IBinder paramIBinder)
  {
    return zzs.zza.zzl(paramIBinder);
  }
}
