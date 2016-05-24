package com.google.android.gms.common.api;

import android.os.Bundle;
import android.os.DeadObjectException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzk;
import java.util.Iterator;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

public class zzf
  implements zzj
{
  private final zzi zzZq;
  
  public zzf(zzi paramZzi)
  {
    zzZq = paramZzi;
  }
  
  private <A extends Api.zzb> void zza(zzi.zze<A> paramZze)
    throws DeadObjectException
  {
    zzZq.zzb(paramZze);
    Api.zzb localZzb = zzZq.zza(paramZze.zznd());
    if ((!localZzb.isConnected()) && (zzZq.zzaag.containsKey(paramZze.zznd())))
    {
      paramZze.zzx(new Status(17));
      return;
    }
    paramZze.zzb(localZzb);
  }
  
  public void begin()
  {
    while (!zzZq.zzZZ.isEmpty()) {
      try
      {
        zza((zzi.zze)zzZq.zzZZ.remove());
      }
      catch (DeadObjectException localDeadObjectException)
      {
        Log.w("GoogleApiClientConnected", "Service died while flushing queue", localDeadObjectException);
      }
    }
  }
  
  public void connect() {}
  
  public void disconnect()
  {
    zzZq.zzaag.clear();
    zzZq.zznx();
    zzZq.zzg(null);
    zzZq.zzZY.zzoI();
  }
  
  public String getName()
  {
    return "CONNECTED";
  }
  
  public void onConnected(Bundle paramBundle) {}
  
  public void onConnectionSuspended(int paramInt)
  {
    if (paramInt == 1) {
      zzZq.zznD();
    }
    Iterator localIterator = zzZq.zzaal.iterator();
    while (localIterator.hasNext()) {
      ((zzi.zze)localIterator.next()).zzw(new Status(8, "The connection to Google Play services was lost"));
    }
    zzZq.zzg(null);
    zzZq.zzZY.zzbB(paramInt);
    zzZq.zzZY.zzoI();
    if (paramInt == 2) {
      zzZq.connect();
    }
  }
  
  public <A extends Api.zzb, R extends Result, T extends zzc.zza<R, A>> T zza(T paramT)
  {
    return zzb(paramT);
  }
  
  public void zza(ConnectionResult paramConnectionResult, Api<?> paramApi, int paramInt) {}
  
  public <A extends Api.zzb, T extends zzc.zza<? extends Result, A>> T zzb(T paramT)
  {
    try
    {
      zza(paramT);
      return paramT;
    }
    catch (DeadObjectException localDeadObjectException)
    {
      zzZq.zza(new zzi.zzb(this)
      {
        public void zznn()
        {
          onConnectionSuspended(1);
        }
      });
    }
    return paramT;
  }
}
