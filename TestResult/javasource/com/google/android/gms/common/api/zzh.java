package com.google.android.gms.common.api;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Queue;

public class zzh
  implements zzj
{
  private final zzi zzZq;
  
  public zzh(zzi paramZzi)
  {
    zzZq = paramZzi;
  }
  
  public void begin()
  {
    zzZq.zzny();
    zzZq.zzaah = Collections.emptySet();
  }
  
  public void connect()
  {
    zzZq.zznz();
  }
  
  public void disconnect()
  {
    Iterator localIterator = zzZq.zzZZ.iterator();
    while (localIterator.hasNext()) {
      ((zzi.zze)localIterator.next()).cancel();
    }
    zzZq.zzZZ.clear();
    zzZq.zzaag.clear();
    zzZq.zznx();
  }
  
  public String getName()
  {
    return "DISCONNECTED";
  }
  
  public void onConnected(Bundle paramBundle) {}
  
  public void onConnectionSuspended(int paramInt) {}
  
  public <A extends Api.zzb, R extends Result, T extends zzc.zza<R, A>> T zza(T paramT)
  {
    zzZq.zzZZ.add(paramT);
    return paramT;
  }
  
  public void zza(ConnectionResult paramConnectionResult, Api<?> paramApi, int paramInt) {}
}
