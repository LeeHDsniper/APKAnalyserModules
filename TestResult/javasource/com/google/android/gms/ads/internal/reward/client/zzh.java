package com.google.android.gms.ads.internal.reward.client;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzh
  implements Parcelable.Creator<RewardedVideoAdRequestParcel>
{
  public zzh() {}
  
  static void zza(RewardedVideoAdRequestParcel paramRewardedVideoAdRequestParcel, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, zzDy, paramInt, false);
    zzb.zza(paramParcel, 3, zzpZ, false);
    zzb.zzH(paramParcel, i);
  }
  
  public RewardedVideoAdRequestParcel[] zzI(int paramInt)
  {
    return new RewardedVideoAdRequestParcel[paramInt];
  }
  
  public RewardedVideoAdRequestParcel zzo(Parcel paramParcel)
  {
    String str = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    AdRequestParcel localAdRequestParcel = null;
    if (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
      }
      for (;;)
      {
        break;
        i = zza.zzg(paramParcel, k);
        continue;
        localAdRequestParcel = (AdRequestParcel)zza.zza(paramParcel, k, AdRequestParcel.CREATOR);
        continue;
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new RewardedVideoAdRequestParcel(i, localAdRequestParcel, str);
  }
}
