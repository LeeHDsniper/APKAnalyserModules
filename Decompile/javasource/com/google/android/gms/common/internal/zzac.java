package com.google.android.gms.common.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import com.google.android.gms.common.api.Api.zzd;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;

public class zzac<T extends IInterface>
  extends zzj<T>
{
  private final Api.zzd<T> zzaep;
  
  public zzac(Context paramContext, Looper paramLooper, int paramInt, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, zzf paramZzf, Api.zzd paramZzd)
  {
    super(paramContext, paramLooper, paramInt, paramZzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
    zzaep = paramZzd;
  }
  
  protected T zzV(IBinder paramIBinder)
  {
    return zzaep.zzV(paramIBinder);
  }
  
  protected void zzc(int paramInt, T paramT)
  {
    zzaep.zza(paramInt, paramT);
  }
  
  protected String zzfA()
  {
    return zzaep.zzfA();
  }
  
  protected String zzfB()
  {
    return zzaep.zzfB();
  }
}
