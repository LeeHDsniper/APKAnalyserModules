package com.google.android.gms.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzj;

public class zzjf
  extends zzj<zzjc>
{
  public zzjf(Context paramContext, Looper paramLooper, zzf paramZzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 19, paramZzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }
  
  protected zzjc zzah(IBinder paramIBinder)
  {
    return zzjc.zza.zzaf(paramIBinder);
  }
  
  protected String zzfA()
  {
    return "com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE";
  }
  
  protected String zzfB()
  {
    return "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch";
  }
  
  public zzjc zzlg()
    throws DeadObjectException
  {
    return (zzjc)zzoA();
  }
}
