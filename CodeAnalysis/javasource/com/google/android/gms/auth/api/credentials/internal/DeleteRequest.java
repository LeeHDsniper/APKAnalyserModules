package com.google.android.gms.auth.api.credentials.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.auth.api.credentials.Credential;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class DeleteRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<DeleteRequest> CREATOR = new zzf();
  final int mVersionCode;
  private final Credential zzRx;
  
  DeleteRequest(int paramInt, Credential paramCredential)
  {
    mVersionCode = paramInt;
    zzRx = paramCredential;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public Credential getCredential()
  {
    return zzRx;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }
}
