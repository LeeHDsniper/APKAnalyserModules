package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class IdToken
  implements SafeParcelable
{
  public static final Parcelable.Creator<IdToken> CREATOR = new zzd();
  final int mVersionCode;
  private final String zzRf;
  private final String zzRn;
  
  IdToken(int paramInt, String paramString1, String paramString2)
  {
    mVersionCode = paramInt;
    zzRf = paramString1;
    zzRn = paramString2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAccountType()
  {
    return zzRf;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }
  
  public String zzlv()
  {
    return zzRn;
  }
}
