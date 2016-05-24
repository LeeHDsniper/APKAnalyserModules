package com.google.android.gms.ads.internal.client;

import com.google.android.gms.ads.internal.reward.client.zzf;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.internal.zzcx;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zzk
{
  private static final Object zzpm = new Object();
  private static zzk zzsM;
  private final zza zzsN = new zza();
  private final zze zzsO = new zze();
  private final zzl zzsP = new zzl();
  private final zzac zzsQ = new zzac();
  private final zzcx zzsR = new zzcx();
  private final zzf zzsS = new zzf();
  
  static
  {
    zza(new zzk());
  }
  
  protected zzk() {}
  
  protected static void zza(zzk paramZzk)
  {
    synchronized (zzpm)
    {
      zzsM = paramZzk;
      return;
    }
  }
  
  private static zzk zzcD()
  {
    synchronized (zzpm)
    {
      zzk localZzk = zzsM;
      return localZzk;
    }
  }
  
  public static zza zzcE()
  {
    return zzcDzzsN;
  }
  
  public static zze zzcF()
  {
    return zzcDzzsO;
  }
  
  public static zzl zzcG()
  {
    return zzcDzzsP;
  }
  
  public static zzac zzcH()
  {
    return zzcDzzsQ;
  }
  
  public static zzcx zzcI()
  {
    return zzcDzzsR;
  }
  
  public static zzf zzcJ()
  {
    return zzcDzzsS;
  }
}
