package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzh
  implements Parcelable.Creator<AdSizeParcel>
{
  public zzh() {}
  
  static void zza(AdSizeParcel paramAdSizeParcel, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, zzsG, false);
    zzb.zzc(paramParcel, 3, height);
    zzb.zzc(paramParcel, 4, heightPixels);
    zzb.zza(paramParcel, 5, zzsH);
    zzb.zzc(paramParcel, 6, width);
    zzb.zzc(paramParcel, 7, widthPixels);
    zzb.zza(paramParcel, 8, zzsI, paramInt, false);
    zzb.zza(paramParcel, 9, zzsJ);
    zzb.zzH(paramParcel, i);
  }
  
  public AdSizeParcel zzc(Parcel paramParcel)
  {
    AdSizeParcel[] arrayOfAdSizeParcel = null;
    boolean bool1 = false;
    int i1 = zza.zzaj(paramParcel);
    int i = 0;
    int j = 0;
    boolean bool2 = false;
    int k = 0;
    int m = 0;
    String str = null;
    int n = 0;
    while (paramParcel.dataPosition() < i1)
    {
      int i2 = zza.zzai(paramParcel);
      switch (zza.zzbH(i2))
      {
      default: 
        zza.zzb(paramParcel, i2);
        break;
      case 1: 
        n = zza.zzg(paramParcel, i2);
        break;
      case 2: 
        str = zza.zzo(paramParcel, i2);
        break;
      case 3: 
        m = zza.zzg(paramParcel, i2);
        break;
      case 4: 
        k = zza.zzg(paramParcel, i2);
        break;
      case 5: 
        bool2 = zza.zzc(paramParcel, i2);
        break;
      case 6: 
        j = zza.zzg(paramParcel, i2);
        break;
      case 7: 
        i = zza.zzg(paramParcel, i2);
        break;
      case 8: 
        arrayOfAdSizeParcel = (AdSizeParcel[])zza.zzb(paramParcel, i2, AdSizeParcel.CREATOR);
        break;
      case 9: 
        bool1 = zza.zzc(paramParcel, i2);
      }
    }
    if (paramParcel.dataPosition() != i1) {
      throw new zza.zza("Overread allowed size end=" + i1, paramParcel);
    }
    return new AdSizeParcel(n, str, m, k, bool2, j, i, arrayOfAdSizeParcel, bool1);
  }
  
  public AdSizeParcel[] zzl(int paramInt)
  {
    return new AdSizeParcel[paramInt];
  }
}
