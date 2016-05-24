package com.google.android.gms.common.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ValidateAccountRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<ValidateAccountRequest> CREATOR = new zzad();
  final int mVersionCode;
  final IBinder zzacC;
  private final Scope[] zzacD;
  private final int zzaeq;
  private final Bundle zzaer;
  private final String zzaes;
  
  ValidateAccountRequest(int paramInt1, int paramInt2, IBinder paramIBinder, Scope[] paramArrayOfScope, Bundle paramBundle, String paramString)
  {
    mVersionCode = paramInt1;
    zzaeq = paramInt2;
    zzacC = paramIBinder;
    zzacD = paramArrayOfScope;
    zzaer = paramBundle;
    zzaes = paramString;
  }
  
  public ValidateAccountRequest(zzp paramZzp, Scope[] paramArrayOfScope, String paramString, Bundle paramBundle) {}
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getCallingPackage()
  {
    return zzaes;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzad.zza(this, paramParcel, paramInt);
  }
  
  public int zzoS()
  {
    return zzaeq;
  }
  
  public Scope[] zzoT()
  {
    return zzacD;
  }
  
  public Bundle zzoU()
  {
    return zzaer;
  }
}
