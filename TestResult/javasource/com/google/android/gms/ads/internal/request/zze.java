package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzgk;

@zzgk
public class zze
  extends com.google.android.gms.common.internal.zzj<zzj>
{
  final int zzDw;
  
  public zze(Context paramContext, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, int paramInt)
  {
    super(paramContext, paramLooper, 8, zzf.zzaj(paramContext), paramConnectionCallbacks, paramOnConnectionFailedListener);
    zzDw = paramInt;
  }
  
  protected zzj zzU(IBinder paramIBinder)
  {
    return zzj.zza.zzW(paramIBinder);
  }
  
  protected String zzfA()
  {
    return "com.google.android.gms.ads.service.START";
  }
  
  protected String zzfB()
  {
    return "com.google.android.gms.ads.internal.request.IAdRequestService";
  }
  
  public zzj zzfC()
    throws DeadObjectException
  {
    return (zzj)super.zzoA();
  }
}
