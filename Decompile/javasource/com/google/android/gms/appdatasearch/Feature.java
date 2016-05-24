package com.google.android.gms.appdatasearch;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class Feature
  implements SafeParcelable
{
  public static final zze CREATOR = new zze();
  public final int id;
  final int mVersionCode;
  final Bundle zzPi;
  
  Feature(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    mVersionCode = paramInt1;
    id = paramInt2;
    zzPi = paramBundle;
  }
  
  public int describeContents()
  {
    zze localZze = CREATOR;
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze localZze = CREATOR;
    zze.zza(this, paramParcel, paramInt);
  }
}
