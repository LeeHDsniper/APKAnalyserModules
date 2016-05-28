package com.google.android.gms.ads.internal.request;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class CapabilityParcel
  implements SafeParcelable
{
  public static final Parcelable.Creator<CapabilityParcel> CREATOR = new zzi();
  public final int versionCode;
  public final boolean zzEm;
  public final boolean zzEn;
  
  CapabilityParcel(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    versionCode = paramInt;
    zzEm = paramBoolean1;
    zzEn = paramBoolean2;
  }
  
  public CapabilityParcel(boolean paramBoolean1, boolean paramBoolean2)
  {
    this(1, paramBoolean1, paramBoolean2);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public Bundle toBundle()
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("iap_supported", zzEm);
    localBundle.putBoolean("default_iap_supported", zzEn);
    return localBundle;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }
}
