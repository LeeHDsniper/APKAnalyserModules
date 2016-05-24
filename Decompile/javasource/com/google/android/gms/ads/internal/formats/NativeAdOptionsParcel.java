package com.google.android.gms.ads.internal.formats;

import android.os.Parcel;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public class NativeAdOptionsParcel
  implements SafeParcelable
{
  public static final zzi CREATOR = new zzi();
  public final int versionCode;
  public final boolean zzwn;
  public final int zzwo;
  public final boolean zzwp;
  
  public NativeAdOptionsParcel(int paramInt1, boolean paramBoolean1, int paramInt2, boolean paramBoolean2)
  {
    versionCode = paramInt1;
    zzwn = paramBoolean1;
    zzwo = paramInt2;
    zzwp = paramBoolean2;
  }
  
  public NativeAdOptionsParcel(NativeAdOptions paramNativeAdOptions)
  {
    this(1, paramNativeAdOptions.shouldReturnUrlsForImageAssets(), paramNativeAdOptions.getImageOrientation(), paramNativeAdOptions.shouldRequestMultipleImages());
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }
}
