package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class MobileAdsSettingsParcel
  implements SafeParcelable
{
  public static final zzad CREATOR = new zzad();
  public final int versionCode;
  public final boolean zzty;
  public final String zztz;
  
  public MobileAdsSettingsParcel(int paramInt, boolean paramBoolean, String paramString)
  {
    versionCode = paramInt;
    zzty = paramBoolean;
    zztz = paramString;
  }
  
  public MobileAdsSettingsParcel(zzab paramZzab)
  {
    this(1, paramZzab.isGoogleAnalyticsEnabled(), paramZzab.getTrackingId());
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzad.zza(this, paramParcel, paramInt);
  }
}
