package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Set;

public class AuthAccountRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<AuthAccountRequest> CREATOR = new zzc();
  final int mVersionCode;
  final IBinder zzacC;
  final Scope[] zzacD;
  
  AuthAccountRequest(int paramInt, IBinder paramIBinder, Scope[] paramArrayOfScope)
  {
    mVersionCode = paramInt;
    zzacC = paramIBinder;
    zzacD = paramArrayOfScope;
  }
  
  public AuthAccountRequest(zzp paramZzp, Set<Scope> paramSet)
  {
    this(1, paramZzp.asBinder(), (Scope[])paramSet.toArray(new Scope[paramSet.size()]));
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}
