package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<ConverterWrapper>
{
  public zza() {}
  
  static void zza(ConverterWrapper paramConverterWrapper, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, paramConverterWrapper.getVersionCode());
    zzb.zza(paramParcel, 2, paramConverterWrapper.zzoW(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public ConverterWrapper zzam(Parcel paramParcel)
  {
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    int i = 0;
    StringToIntConverter localStringToIntConverter = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(k))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2: 
        localStringToIntConverter = (StringToIntConverter)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, StringToIntConverter.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new ConverterWrapper(i, localStringToIntConverter);
  }
  
  public ConverterWrapper[] zzbL(int paramInt)
  {
    return new ConverterWrapper[paramInt];
  }
}
