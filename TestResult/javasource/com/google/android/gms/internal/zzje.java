package com.google.android.gms.internal;

import android.os.ParcelFileDescriptor;
import com.google.android.gms.appdatasearch.GetRecentContextCall.Response;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zzc.zzb;

public abstract class zzje<T>
  extends zzjd.zza
{
  protected zzc.zzb<T> zzPW;
  
  public zzje(zzc.zzb<T> paramZzb)
  {
    zzPW = paramZzb;
  }
  
  public void zza(GetRecentContextCall.Response paramResponse) {}
  
  public void zza(Status paramStatus, ParcelFileDescriptor paramParcelFileDescriptor) {}
  
  public void zza(Status paramStatus, boolean paramBoolean) {}
  
  public void zzc(Status paramStatus) {}
}
