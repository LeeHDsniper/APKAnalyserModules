package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<GetRecentContextCall.Response>
{
  public zzg() {}
  
  static void zza(GetRecentContextCall.Response paramResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 1, zzPv, paramInt, false);
    zzb.zzc(paramParcel, 2, zzPw, false);
    zzb.zza(paramParcel, 3, zzPx, false);
    zzb.zzH(paramParcel, i);
  }
  
  public GetRecentContextCall.Response[] zzai(int paramInt)
  {
    return new GetRecentContextCall.Response[paramInt];
  }
  
  public GetRecentContextCall.Response zzx(Parcel paramParcel)
  {
    String[] arrayOfString = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    Object localObject2 = null;
    Object localObject1 = null;
    if (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      Object localObject3;
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
        localObject3 = localObject2;
        localObject2 = localObject1;
        localObject1 = localObject3;
      }
      for (;;)
      {
        localObject3 = localObject2;
        localObject2 = localObject1;
        localObject1 = localObject3;
        break;
        i = zza.zzg(paramParcel, k);
        localObject3 = localObject1;
        localObject1 = localObject2;
        localObject2 = localObject3;
        continue;
        localObject3 = (Status)zza.zza(paramParcel, k, Status.CREATOR);
        localObject1 = localObject2;
        localObject2 = localObject3;
        continue;
        localObject3 = zza.zzc(paramParcel, k, UsageInfo.CREATOR);
        localObject2 = localObject1;
        localObject1 = localObject3;
        continue;
        arrayOfString = zza.zzA(paramParcel, k);
        localObject3 = localObject1;
        localObject1 = localObject2;
        localObject2 = localObject3;
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new GetRecentContextCall.Response(i, localObject1, localObject2, arrayOfString);
  }
}
