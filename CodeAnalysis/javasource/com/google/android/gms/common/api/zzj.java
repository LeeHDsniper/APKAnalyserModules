package com.google.android.gms.common.api;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;

public abstract interface zzj
{
  public abstract void begin();
  
  public abstract void connect();
  
  public abstract void disconnect();
  
  public abstract String getName();
  
  public abstract void onConnected(Bundle paramBundle);
  
  public abstract void onConnectionSuspended(int paramInt);
  
  public abstract <A extends Api.zzb, R extends Result, T extends zzc.zza<R, A>> T zza(T paramT);
  
  public abstract void zza(ConnectionResult paramConnectionResult, Api<?> paramApi, int paramInt);
}
