package com.google.android.gms.ads.internal.reward.mediation.client;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<RewardItemParcel>
{
  public zzc() {}
  
  static void zza(RewardItemParcel paramRewardItemParcel, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, type, false);
    zzb.zzc(paramParcel, 3, zzGE);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public RewardItemParcel[] zzK(int paramInt)
  {
    return new RewardItemParcel[paramInt];
  }
  
  public RewardItemParcel zzp(Parcel paramParcel)
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
    return new RewardItemParcel(i, str, j);
  }
}
