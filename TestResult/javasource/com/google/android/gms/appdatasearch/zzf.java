package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzf
  implements Parcelable.Creator<GetRecentContextCall.Request>
{
  public zzf() {}
  
  static void zza(GetRecentContextCall.Request paramRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, zzPl, paramInt, false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 2, zzPm);
    zzb.zza(paramParcel, 3, zzPn);
    zzb.zza(paramParcel, 4, zzPo);
    zzb.zza(paramParcel, 5, zzPp, false);
    zzb.zzH(paramParcel, i);
  }
  
  public GetRecentContextCall.Request[] zzah(int paramInt)
  {
    return new GetRecentContextCall.Request[paramInt];
  }
  
  public GetRecentContextCall.Request zzw(Parcel paramParcel)
  {
    String str = null;
    boolean bool1 = false;
    int j = zza.zzaj(paramParcel);
    boolean bool2 = false;
    boolean bool3 = false;
    Account localAccount = null;
    int i = 0;
    while (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
        break;
      case 1: 
        localAccount = (Account)zza.zza(paramParcel, k, Account.CREATOR);
        break;
      case 1000: 
        i = zza.zzg(paramParcel, k);
        break;
      case 2: 
        bool3 = zza.zzc(paramParcel, k);
        break;
      case 3: 
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 4: 
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 5: 
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new GetRecentContextCall.Request(i, localAccount, bool3, bool2, bool1, str);
  }
}
