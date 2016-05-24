package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.widget.FrameLayout;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.formats.zzj;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;

public class zzcx
  extends zzg<zzcm>
{
  public zzcx()
  {
    super("com.google.android.gms.ads.NativeAdViewDelegateCreatorImpl");
  }
  
  private zzcl zzb(Context paramContext, FrameLayout paramFrameLayout1, FrameLayout paramFrameLayout2)
  {
    try
    {
      zzd localZzd = zze.zzx(paramContext);
      paramFrameLayout1 = zze.zzx(paramFrameLayout1);
      paramFrameLayout2 = zze.zzx(paramFrameLayout2);
      paramContext = zzcl.zza.zzu(((zzcm)zzar(paramContext)).zza(localZzd, paramFrameLayout1, paramFrameLayout2, 7895000));
      return paramContext;
    }
    catch (zzg.zza paramContext)
    {
      zzb.zzd("Could not create remote NativeAdViewDelegate.", paramContext);
      return null;
    }
    catch (RemoteException paramContext)
    {
      for (;;) {}
    }
  }
  
  protected zzcm zzD(IBinder paramIBinder)
  {
    return zzcm.zza.zzv(paramIBinder);
  }
  
  public zzcl zza(Context paramContext, FrameLayout paramFrameLayout1, FrameLayout paramFrameLayout2)
  {
    if (zzk.zzcE().zzR(paramContext))
    {
      zzcl localZzcl = zzb(paramContext, paramFrameLayout1, paramFrameLayout2);
      paramContext = localZzcl;
      if (localZzcl != null) {}
    }
    else
    {
      zzb.zzaC("Using NativeAdViewDelegate from the client jar.");
      paramContext = new zzj(paramFrameLayout1, paramFrameLayout2);
    }
    return paramContext;
  }
}
