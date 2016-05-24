package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<SafeParcelResponse>
{
  public zze() {}
  
  static void zza(SafeParcelResponse paramSafeParcelResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, paramSafeParcelResponse.getVersionCode());
    zzb.zza(paramParcel, 2, paramSafeParcelResponse.zzpt(), false);
    zzb.zza(paramParcel, 3, paramSafeParcelResponse.zzpu(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public SafeParcelResponse zzat(Parcel paramParcel)
  {
    FieldMappingDictionary localFieldMappingDictionary = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    Parcel localParcel = null;
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
        localParcel = zza.zzD(paramParcel, k);
        break;
      case 3: 
        localFieldMappingDictionary = (FieldMappingDictionary)zza.zza(paramParcel, k, FieldMappingDictionary.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new SafeParcelResponse(i, localParcel, localFieldMappingDictionary);
  }
  
  public SafeParcelResponse[] zzbS(int paramInt)
  {
    return new SafeParcelResponse[paramInt];
  }
}
