package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.internal.zzbr;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzgl;
import com.google.android.gms.internal.zzgm;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzhq;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhz;
import com.google.android.gms.internal.zzlm;

@zzgk
public abstract class zzd
  extends zzhq
  implements zzc.zza
{
  private AdResponseParcel zzCG;
  private final zzc.zza zzDt;
  private final Object zzpc = new Object();
  private final AdRequestInfoParcel zzyd;
  
  public zzd(AdRequestInfoParcel paramAdRequestInfoParcel, zzc.zza paramZza)
  {
    zzyd = paramAdRequestInfoParcel;
    zzDt = paramZza;
  }
  
  public final void onStop()
  {
    zzfx();
  }
  
  boolean zza(zzj paramZzj, AdRequestInfoParcel paramAdRequestInfoParcel)
  {
    try
    {
      paramZzj.zza(paramAdRequestInfoParcel, new zzg(this));
      return true;
    }
    catch (RemoteException paramZzj)
    {
      zzb.zzd("Could not fetch ad response from ad request service.", paramZzj);
      zzp.zzbA().zzc(paramZzj, true);
      zzDt.zzb(new AdResponseParcel(0));
      return false;
    }
    catch (NullPointerException paramZzj)
    {
      for (;;)
      {
        zzb.zzd("Could not fetch ad response from ad request service due to an Exception.", paramZzj);
        zzp.zzbA().zzc(paramZzj, true);
      }
    }
    catch (SecurityException paramZzj)
    {
      for (;;)
      {
        zzb.zzd("Could not fetch ad response from ad request service due to an Exception.", paramZzj);
        zzp.zzbA().zzc(paramZzj, true);
      }
    }
    catch (Throwable paramZzj)
    {
      for (;;)
      {
        zzb.zzd("Could not fetch ad response from ad request service due to an Exception.", paramZzj);
        zzp.zzbA().zzc(paramZzj, true);
      }
    }
  }
  
  public void zzb(AdResponseParcel paramAdResponseParcel)
  {
    synchronized (zzpc)
    {
      zzCG = paramAdResponseParcel;
      zzpc.notify();
      return;
    }
  }
  
  /* Error */
  public void zzdG()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 99	com/google/android/gms/ads/internal/request/zzd:zzfy	()Lcom/google/android/gms/ads/internal/request/zzj;
    //   4: astore_1
    //   5: aload_1
    //   6: ifnonnull +27 -> 33
    //   9: new 81	com/google/android/gms/ads/internal/request/AdResponseParcel
    //   12: dup
    //   13: iconst_0
    //   14: invokespecial 84	com/google/android/gms/ads/internal/request/AdResponseParcel:<init>	(I)V
    //   17: astore_1
    //   18: aload_0
    //   19: getfield 35	com/google/android/gms/ads/internal/request/zzd:zzDt	Lcom/google/android/gms/ads/internal/request/zzc$zza;
    //   22: aload_1
    //   23: invokeinterface 87 2 0
    //   28: aload_0
    //   29: invokevirtual 40	com/google/android/gms/ads/internal/request/zzd:zzfx	()V
    //   32: return
    //   33: aload_0
    //   34: aload_1
    //   35: aload_0
    //   36: getfield 33	com/google/android/gms/ads/internal/request/zzd:zzyd	Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;
    //   39: invokevirtual 101	com/google/android/gms/ads/internal/request/zzd:zza	(Lcom/google/android/gms/ads/internal/request/zzj;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Z
    //   42: ifeq -14 -> 28
    //   45: aload_0
    //   46: invokestatic 105	com/google/android/gms/ads/internal/zzp:zzbB	()Lcom/google/android/gms/internal/zzlm;
    //   49: invokeinterface 111 1 0
    //   54: invokevirtual 115	com/google/android/gms/ads/internal/request/zzd:zzi	(J)V
    //   57: goto -29 -> 28
    //   60: astore_1
    //   61: aload_0
    //   62: invokevirtual 40	com/google/android/gms/ads/internal/request/zzd:zzfx	()V
    //   65: aload_1
    //   66: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	67	0	this	zzd
    //   4	31	1	localObject1	Object
    //   60	6	1	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   0	5	60	finally
    //   9	28	60	finally
    //   33	57	60	finally
  }
  
  protected boolean zze(long paramLong)
  {
    paramLong = 60000L - (zzp.zzbB().elapsedRealtime() - paramLong);
    if (paramLong <= 0L) {
      return false;
    }
    try
    {
      zzpc.wait(paramLong);
      return true;
    }
    catch (InterruptedException localInterruptedException) {}
    return false;
  }
  
  public abstract void zzfx();
  
  public abstract zzj zzfy();
  
  protected void zzi(long paramLong)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzCG != null)
        {
          zzDt.zzb(zzCG);
          return;
        }
        if (zze(paramLong)) {
          continue;
        }
        if (zzCG != null)
        {
          zzDt.zzb(zzCG);
          return;
        }
      }
      zzDt.zzb(new AdResponseParcel(0));
    }
  }
  
  @zzgk
  public static final class zza
    extends zzd
  {
    private final Context mContext;
    
    public zza(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zzc.zza paramZza)
    {
      super(paramZza);
      mContext = paramContext;
    }
    
    public void zzfx() {}
    
    public zzj zzfy()
    {
      zzbr localZzbr = new zzbr((String)zzby.zztW.get());
      return zzgm.zza(mContext, localZzbr, zzgl.zzfG());
    }
  }
  
  @zzgk
  public static class zzb
    extends zzd
    implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
  {
    private Context mContext;
    private final zzc.zza zzDt;
    protected zze zzDu;
    private boolean zzDv;
    private final Object zzpc = new Object();
    private AdRequestInfoParcel zzyd;
    
    public zzb(Context paramContext, AdRequestInfoParcel paramAdRequestInfoParcel, zzc.zza paramZza)
    {
      super(paramZza);
      mContext = paramContext;
      zzyd = paramAdRequestInfoParcel;
      zzDt = paramZza;
      if (((Boolean)zzby.zzuv.get()).booleanValue()) {
        zzDv = true;
      }
      for (paramZza = zzp.zzbI().zzgB();; paramZza = paramContext.getMainLooper())
      {
        zzDu = new zze(paramContext, paramZza, this, this, zzqb.zzIB);
        connect();
        return;
      }
    }
    
    protected void connect()
    {
      zzDu.zzox();
    }
    
    public void onConnected(Bundle paramBundle)
    {
      zzgn();
    }
    
    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      zzb.zzaC("Cannot connect to remote service, fallback to local instance.");
      zzfz().zzgn();
      paramConnectionResult = new Bundle();
      paramConnectionResult.putString("action", "gms_connection_failed_fallback_to_local");
      zzp.zzbx().zzb(mContext, zzyd.zzqb.zzIz, "gmob-apps", paramConnectionResult, true);
    }
    
    public void onConnectionSuspended(int paramInt)
    {
      zzb.zzaC("Disconnected from remote ad request service.");
    }
    
    public void zzfx()
    {
      synchronized (zzpc)
      {
        if ((zzDu.isConnected()) || (zzDu.isConnecting())) {
          zzDu.disconnect();
        }
        Binder.flushPendingCommands();
        if (zzDv)
        {
          zzp.zzbI().zzgC();
          zzDv = false;
        }
        return;
      }
    }
    
    /* Error */
    public zzj zzfy()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 34	com/google/android/gms/ads/internal/request/zzd$zzb:zzpc	Ljava/lang/Object;
      //   4: astore_1
      //   5: aload_1
      //   6: monitorenter
      //   7: aload_0
      //   8: getfield 91	com/google/android/gms/ads/internal/request/zzd$zzb:zzDu	Lcom/google/android/gms/ads/internal/request/zze;
      //   11: invokevirtual 183	com/google/android/gms/ads/internal/request/zze:zzfC	()Lcom/google/android/gms/ads/internal/request/zzj;
      //   14: astore_2
      //   15: aload_1
      //   16: monitorexit
      //   17: aload_2
      //   18: areturn
      //   19: aload_1
      //   20: monitorexit
      //   21: aconst_null
      //   22: areturn
      //   23: astore_2
      //   24: aload_1
      //   25: monitorexit
      //   26: aload_2
      //   27: athrow
      //   28: astore_2
      //   29: goto -10 -> 19
      //   32: astore_2
      //   33: goto -14 -> 19
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	36	0	this	zzb
      //   14	4	2	localZzj	zzj
      //   23	4	2	localObject2	Object
      //   28	1	2	localDeadObjectException	android.os.DeadObjectException
      //   32	1	2	localIllegalStateException	IllegalStateException
      // Exception table:
      //   from	to	target	type
      //   7	15	23	finally
      //   15	17	23	finally
      //   19	21	23	finally
      //   24	26	23	finally
      //   7	15	28	android/os/DeadObjectException
      //   7	15	32	java/lang/IllegalStateException
    }
    
    zzhq zzfz()
    {
      return new zzd.zza(mContext, zzyd, zzDt);
    }
  }
}
