package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<StringToIntConverter.Entry>
{
  public zzc() {}
  
  static void zza(StringToIntConverter.Entry paramEntry, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, zzaeO, false);
    zzb.zzc(paramParcel, 3, zzaeP);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public StringToIntConverter.Entry zzao(Parcel paramParcel)
  {
    int j = 0;
    int k = zza.zzaj(paramParcel);
    String str = null;
    int i = 0;
    while (paramParcel.dataPosition() < k)
    {
      int m = zza.zzai(paramParcel);
      switch (zza.zzbH(m))
      {
      default: 
        zza.zzb(paramParcel, m);
        break;
      case 1: 
        i = zza.zzg(paramParcel, m);
        break;
      case 2: 
        str = zza.zzo(paramParcel, m);
        break;
      case 3: 
        j = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new StringToIntConverter.Entry(i, str, j);
  }
  
  public StringToIntConverter.Entry[] zzbN(int paramInt)
  {
    return new StringToIntConverter.Entry[paramInt];
  }
}
