package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzx;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

@zzgk
public class zzdv
{
  private final Context mContext;
  private final VersionInfoParcel zzpa;
  private final Object zzpc = new Object();
  private final String zzxF;
  private zzb<zzbb> zzxG;
  private zzb<zzbb> zzxH;
  private zze zzxI;
  private int zzxJ = 1;
  
  public zzdv(Context paramContext, VersionInfoParcel paramVersionInfoParcel, String paramString)
  {
    zzxF = paramString;
    mContext = paramContext.getApplicationContext();
    zzpa = paramVersionInfoParcel;
    zzxG = new zzc();
    zzxH = new zzc();
  }
  
  public zzdv(Context paramContext, VersionInfoParcel paramVersionInfoParcel, String paramString, zzb<zzbb> paramZzb1, zzb<zzbb> paramZzb2)
  {
    this(paramContext, paramVersionInfoParcel, paramString);
    zzxG = paramZzb1;
    zzxH = paramZzb2;
  }
  
  private zze zzdJ()
  {
    final zze localZze = new zze(zzxH);
    zzhu.runOnUiThread(new Runnable()
    {
      public void run()
      {
        final zzbb localZzbb = zza(zzdv.zza(zzdv.this), zzdv.zzb(zzdv.this));
        localZzbb.zza(new zzbb.zza()
        {
          public void zzcj()
          {
            new Timer().schedule(new TimerTask()
            {
              public void run()
              {
                synchronized (zzdv.zzc(zzdv.this))
                {
                  if ((zzxK.getStatus() == -1) || (zzxK.getStatus() == 1)) {
                    return;
                  }
                  zzxK.reject();
                  zzhu.runOnUiThread(new Runnable()
                  {
                    public void run()
                    {
                      zzxM.destroy();
                    }
                  });
                  zzb.v("Could not receive loaded message in a timely manner. Rejecting.");
                  return;
                }
              }
            }, zzdv.zza.zzxU);
          }
        });
        localZzbb.zza("/jsLoaded", new zzdg()
        {
          public void zza(zzip arg1, Map<String, String> paramAnonymous2Map)
          {
            synchronized (zzdv.zzc(zzdv.this))
            {
              if ((zzxK.getStatus() == -1) || (zzxK.getStatus() == 1)) {
                return;
              }
              zzdv.zza(zzdv.this, 0);
              zzdv.zzd(zzdv.this).zzc(localZzbb);
              zzxK.zzg(localZzbb);
              zzdv.zza(zzdv.this, zzxK);
              zzb.v("Successfully loaded JS Engine.");
              return;
            }
          }
        });
        final zzic localZzic = new zzic();
        zzdg local3 = new zzdg()
        {
          public void zza(zzip arg1, Map<String, String> paramAnonymous2Map)
          {
            synchronized (zzdv.zzc(zzdv.this))
            {
              zzb.zzaD("JS Engine is requesting an update");
              if (zzdv.zze(zzdv.this) == 0)
              {
                zzb.zzaD("Starting reload.");
                zzdv.zza(zzdv.this, 2);
                zzdK();
              }
              localZzbb.zzb("/requestReload", (zzdg)localZzic.get());
              return;
            }
          }
        };
        localZzic.set(local3);
        localZzbb.zza("/requestReload", local3);
        if (zzdv.zzf(zzdv.this).endsWith(".js")) {
          localZzbb.zzs(zzdv.zzf(zzdv.this));
        }
        for (;;)
        {
          new Timer().schedule(new TimerTask()
          {
            public void run()
            {
              synchronized (zzdv.zzc(zzdv.this))
              {
                if ((zzxK.getStatus() == -1) || (zzxK.getStatus() == 1)) {
                  return;
                }
                zzxK.reject();
                zzhu.runOnUiThread(new Runnable()
                {
                  public void run()
                  {
                    zzxM.destroy();
                  }
                });
                zzb.v("Could not receive loaded message in a timely manner. Rejecting.");
                return;
              }
            }
          }, zzdv.zza.zzxT);
          return;
          if (zzdv.zzf(zzdv.this).startsWith("<html>")) {
            localZzbb.zzu(zzdv.zzf(zzdv.this));
          } else {
            localZzbb.zzt(zzdv.zzf(zzdv.this));
          }
        }
      }
    });
    return localZze;
  }
  
  protected zzbb zza(Context paramContext, VersionInfoParcel paramVersionInfoParcel)
  {
    return new zzbd(paramContext, paramVersionInfoParcel, null);
  }
  
  protected zze zzdK()
  {
    final zze localZze = zzdJ();
    localZze.zza(new zzij.zzc()new zzij.zza
    {
      public void zza(zzbb arg1)
      {
        synchronized (zzdv.zzc(zzdv.this))
        {
          zzdv.zza(zzdv.this, 0);
          if ((zzdv.zzg(zzdv.this) != null) && (localZze != zzdv.zzg(zzdv.this)))
          {
            zzb.v("New JS engine is loaded, marking previous one as destroyable.");
            zzdv.zzg(zzdv.this).zzdO();
          }
          zzdv.zza(zzdv.this, localZze);
          return;
        }
      }
    }, new zzij.zza()
    {
      public void run()
      {
        synchronized (zzdv.zzc(zzdv.this))
        {
          zzdv.zza(zzdv.this, 1);
          zzb.v("Failed loading new engine. Marking new engine destroyable.");
          localZze.zzdO();
          return;
        }
      }
    });
    return localZze;
  }
  
