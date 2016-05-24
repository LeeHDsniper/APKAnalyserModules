package com.google.android.gms.common.api;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import java.util.concurrent.atomic.AtomicReference;

public class zzc
{
  public static abstract class zza<R extends Result, A extends Api.zzb>
    extends zza<R>
    implements zzc.zzb<R>, zzi.zze<A>
  {
    private final Api.zzc<A> zzXW;
    private AtomicReference<zzi.zzd> zzYO = new AtomicReference();
    
    protected zza(Api.zzc<A> paramZzc, GoogleApiClient paramGoogleApiClient)
    {
      super();
      zzXW = ((Api.zzc)zzx.zzv(paramZzc));
    }
    
    private void zza(RemoteException paramRemoteException)
    {
      zzx(new Status(8, paramRemoteException.getLocalizedMessage(), null));
    }
    
    protected abstract void zza(A paramA)
      throws RemoteException;
    
    public void zza(zzi.zzd paramZzd)
    {
      zzYO.set(paramZzd);
    }
    
    public final void zzb(A paramA)
      throws DeadObjectException
    {
      try
      {
        zza(paramA);
        return;
      }
      catch (DeadObjectException paramA)
      {
        zza(paramA);
        throw paramA;
      }
      catch (RemoteException paramA)
      {
        zza(paramA);
      }
    }
    
    protected void zzmZ()
    {
      zzi.zzd localZzd = (zzi.zzd)zzYO.getAndSet(null);
      if (localZzd != null) {
        localZzd.zzc(this);
      }
    }
    
    public final Api.zzc<A> zznd()
    {
      return zzXW;
    }
    
    public int zzng()
    {
      return 0;
    }
    
    public final void zzx(Status paramStatus)
    {
      if (!paramStatus.isSuccess()) {}
      for (boolean bool = true;; bool = false)
      {
        zzx.zzb(bool, "Failed result must not be success");
        zza(zzb(paramStatus));
        return;
      }
    }
  }
  
  public static abstract interface zzb<R>
  {
    public abstract void zzn(R paramR);
  }
}
