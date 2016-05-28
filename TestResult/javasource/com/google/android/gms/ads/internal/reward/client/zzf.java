package com.google.android.gms.ads.internal.reward.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzgw;

@zzgk
public class zzf
  extends zzg<zzc>
{
  public zzf()
  {
    super("com.google.android.gms.ads.reward.RewardedVideoAdCreatorImpl");
  }
  
  private zzb zzb(Context paramContext, zzeg paramZzeg)
  {
    try
    {
      zzd localZzd = zze.zzx(paramContext);
      paramContext = zzb.zza.zzZ(((zzc)zzar(paramContext)).zza(localZzd, paramZzeg, 7895000));
      return paramContext;
    }
    catch (zzg.zza paramContext)
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not get remote RewardedVideoAd.", paramContext);
      return null;
    }
    catch (RemoteException paramContext)
    {
      for (;;) {}
    }
  }
  
  public zzb zza(Context paramContext, zzeg paramZzeg)
  {
    Object localObject;
    if (zzk.zzcE().zzR(paramContext))
    {
      zzb localZzb = zzb(paramContext, paramZzeg);
      localObject = localZzb;
      if (localZzb != null) {}
    }
    else
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Using RewardedVideoAd from the client jar.");
      localObject = new zzgw(paramContext, paramZzeg, new VersionInfoParcel(7895000, 7895000, true));
    }
    return localObject;
  }
  
  protected zzc zzac(IBinder paramIBinder)
  {
    return zzc.zza.zzaa(paramIBinder);
  }
}
