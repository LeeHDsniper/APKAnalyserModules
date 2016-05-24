package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzm;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zzac
  extends zzg<zzw>
{
  public zzac()
  {
    super("com.google.android.gms.ads.MobileAdsSettingManagerCreatorImpl");
  }
  
  private zzv zzu(Context paramContext)
  {
    try
    {
      zzd localZzd = zze.zzx(paramContext);
      paramContext = zzv.zza.zzo(((zzw)zzar(paramContext)).zza(localZzd, 7895000));
      return paramContext;
    }
    catch (RemoteException paramContext)
    {
      zzb.zzd("Could not get remote MobileAdsSettingManager.", paramContext);
      return null;
    }
    catch (zzg.zza paramContext)
    {
      zzb.zzd("Could not get remote MobileAdsSettingManager.", paramContext);
    }
    return null;
  }
  
  protected zzw zzq(IBinder paramIBinder)
  {
    return zzw.zza.zzp(paramIBinder);
  }
  
  public zzv zzt(Context paramContext)
  {
    Object localObject;
    if (zzk.zzcE().zzR(paramContext))
    {
      zzv localZzv = zzu(paramContext);
      localObject = localZzv;
      if (localZzv != null) {}
    }
    else
    {
      zzb.zzaC("Using MobileAdsSettingManager from the client jar.");
      new VersionInfoParcel(7895000, 7895000, true);
      localObject = zzm.zzq(paramContext);
    }
    return localObject;
  }
}
