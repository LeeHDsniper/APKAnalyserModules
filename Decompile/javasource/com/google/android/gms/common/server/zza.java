package com.google.android.gms.common.server;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<FavaDiagnosticsEntity>
{
  public zza() {}
  
  static void zza(FavaDiagnosticsEntity paramFavaDiagnosticsEntity, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersionCode);
    zzb.zza(paramParcel, 2, zzaeI, false);
    zzb.zzc(paramParcel, 3, zzaeJ);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public FavaDiagnosticsEntity zzal(Parcel paramParcel)
  {
    int j = 0;
    int k = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    String str = null;
    int i = 0;
    while (paramParcel.dataPosition() < k)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(m))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2: 
        str = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 3: 
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new FavaDiagnosticsEntity(i, str, j);
  }
  
  public FavaDiagnosticsEntity[] zzbK(int paramInt)
  {
    return new FavaDiagnosticsEntity[paramInt];
  }
}
