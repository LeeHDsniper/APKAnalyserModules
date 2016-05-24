package com.google.android.gms.search;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<GoogleNowAuthState>
{
  public zza() {}
  
  static void zza(GoogleNowAuthState paramGoogleNowAuthState, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, paramGoogleNowAuthState.getAuthCode(), false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 2, paramGoogleNowAuthState.getAccessToken(), false);
    zzb.zza(paramParcel, 3, paramGoogleNowAuthState.getNextAllowedTimeMillis());
    zzb.zzH(paramParcel, paramInt);
  }
  
  public GoogleNowAuthState zzgh(Parcel paramParcel)
  {
    String str1 = null;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    int i = 0;
    long l = 0L;
    String str2 = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(k))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1: 
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 1000: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2: 
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 3: 
        l = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new GoogleNowAuthState(i, str2, str1, l);
  }
  
  public GoogleNowAuthState[] zziW(int paramInt)
  {
    return new GoogleNowAuthState[paramInt];
  }
}
