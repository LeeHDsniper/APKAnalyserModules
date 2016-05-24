package com.google.android.gms.ads.internal.overlay;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<AdLauncherIntentInfoParcel>
{
  public zzb() {}
  
  static void zza(AdLauncherIntentInfoParcel paramAdLauncherIntentInfoParcel, Parcel paramParcel, int paramInt)
  {
    paramInt = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, versionCode);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, intentAction, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, url, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, mimeType, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 5, packageName, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 6, zzzY, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 7, zzzZ, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 8, zzAa, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, paramInt);
  }
  
  public AdLauncherIntentInfoParcel zzg(Parcel paramParcel)
  {
    String str1 = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
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
        str7 = zza.zzo(paramParcel, k);
        break;
      case 3: 
        str6 = zza.zzo(paramParcel, k);
        break;
      case 4: 
        str5 = zza.zzo(paramParcel, k);
        break;
      case 5: 
        str4 = zza.zzo(paramParcel, k);
        break;
      case 6: 
        str3 = zza.zzo(paramParcel, k);
        break;
      case 7: 
        str2 = zza.zzo(paramParcel, k);
        break;
      case 8: 
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new AdLauncherIntentInfoParcel(i, str7, str6, str5, str4, str3, str2, str1);
  }
  
  public AdLauncherIntentInfoParcel[] zzs(int paramInt)
  {
    return new AdLauncherIntentInfoParcel[paramInt];
  }
}
