package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.dynamic.zzg.zza;

@zzgk
public final class zzfs
  extends zzg<zzfo>
{
  private static final zzfs zzCo = new zzfs();
  
  private zzfs()
  {
    super("com.google.android.gms.ads.InAppPurchaseManagerCreatorImpl");
  }
  
  private static boolean zzc(Activity paramActivity)
    throws zzfs.zza
  {
    paramActivity = paramActivity.getIntent();
    if (!paramActivity.hasExtra("com.google.android.gms.ads.internal.purchase.useClientJar")) {
      throw new zza("InAppPurchaseManager requires the useClientJar flag in intent extras.");
    }
    return paramActivity.getBooleanExtra("com.google.android.gms.ads.internal.purchase.useClientJar", false);
  }
  
  public static zzfn zze(Activity paramActivity)
  {
    try
    {
      if (zzc(paramActivity))
      {
        zzb.zzaC("Using AdOverlay from the client jar.");
        return new com.google.android.gms.ads.internal.purchase.zze(paramActivity);
      }
      paramActivity = zzCo.zzf(paramActivity);
      return paramActivity;
    }
    catch (zza paramActivity)
    {
      zzb.zzaE(paramActivity.getMessage());
    }
    return null;
  }
  
  private zzfn zzf(Activity paramActivity)
  {
    try
    {
      zzd localZzd = com.google.android.gms.dynamic.zze.zzx(paramActivity);
      paramActivity = zzfn.zza.zzP(((zzfo)zzar(paramActivity)).zzf(localZzd));
      return paramActivity;
    }
    catch (RemoteException paramActivity)
    {
      zzb.zzd("Could not create remote InAppPurchaseManager.", paramActivity);
      return null;
    }
    catch (zzg.zza paramActivity)
    {
      zzb.zzd("Could not create remote InAppPurchaseManager.", paramActivity);
    }
    return null;
  }
  
  protected zzfo zzT(IBinder paramIBinder)
  {
    return zzfo.zza.zzQ(paramIBinder);
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
