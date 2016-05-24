package com.google.android.gms.auth.api.proxy;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<ProxyGrpcRequest>
{
  public zza() {}
  
  static void zza(ProxyGrpcRequest paramProxyGrpcRequest, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, hostname, false);
    zzb.zzc(paramParcel, 1000, versionCode);
    zzb.zzc(paramParcel, 2, port);
    zzb.zza(paramParcel, 3, timeoutMillis);
    zzb.zza(paramParcel, 4, body, false);
    zzb.zza(paramParcel, 5, method, false);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public ProxyGrpcRequest zzK(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int k = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    long l = 0L;
    byte[] arrayOfByte = null;
    String str2 = null;
    int j = 0;
    while (paramParcel.dataPosition() < k)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(m))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1: 
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 1000: 
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 3: 
        l = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, m);
        break;
      case 4: 
        arrayOfByte = com.google.android.gms.common.internal.safeparcel.zza.zzr(paramParcel, m);
        break;
      case 5: 
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new ProxyGrpcRequest(j, str2, i, l, arrayOfByte, str1);
  }
  
  public ProxyGrpcRequest[] zzaA(int paramInt)
  {
    return new ProxyGrpcRequest[paramInt];
  }
}
