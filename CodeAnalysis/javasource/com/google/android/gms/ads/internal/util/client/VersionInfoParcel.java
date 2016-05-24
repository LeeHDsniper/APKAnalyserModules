package com.google.android.gms.ads.internal.util.client;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class VersionInfoParcel
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  public final int versionCode;
  public int zzIA;
  public int zzIB;
  public boolean zzIC;
  public String zzIz;
  
  public VersionInfoParcel(int paramInt1, int paramInt2, boolean paramBoolean) {}
  
  VersionInfoParcel(int paramInt1, String paramString, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    versionCode = paramInt1;
    zzIz = paramString;
    zzIA = paramInt2;
    zzIB = paramInt3;
    zzIC = paramBoolean;
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
