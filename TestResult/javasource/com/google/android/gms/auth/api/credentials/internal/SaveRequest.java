package com.google.android.gms.auth.api.credentials.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.auth.api.credentials.Credential;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class SaveRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<SaveRequest> CREATOR = new zzi();
  final int mVersionCode;
  private final Credential zzRx;
  
  SaveRequest(int paramInt, Credential paramCredential)
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
    zzi.zza(this, paramParcel, paramInt);
  }
}
