package com.google.android.gms.auth;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<AccountChangeEventsRequest>
{
  public zzb() {}
  
  static void zza(AccountChangeEventsRequest paramAccountChangeEventsRequest, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, mVersion);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 2, zzQG);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, zzQE, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, zzOY, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }
  
  public AccountChangeEventsRequest zzB(Parcel paramParcel)
  {
    Account localAccount = null;
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
        j = zza.zzg(paramParcel, m);
        break;
      case 3: 
        str = zza.zzo(paramParcel, m);
        break;
      case 4: 
        localAccount = (Account)zza.zza(paramParcel, m, Account.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new AccountChangeEventsRequest(i, j, str, localAccount);
  }
  
  public AccountChangeEventsRequest[] zzar(int paramInt)
  {
    return new AccountChangeEventsRequest[paramInt];
  }
}
