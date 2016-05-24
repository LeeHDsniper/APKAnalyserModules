package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzj;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class zzd
  extends zzg<zzq>
{
  private static final zzd zzsp = new zzd();
  
  private zzd()
  {
    super("com.google.android.gms.ads.AdLoaderBuilderCreatorImpl");
  }
  
  public static zzp zza(Context paramContext, String paramString, zzeg paramZzeg)
  {
    Object localObject;
    if (zzk.zzcE().zzR(paramContext))
    {
      zzp localZzp = zzsp.zzb(paramContext, paramString, paramZzeg);
      localObject = localZzp;
      if (localZzp != null) {}
    }
    else
    {
      zzb.zzaC("Using AdLoader from the client jar.");
      localObject = new zzj(paramContext, paramString, paramZzeg, new VersionInfoParcel(7895000, 7895000, true));
    }
    return localObject;
  }
  
  private zzp zzb(Context paramContext, String paramString, zzeg paramZzeg)
  {
    try
    {
      com.google.android.gms.dynamic.zzd localZzd = zze.zzx(paramContext);
      paramContext = zzp.zza.zzi(((zzq)zzar(paramContext)).zza(localZzd, paramString, paramZzeg, 7895000));
      return paramContext;
    }
    catch (RemoteException paramContext)
    {
      zzb.zzd("Could not create remote builder for AdLoader.", paramContext);
      return null;
    }
    catch (zzg.zza paramContext)
    {
      for (;;)
      {
        zzb.zzd("Could not create remote builder for AdLoader.", paramContext);
      }
    }
  }
  
  protected zzq zzc(IBinder paramIBinder)
  {
    return zzq.zza.zzj(paramIBinder);
  }
}
