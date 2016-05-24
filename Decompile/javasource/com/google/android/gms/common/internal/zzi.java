package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<GetServiceRequest>
{
  public zzi() {}
  
  static void zza(GetServiceRequest paramGetServiceRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, version);
    zzb.zzc(paramParcel, 2, zzadn);
    zzb.zzc(paramParcel, 3, zzado);
    zzb.zza(paramParcel, 4, zzadp, false);
    zzb.zza(paramParcel, 5, zzadq, false);
    zzb.zza(paramParcel, 6, zzadr, paramInt, false);
    zzb.zza(paramParcel, 7, zzads, false);
    zzb.zza(paramParcel, 8, zzadt, paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public GetServiceRequest zzae(Parcel paramParcel)
  {
    int i = 0;
    Account localAccount = null;
    int m = zza.zzaj(paramParcel);
    Bundle localBundle = null;
    Scope[] arrayOfScope = null;
    IBinder localIBinder = null;
    String str = null;
    int j = 0;
    int k = 0;
    while (paramParcel.dataPosition() < m)
    {
      int n = zza.zzai(paramParcel);
      switch (zza.zzbH(n))
      {
      default: 
        zza.zzb(paramParcel, n);
        break;
      case 1: 
        k = zza.zzg(paramParcel, n);
        break;
      case 2: 
        j = zza.zzg(paramParcel, n);
        break;
      case 3: 
        i = zza.zzg(paramParcel, n);
        break;
      case 4: 
        str = zza.zzo(paramParcel, n);
        break;
      case 5: 
        localIBinder = zza.zzp(paramParcel, n);
        break;
      case 6: 
        arrayOfScope = (Scope[])zza.zzb(paramParcel, n, Scope.CREATOR);
        break;
      case 7: 
        localBundle = zza.zzq(paramParcel, n);
        break;
      case 8: 
        localAccount = (Account)zza.zza(paramParcel, n, Account.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != m) {
      throw new zza.zza("Overread allowed size end=" + m, paramParcel);
    }
    return new GetServiceRequest(k, j, i, str, localIBinder, arrayOfScope, localBundle, localAccount);
  }
  
  public GetServiceRequest[] zzby(int paramInt)
  {
    return new GetServiceRequest[paramInt];
  }
}
