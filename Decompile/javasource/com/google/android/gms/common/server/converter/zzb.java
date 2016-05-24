package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import java.util.ArrayList;

public class zzb
  implements Parcelable.Creator<StringToIntConverter>
{
  public zzb() {}
  
  static void zza(StringToIntConverter paramStringToIntConverter, Parcel paramParcel, int paramInt)
  {
    paramInt = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramStringToIntConverter.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 2, paramStringToIntConverter.zzoY(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, paramInt);
  }
  
  public StringToIntConverter zzan(Parcel paramParcel)
  {
    int j = zza.zzaj(paramParcel);
    int i = 0;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
        break;
      case 1: 
        i = zza.zzg(paramParcel, k);
        break;
      case 2: 
        localArrayList = zza.zzc(paramParcel, k, StringToIntConverter.Entry.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new StringToIntConverter(i, localArrayList);
  }
  
  public StringToIntConverter[] zzbM(int paramInt)
  {
    return new StringToIntConverter[paramInt];
  }
}
