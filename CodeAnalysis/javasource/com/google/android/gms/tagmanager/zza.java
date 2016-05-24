package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Process;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlo;
import java.io.IOException;

public class zza
{
  private static Object zzaOF = new Object();
  private static zza zzaOG;
  private volatile boolean mClosed = false;
  private final Context mContext;
  private final Thread zzHt;
  private volatile AdvertisingIdClient.Info zzLl;
  private volatile long zzaOB = 900000L;
  private volatile long zzaOC = 30000L;
  private volatile long zzaOD;
  private zza zzaOE = new zza()
  {
    public AdvertisingIdClient.Info zzzw()
    {
      try
      {
        AdvertisingIdClient.Info localInfo = AdvertisingIdClient.getAdvertisingIdInfo(zza.zza(zza.this));
        return localInfo;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        zzbg.zzaE("IllegalStateException getting Advertising Id Info");
        return null;
      }
      catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
      {
        zzbg.zzaE("GooglePlayServicesRepairableException getting Advertising Id Info");
        return null;
      }
      catch (IOException localIOException)
      {
        zzbg.zzaE("IOException getting Ad Id Info");
        return null;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
        zzbg.zzaE("GooglePlayServicesNotAvailableException getting Advertising Id Info");
        return null;
      }
      catch (Exception localException)
      {
        zzbg.zzaE("Unknown exception. Could not get the Advertising Id Info.");
      }
      return null;
    }
  };
  private final zzlm zzpO;
  
  private zza(Context paramContext)
  {
    this(paramContext, null, zzlo.zzpN());
  }
  
  public zza(Context paramContext, zza paramZza, zzlm paramZzlm)
  {
    zzpO = paramZzlm;
    if (paramContext != null) {}
    for (mContext = paramContext.getApplicationContext();; mContext = paramContext)
    {
      if (paramZza != null) {
        zzaOE = paramZza;
      }
      zzHt = new Thread(new Runnable()
      {
        public void run()
        {
          zza.zzb(zza.this);
        }
      });
      return;
    }
  }
  
  public static zza zzaL(Context paramContext)
  {
    if (zzaOG == null) {}
    synchronized (zzaOF)
    {
      if (zzaOG == null)
      {
        zzaOG = new zza(paramContext);
        zzaOG.start();
      }
      return zzaOG;
    }
  }
  
  private void zzzu()
  {
    Process.setThreadPriority(10);
    while (!mClosed) {
      try
      {
        zzLl = zzaOE.zzzw();
        Thread.sleep(zzaOB);
      }
      catch (InterruptedException localInterruptedException)
      {
        zzbg.zzaD("sleep interrupted in AdvertiserDataPoller thread; continuing");
      }
    }
  }
  
  private void zzzv()
  {
    if (zzpO.currentTimeMillis() - zzaOD < zzaOC) {
      return;
    }
    interrupt();
    zzaOD = zzpO.currentTimeMillis();
  }
  
  public void interrupt()
  {
    zzHt.interrupt();
  }
  
  public boolean isLimitAdTrackingEnabled()
  {
    zzzv();
    if (zzLl == null) {
      return true;
    }
    return zzLl.isLimitAdTrackingEnabled();
  }
  
  public void start()
  {
    zzHt.start();
  }
  
  public String zzzt()
  {
    zzzv();
    if (zzLl == null) {
      return null;
    }
    return zzLl.getId();
  }
  
  public static abstract interface zza
  {
    public abstract AdvertisingIdClient.Info zzzw();
  }
}
