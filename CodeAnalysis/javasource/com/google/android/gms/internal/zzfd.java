package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;

@zzgk
public final class zzfd
  extends zzg<zzff>
{
  private static final zzfd zzBC = new zzfd();
  
  private zzfd()
  {
    super("com.google.android.gms.ads.AdOverlayCreatorImpl");
  }
  
  public static zzfe zzb(Activity paramActivity)
  {
    try
    {
      if (zzc(paramActivity))
      {
        zzb.zzaC("Using AdOverlay from the client jar.");
        return new com.google.android.gms.ads.internal.overlay.zzd(paramActivity);
      }
      paramActivity = zzBC.zzd(paramActivity);
      return paramActivity;
    }
    catch (zza paramActivity)
    {
      zzb.zzaE(paramActivity.getMessage());
    }
    return null;
  }
  
  private static boolean zzc(Activity paramActivity)
    throws zzfd.zza
  {
    paramActivity = paramActivity.getIntent();
    if (!paramActivity.hasExtra("com.google.android.gms.ads.internal.overlay.useClientJar")) {
      throw new zza("Ad overlay requires the useClientJar flag in intent extras.");
    }
    return paramActivity.getBooleanExtra("com.google.android.gms.ads.internal.overlay.useClientJar", false);
  }
  
  private zzfe zzd(Activity paramActivity)
  {
    try
    {
      com.google.android.gms.dynamic.zzd localZzd = zze.zzx(paramActivity);
      paramActivity = zzfe.zza.zzK(((zzff)zzar(paramActivity)).zze(localZzd));
      return paramActivity;
    }
    catch (RemoteException paramActivity)
    {
      zzb.zzd("Could not create remote AdOverlay.", paramActivity);
      return null;
    }
    catch (zzg.zza paramActivity)
    {
      zzb.zzd("Could not create remote AdOverlay.", paramActivity);
    }
    return null;
  }
  
  protected zzff zzJ(IBinder paramIBinder)
  {
    return zzff.zza.zzL(paramIBinder);
  }
  
  private static final class zza
    extends Exception
  {
    public zza(String paramString)
    {
      super();
    }
  }
}
