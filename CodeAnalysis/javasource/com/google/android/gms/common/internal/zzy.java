package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzy
  implements Parcelable.Creator<ResolveAccountRequest>
{
  public zzy() {}
  
  static void zza(ResolveAccountRequest paramResolveAccountRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersionCode);
    zzb.zza(paramParcel, 2, paramResolveAccountRequest.getAccount(), paramInt, false);
    zzb.zzc(paramParcel, 3, paramResolveAccountRequest.getSessionId());
    zzb.zzH(paramParcel, i);
  }
  
  public ResolveAccountRequest zzaf(Parcel paramParcel)
  {
    int i = 0;
    int k = zza.zzaj(paramParcel);
    Account localAccount = null;
    int j = 0;
    if (paramParcel.dataPosition() < k)
    {
      int m = zza.zzai(paramParcel);
      switch (zza.zzbH(m))
      {
      default: 
        zza.zzb(paramParcel, m);
      }
      for (;;)
      {
        break;
        j = zza.zzg(paramParcel, m);
        continue;
        localAccount = (Account)zza.zza(paramParcel, m, Account.CREATOR);
        continue;
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new ResolveAccountRequest(j, localAccount, i);
  }
  
  public ResolveAccountRequest[] zzbE(int paramInt)
  {
    return new ResolveAccountRequest[paramInt];
  }
}
