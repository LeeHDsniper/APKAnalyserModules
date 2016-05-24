package com.google.android.gms.ads.internal;

import android.os.Handler;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhu;
import java.lang.ref.WeakReference;

@zzgk
public class zzo
{
  private boolean zzpA = false;
  private boolean zzpB = false;
  private long zzpC = 0L;
  private final zza zzpy;
  private AdRequestParcel zzpz;
  private final Runnable zzx;
  
  public zzo(zza paramZza)
  {
    this(paramZza, new zza(zzhu.zzHK));
  }
  
  zzo(zza paramZza, zza paramZza1)
  {
    zzpy = paramZza1;
    zzx = new Runnable()
    {
      public void run()
      {
        zzo.zza(zzo.this, false);
        zza localZza = (zza)zzpD.get();
        if (localZza != null) {
          localZza.zzc(zzo.zza(zzo.this));
        }
      }
    };
  }
  
  public void cancel()
  {
    zzpA = false;
    zzpy.removeCallbacks(zzx);
  }
  
  public void pause()
  {
    zzpB = true;
    if (zzpA) {
      zzpy.removeCallbacks(zzx);
    }
  }
  
  public void resume()
  {
    zzpB = false;
    if (zzpA)
    {
      zzpA = false;
      zza(zzpz, zzpC);
    }
  }
  
  public void zza(AdRequestParcel paramAdRequestParcel, long paramLong)
  {
    if (zzpA) {
      zzb.zzaE("An ad refresh is already scheduled.");
    }
    do
    {
      return;
      zzpz = paramAdRequestParcel;
      zzpA = true;
      zzpC = paramLong;
    } while (zzpB);
    zzb.zzaD("Scheduling ad refresh " + paramLong + " milliseconds from now.");
    zzpy.postDelayed(zzx, paramLong);
  }
  
  public boolean zzbr()
  {
    return zzpA;
  }
  
  public void zzf(AdRequestParcel paramAdRequestParcel)
  {
    zza(paramAdRequestParcel, 60000L);
  }
  
  public static class zza
  {
    private final Handler mHandler;
    
    public zza(Handler paramHandler)
    {
      mHandler = paramHandler;
    }
    
    public boolean postDelayed(Runnable paramRunnable, long paramLong)
    {
      return mHandler.postDelayed(paramRunnable, paramLong);
    }
    
    public void removeCallbacks(Runnable paramRunnable)
    {
      mHandler.removeCallbacks(paramRunnable);
    }
  }
}
