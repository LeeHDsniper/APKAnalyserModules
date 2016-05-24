package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;

@zzgk
public class zzhy
{
  private static zzl zzIf;
  public static final zza<Void> zzIg = new zza()
  {
    public Void zzgA()
    {
      return null;
    }
    
    public Void zzi(InputStream paramAnonymousInputStream)
    {
      return null;
    }
  };
  private static final Object zzpm = new Object();
  
  public zzhy(Context paramContext)
  {
    zzIf = zzP(paramContext);
  }
  
  private static zzl zzP(Context paramContext)
  {
    synchronized (zzpm)
    {
      if (zzIf == null) {
        zzIf = zzac.zza(paramContext.getApplicationContext());
      }
      paramContext = zzIf;
      return paramContext;
    }
  }
  
  public <T> zzih<T> zza(String paramString, zza<T> paramZza)
  {
    zzc localZzc = new zzc(null);
    zzIf.zze(new zzb(paramString, paramZza, localZzc));
    return localZzc;
  }
  
  public zzih<String> zzb(final String paramString, final Map<String, String> paramMap)
  {
    final zzc localZzc = new zzc(null);
    paramString = new zzab(paramString, localZzc, new zzm.zza()
    {
      public void zze(zzr paramAnonymousZzr)
      {
        zzb.zzaE("Failed to load URL: " + paramString + "\n" + paramAnonymousZzr.toString());
        localZzc.zzb(null);
      }
    })
    {
      public Map<String, String> getHeaders()
        throws zza
      {
        if (paramMap == null) {
          return super.getHeaders();
        }
        return paramMap;
      }
    };
    zzIf.zze(paramString);
    return localZzc;
  }
  
  public static abstract interface zza<T>
  {
    public abstract T zzfv();
    
    public abstract T zzh(InputStream paramInputStream);
  }
  
  private static class zzb<T>
    extends zzk<InputStream>
  {
    private final zzhy.zza<T> zzIk;
    private final zzm.zzb<T> zzaG;
    
    public zzb(String paramString, final zzhy.zza<T> paramZza, zzm.zzb<T> paramZzb)
    {
      super(paramString, new zzm.zza()
      {
        public void zze(zzr paramAnonymousZzr)
        {
          zzb(paramZza.zzfv());
        }
      });
      zzIk = paramZza;
      zzaG = paramZzb;
    }
    
    protected zzm<InputStream> zza(zzi paramZzi)
    {
      return zzm.zza(new ByteArrayInputStream(data), zzx.zzb(paramZzi));
    }
    
    protected void zzj(InputStream paramInputStream)
    {
      zzaG.zzb(zzIk.zzh(paramInputStream));
    }
  }
  
  private class zzc<T>
    extends zzie<T>
    implements zzm.zzb<T>
  {
    private zzc() {}
    
    public void zzb(T paramT)
    {
      super.zzf(paramT);
    }
  }
}
