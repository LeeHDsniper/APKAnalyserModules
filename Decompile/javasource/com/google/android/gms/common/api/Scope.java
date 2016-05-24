package com.google.android.gms.common.api;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class Scope
  implements SafeParcelable
{
  public static final Parcelable.Creator<Scope> CREATOR = new zzm();
  final int mVersionCode;
  private final String zzaaC;
  
  Scope(int paramInt, String paramString)
  {
    zzx.zzh(paramString, "scopeUri must not be null or empty");
    mVersionCode = paramInt;
    zzaaC = paramString;
  }
  
  public Scope(String paramString)
  {
    this(1, paramString);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if (!(paramObject instanceof Scope)) {
      return false;
    }
    return zzaaC.equals(zzaaC);
  }
  
  public int hashCode()
  {
    return zzaaC.hashCode();
  }
  
  public String toString()
  {
    return zzaaC;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }
  
  public String zznG()
  {
    return zzaaC;
  }
}
