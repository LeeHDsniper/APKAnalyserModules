package com.google.android.gms.auth.api.proxy;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<ProxyRequest>
{
  public zzb() {}
  
  static void zza(ProxyRequest paramProxyRequest, Parcel paramParcel, int paramInt)
  {
    paramInt = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 1, url, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1000, versionCode);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 2, httpMethod);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, timeoutMillis);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, body, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 5, zzRE, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, paramInt);
  }
  
  public ProxyRequest zzL(Parcel paramParcel)
  {
    int i = 0;
    Bundle localBundle = null;
    int k = zza.zzaj(paramParcel);
    long l = 0L;
    byte[] arrayOfByte = null;
    String str = null;
    int j = 0;
    while (paramParcel.dataPosition() < k)
    {
      int m = zza.zzai(paramParcel);
      switch (zza.zzbH(m))
      {
      default: 
        zza.zzb(paramParcel, m);
        break;
      case 1: 
        str = zza.zzo(paramParcel, m);
        break;
      case 1000: 
        j = zza.zzg(paramParcel, m);
        break;
      case 2: 
        i = zza.zzg(paramParcel, m);
        break;
      case 3: 
        l = zza.zzi(paramParcel, m);
        break;
      case 4: 
        arrayOfByte = zza.zzr(paramParcel, m);
        break;
      case 5: 
        localBundle = zza.zzq(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new ProxyRequest(j, str, i, l, arrayOfByte, localBundle);
  }
  
  public ProxyRequest[] zzaB(int paramInt)
  {
    return new ProxyRequest[paramInt];
  }
}
