package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzae
  implements Parcelable.Creator<SearchAdRequestParcel>
{
  public zzae() {}
  
  static void zza(SearchAdRequestParcel paramSearchAdRequestParcel, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zzc(paramParcel, 2, zztA);
    zzb.zzc(paramParcel, 3, backgroundColor);
    zzb.zzc(paramParcel, 4, zztB);
    zzb.zzc(paramParcel, 5, zztC);
    zzb.zzc(paramParcel, 6, zztD);
    zzb.zzc(paramParcel, 7, zztE);
    zzb.zzc(paramParcel, 8, zztF);
    zzb.zzc(paramParcel, 9, zztG);
    zzb.zza(paramParcel, 10, zztH, false);
    zzb.zzc(paramParcel, 11, zztI);
    zzb.zza(paramParcel, 12, zztJ, false);
    zzb.zzc(paramParcel, 13, zztK);
    zzb.zzc(paramParcel, 14, zztL);
    zzb.zza(paramParcel, 15, zztM, false);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public SearchAdRequestParcel zze(Parcel paramParcel)
  {
    int i8 = zza.zzaj(paramParcel);
    int i7 = 0;
    int i6 = 0;
    int i5 = 0;
    int i4 = 0;
    int i3 = 0;
    int i2 = 0;
    int i1 = 0;
    int n = 0;
    int m = 0;
    String str3 = null;
    int k = 0;
    String str2 = null;
    int j = 0;
    int i = 0;
    String str1 = null;
    while (paramParcel.dataPosition() < i8)
    {
      int i9 = zza.zzai(paramParcel);
      switch (zza.zzbH(i9))
      {
      default: 
        zza.zzb(paramParcel, i9);
        break;
      case 1: 
        i7 = zza.zzg(paramParcel, i9);
        break;
      case 2: 
        i6 = zza.zzg(paramParcel, i9);
        break;
      case 3: 
        i5 = zza.zzg(paramParcel, i9);
        break;
      case 4: 
        i4 = zza.zzg(paramParcel, i9);
        break;
      case 5: 
        i3 = zza.zzg(paramParcel, i9);
        break;
      case 6: 
        i2 = zza.zzg(paramParcel, i9);
        break;
      case 7: 
        i1 = zza.zzg(paramParcel, i9);
        break;
      case 8: 
        n = zza.zzg(paramParcel, i9);
        break;
      case 9: 
        m = zza.zzg(paramParcel, i9);
        break;
      case 10: 
        str3 = zza.zzo(paramParcel, i9);
        break;
      case 11: 
        k = zza.zzg(paramParcel, i9);
        break;
      case 12: 
        str2 = zza.zzo(paramParcel, i9);
        break;
      case 13: 
        j = zza.zzg(paramParcel, i9);
        break;
      case 14: 
        i = zza.zzg(paramParcel, i9);
        break;
      case 15: 
        str1 = zza.zzo(paramParcel, i9);
      }
    }
    if (paramParcel.dataPosition() != i8) {
      throw new zza.zza("Overread allowed size end=" + i8, paramParcel);
    }
    return new SearchAdRequestParcel(i7, i6, i5, i4, i3, i2, i1, n, m, str3, k, str2, j, i, str1);
  }
  
  public SearchAdRequestParcel[] zzo(int paramInt)
  {
    return new SearchAdRequestParcel[paramInt];
  }
}
