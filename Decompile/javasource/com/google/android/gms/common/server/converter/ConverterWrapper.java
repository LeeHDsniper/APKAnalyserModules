package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.server.response.FastJsonResponse.zza;

public class ConverterWrapper
  implements SafeParcelable
{
  public static final zza CREATOR = new zza();
  private final int mVersionCode;
  private final StringToIntConverter zzaeK;
  
  ConverterWrapper(int paramInt, StringToIntConverter paramStringToIntConverter)
  {
    mVersionCode = paramInt;
    zzaeK = paramStringToIntConverter;
  }
  
  private ConverterWrapper(StringToIntConverter paramStringToIntConverter)
  {
    mVersionCode = 1;
    zzaeK = paramStringToIntConverter;
  }
  
  public static ConverterWrapper zza(FastJsonResponse.zza<?, ?> paramZza)
  {
    if ((paramZza instanceof StringToIntConverter)) {
      return new ConverterWrapper((StringToIntConverter)paramZza);
    }
    throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
  }
  
  public int describeContents()
  {
    zza localZza = CREATOR;
    return 0;
  }
  
  int getVersionCode()
  {
    return mVersionCode;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza localZza = CREATOR;
    zza.zza(this, paramParcel, paramInt);
  }
  
  StringToIntConverter zzoW()
  {
    return zzaeK;
  }
  
  public FastJsonResponse.zza<?, ?> zzoX()
  {
    if (zzaeK != null) {
      return zzaeK;
    }
    throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
  }
}
