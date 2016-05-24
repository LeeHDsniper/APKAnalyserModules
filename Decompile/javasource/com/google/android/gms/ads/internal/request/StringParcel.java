package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class StringParcel
  implements SafeParcelable
{
  public static final Parcelable.Creator<StringParcel> CREATOR = new zzn();
  final int mVersionCode;
  String zzvx;
  
  StringParcel(int paramInt, String paramString)
  {
    mVersionCode = paramInt;
    zzvx = paramString;
  }
  
  public StringParcel(String paramString)
  {
    mVersionCode = 1;
    zzvx = paramString;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzn.zza(this, paramParcel, paramInt);
  }
  
  public String zzfF()
  {
    return zzvx;
  }
}
