package com.google.android.gms.search;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class GoogleNowAuthState
  implements SafeParcelable
{
  public static final Parcelable.Creator<GoogleNowAuthState> CREATOR = new zza();
  final int mVersionCode;
  String zzaNM;
  String zzaNN;
  long zzaNO;
  
  GoogleNowAuthState(int paramInt, String paramString1, String paramString2, long paramLong)
  {
    mVersionCode = paramInt;
    zzaNM = paramString1;
    zzaNN = paramString2;
    zzaNO = paramLong;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAccessToken()
  {
    return zzaNN;
  }
  
  public String getAuthCode()
  {
    return zzaNM;
  }
  
  public long getNextAllowedTimeMillis()
  {
    return zzaNO;
  }
  
  public String toString()
  {
    return "mAuthCode = " + zzaNM + "\nmAccessToken = " + zzaNN + "\nmNextAllowedTimeMillis = " + zzaNO;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}
