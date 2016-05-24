package com.google.android.gms.ads.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class InterstitialAdParameterParcel
  implements SafeParcelable
{
  public static final zzl CREATOR = new zzl();
  public final int versionCode;
  public final boolean zzpk;
  public final boolean zzpl;
  
  InterstitialAdParameterParcel(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    versionCode = paramInt;
    zzpk = paramBoolean1;
    zzpl = paramBoolean2;
  }
  
  public InterstitialAdParameterParcel(boolean paramBoolean1, boolean paramBoolean2)
  {
    versionCode = 1;
    zzpk = paramBoolean1;
    zzpl = paramBoolean2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzl.zza(this, paramParcel, paramInt);
  }
}