  public zzd zzdL()
  {
    synchronized (zzpc)
    {
      zzd localZzd1;
      if ((zzxI == null) || (zzxI.getStatus() == -1))
      {
        zzxJ = 2;
        zzxI = zzdK();
        localZzd1 = zzxI.zzdM();
        return localZzd1;
      }
      if (zzxJ == 0)
      {
        localZzd1 = zzxI.zzdM();
        return localZzd1;
      }
    }
    if (zzxJ == 1)
    {
      zzxJ = 2;
      zzdK();
      localZzd2 = zzxI.zzdM();
      return localZzd2;
    }
    if (zzxJ == 2)
    {
      localZzd2 = zzxI.zzdM();
      return localZzd2;
    }
    zzd localZzd2 = zzxI.zzdM();
    return localZzd2;
  }
  
  static class zza
  {
    static int zzxT = 60000;
    static int zzxU = 10000;
  }
  
  public static abstract interface zzb<T>
  {
    public abstract void zzc(T paramT);
  }
  
  public static class zzc<T>
    implements zzdv.zzb<T>
  {
    public zzc() {}
    
    public void zzc(T paramT) {}
  }
  
  public static class zzd
    extends zzik<zzbe>
  {
    private final Object zzpc = new Object();
    private final zzdv.zze zzxV;
    private boolean zzxW;
    
    public zzd(zzdv.zze paramZze)
    {
      zzxV = paramZze;
    }
    
    public void release()
    {
      synchronized (zzpc)
      {
        if (zzxW) {
          return;
        }
        zzxW = true;
        zza(new zzij.zzc()new zzij.zzb
        {
          public void zzb(zzbe paramAnonymousZzbe)
          {
            zzb.v("Ending javascript session.");
            ((zzbf)paramAnonymousZzbe).zzck();
          }
        }, new zzij.zzb());
        zza(new zzij.zzc()new zzij.zza
        {
          public void zzb(zzbe paramAnonymousZzbe)
          {
            zzb.v("Releasing engine reference.");
            zzdv.zzd.zza(zzdv.zzd.this).zzdN();
          }
        }, new zzij.zza()
        {
          public void run()
          {
            zzdv.zzd.zza(zzdv.zzd.this).zzdN();
          }
        });
        return;
      }
    }
  }
  
  public static class zze
    extends zzik<zzbb>
  {
    private final Object zzpc = new Object();
    private zzdv.zzb<zzbb> zzxH;
    private boolean zzxY;
    private int zzxZ;
    
    public zze(zzdv.zzb<zzbb> paramZzb)
    {
      zzxH = paramZzb;
      zzxY = false;
      zzxZ = 0;
    }
    
    public zzdv.zzd zzdM()
    {
      final zzdv.zzd localZzd = new zzdv.zzd(this);
      for (;;)
      {
        synchronized (zzpc)
        {
          zza(new zzij.zzc()new zzij.zza
          {
            public void zza(zzbb paramAnonymousZzbb)
            {
              zzb.v("Getting a new session for JS Engine.");
              localZzd.zzg(paramAnonymousZzbb.zzci());
            }
          }, new zzij.zza()
          {
            public void run()
            {
              zzb.v("Rejecting reference for JS Engine.");
              localZzd.reject();
            }
          });
          if (zzxZ >= 0)
          {
            bool = true;
            zzx.zzY(bool);
            zzxZ += 1;
            return localZzd;
          }
        }
        boolean bool = false;
      }
    }
    
    protected void zzdN()
    {
      for (boolean bool = true;; bool = false) {
        synchronized (zzpc)
        {
          if (zzxZ >= 1)
          {
            zzx.zzY(bool);
            zzb.v("Releasing 1 reference for JS Engine");
            zzxZ -= 1;
            zzdP();
            return;
          }
        }
      }
    }
    
    public void zzdO()
    {
      for (boolean bool = true;; bool = false) {
        synchronized (zzpc)
        {
          if (zzxZ >= 0)
          {
            zzx.zzY(bool);
            zzb.v("Releasing root reference. JS Engine will be destroyed once other references are released.");
            zzxY = true;
            zzdP();
            return;
          }
        }
      }
    }
    
    protected void zzdP()
    {
      for (;;)
      {
        synchronized (zzpc)
        {
          if (zzxZ >= 0)
          {
            bool = true;
            zzx.zzY(bool);
            if ((zzxY) && (zzxZ == 0))
            {
              zzb.v("No reference is left (including root). Cleaning up engine.");
              zza(new zzij.zzc()new zzij.zzb
              {
                public void zza(final zzbb paramAnonymousZzbb)
                {
                  zzhu.runOnUiThread(new Runnable()
                  {
                    public void run()
                    {
                      zzdv.zze.zza(zzdv.zze.this).zzc(paramAnonymousZzbb);
                      paramAnonymousZzbb.destroy();
                    }
                  });
                }
              }, new zzij.zzb());
              return;
            }
            zzb.v("There are still references to the engine. Not destroying.");
          }
        }
        boolean bool = false;
      }
    }
  }
}
