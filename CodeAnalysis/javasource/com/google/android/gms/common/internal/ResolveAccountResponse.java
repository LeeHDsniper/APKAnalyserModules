package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ResolveAccountResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<ResolveAccountResponse> CREATOR = new zzz();
  final int mVersionCode;
  private boolean zzZF;
  private ConnectionResult zzaaV;
  IBinder zzacC;
  private boolean zzaen;
  
  public ResolveAccountResponse(int paramInt)
  {
    this(new ConnectionResult(paramInt, null));
  }
  
  ResolveAccountResponse(int paramInt, IBinder paramIBinder, ConnectionResult paramConnectionResult, boolean paramBoolean1, boolean paramBoolean2)
  {
    mVersionCode = paramInt;
    zzacC = paramIBinder;
    zzaaV = paramConnectionResult;
    zzZF = paramBoolean1;
    zzaen = paramBoolean2;
  }
  
  public ResolveAccountResponse(ConnectionResult paramConnectionResult)
  {
    this(1, null, paramConnectionResult, false, false);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof ResolveAccountResponse)) {
        return false;
      }
      paramObject = (ResolveAccountResponse)paramObject;
    } while ((zzaaV.equals(zzaaV)) && (zzoO().equals(paramObject.zzoO())));
    return false;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzz.zza(this, paramParcel, paramInt);
  }
  
  public zzp zzoO()
  {
    return zzp.zza.zzaH(zzacC);
  }
  
  public ConnectionResult zzoP()
  {
    return zzaaV;
  }
  
  public boolean zzoQ()
  {
    return zzZF;
  }
  
  public boolean zzoR()
  {
    return zzaen;
  }
}
