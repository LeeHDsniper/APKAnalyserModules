package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zzb;
import com.google.android.gms.internal.zzaf.zzj;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlo;
import com.google.android.gms.internal.zzqk;
import com.google.android.gms.internal.zzqk.zza;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzqo.zza;
import com.google.android.gms.internal.zzqp.zzc;

public class zzp
  extends zzb<ContainerHolder>
{
  private final Context mContext;
  private final Looper zzYV;
  private final String zzaOS;
  private final TagManager zzaPe;
  private final zzd zzaPh;
  private final zzcd zzaPi;
  private final int zzaPj;
  private zzf zzaPk;
  private zzqk zzaPl;
  private volatile zzo zzaPm;
  private zzaf.zzj zzaPo;
  private String zzaPp;
  private zze zzaPq;
  private final zzlm zzpO;
  
  zzp(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, zzf paramZzf, zze paramZze, zzqk paramZzqk, zzlm paramZzlm, zzcd paramZzcd) {}
  
  public zzp(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, zzs paramZzs)
  {
    this(paramContext, paramTagManager, paramLooper, paramString, paramInt, new zzcn(paramContext, paramString), new zzcm(paramContext, paramString, paramZzs), new zzqk(paramContext), zzlo.zzpN(), new zzbe(30, 900000L, 5000L, "refreshing", zzlo.zzpN()));
    zzaPl.zzfj(paramZzs.zzzN());
  }
  
  /* Error */
  private void zzR(long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 70	com/google/android/gms/tagmanager/zzp:zzaPq	Lcom/google/android/gms/tagmanager/zzp$zze;
    //   6: ifnonnull +11 -> 17
    //   9: ldc -102
    //   11: invokestatic 159	com/google/android/gms/tagmanager/zzbg:zzaE	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: monitorexit
    //   16: return
    //   17: aload_0
    //   18: getfield 70	com/google/android/gms/tagmanager/zzp:zzaPq	Lcom/google/android/gms/tagmanager/zzp$zze;
    //   21: lload_1
    //   22: aload_0
    //   23: getfield 84	com/google/android/gms/tagmanager/zzp:zzaPo	Lcom/google/android/gms/internal/zzaf$zzj;
    //   26: getfield 162	com/google/android/gms/internal/zzaf$zzj:zziS	Ljava/lang/String;
    //   29: invokeinterface 165 4 0
    //   34: goto -20 -> 14
    //   37: astore_3
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_3
    //   41: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	42	0	this	zzp
    //   0	42	1	paramLong	long
    //   37	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	14	37	finally
    //   17	34	37	finally
  }
  
  private boolean zzzK()
  {
    zzcb localZzcb = zzcb.zzAv();
    return ((localZzcb.zzAw() == zzcb.zza.zzaRd) || (localZzcb.zzAw() == zzcb.zza.zzaRe)) && (zzaOS.equals(localZzcb.getContainerId()));
  }
  
  public void load(final String paramString)
  {
    if (zzaPj != -1) {}
    for (Integer localInteger = Integer.valueOf(zzaPj);; localInteger = null)
    {
      zzaPl.zza(zzaOS, localInteger, paramString, new zzqk.zza()
      {
        public void zza(zzqo paramAnonymousZzqo)
        {
          if (paramAnonymousZzqo.getStatus() != Status.zzaaD)
          {
            zzbg.e("Load request failed for the container " + zzp.zza(zzp.this));
            zza(zzbg(Status.zzaaF));
            return;
          }
          zzqp.zzc localZzc = paramAnonymousZzqo.zzBw().zzBA();
          if (localZzc == null)
          {
            zzbg.e("Response doesn't have the requested container");
            zza(zzbg(new Status(8, "Response doesn't have the requested container", null)));
            return;
          }
          long l = paramAnonymousZzqo.zzBw().zzBB();
          zzp.zza(zzp.this, new zzo(zzp.zzb(zzp.this), zzp.zzc(zzp.this), new Container(zzp.zzd(zzp.this), zzp.zzb(zzp.this).getDataLayer(), zzp.zza(zzp.this), l, localZzc), new zzo.zza()
          {
            public void zzey(String paramAnonymous2String)
            {
              zzp.this.zzey(paramAnonymous2String);
            }
            
            public String zzzE()
            {
              return zzp.this.zzzE();
            }
            
            public void zzzG()
            {
              if (zzp.zze(zzp.this).zzkp()) {
                load(zzaPs);
              }
            }
          }));
          zza(zzp.zzf(zzp.this));
        }
      });
      return;
    }
  }
  
  protected ContainerHolder zzbg(Status paramStatus)
  {
    if (zzaPm != null) {
      return zzaPm;
    }
    if (paramStatus == Status.zzaaG) {
      zzbg.e("timer expired: setting result to failure");
    }
    return new zzo(paramStatus);
  }
  
  void zzey(String paramString)
  {
    try
    {
      zzaPp = paramString;
      if (zzaPq != null) {
        zzaPq.zzeB(paramString);
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  String zzzE()
  {
    try
    {
      String str = zzaPp;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private class zzd
    implements zzo.zza
  {
    private zzd() {}
    
    public void zzey(String paramString)
    {
      zzp.this.zzey(paramString);
    }
    
    public String zzzE()
    {
      return zzp.this.zzzE();
    }
    
    public void zzzG()
    {
      if (zzp.zze(zzp.this).zzkp()) {
        zzp.zza(zzp.this, 0L);
      }
    }
  }
  
  static abstract interface zze
    extends Releasable
  {
    public abstract void zzeB(String paramString);
    
    public abstract void zzf(long paramLong, String paramString);
  }
  
  static abstract interface zzf
    extends Releasable
  {}
}
