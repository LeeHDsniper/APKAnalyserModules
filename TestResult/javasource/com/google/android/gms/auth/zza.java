package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<AccountChangeEvent>
{
  public zza() {}
  
  static void zza(AccountChangeEvent paramAccountChangeEvent, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersion);
    zzb.zza(paramParcel, 2, zzQD);
    zzb.zza(paramParcel, 3, zzQE, false);
    zzb.zzc(paramParcel, 4, zzQF);
    zzb.zzc(paramParcel, 5, zzQG);
    zzb.zza(paramParcel, 6, zzQH, false);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public AccountChangeEvent zzA(Parcel paramParcel)
  {
    String str1 = null;
    int i = 0;
    int m = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    long l = 0L;
    int j = 0;
    String str2 = null;
    int k = 0;
    while (paramParcel.dataPosition() < m)
    {
      int n = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(n))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, n);
        break;
      case 1: 
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, n);
        break;
      case 2: 
        l = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, n);
        break;
      case 3: 
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, n);
        break;
      case 4: 
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, n);
        break;
      case 5: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, n);
        break;
      case 6: 
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != m) {
      throw new zza.zza("Overread allowed size end=" + m, paramParcel);
    }
    return new AccountChangeEvent(k, l, str2, j, i, str1);
  }
  
  public AccountChangeEvent[] zzaq(int paramInt)
  {
    return new AccountChangeEvent[paramInt];
  }
}
