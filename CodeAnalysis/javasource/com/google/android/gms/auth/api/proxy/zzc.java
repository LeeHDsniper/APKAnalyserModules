package com.google.android.gms.auth.api.proxy;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<ProxyResponse>
{
  public zzc() {}
  
  static void zza(ProxyResponse paramProxyResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, googlePlayServicesStatusCode);
    zzb.zzc(paramParcel, 1000, versionCode);
    zzb.zza(paramParcel, 2, recoveryAction, paramInt, false);
    zzb.zzc(paramParcel, 3, statusCode);
    zzb.zza(paramParcel, 4, zzRE, false);
    zzb.zza(paramParcel, 5, body, false);
    zzb.zzH(paramParcel, i);
  }
  
  public ProxyResponse zzM(Parcel paramParcel)
  {
    byte[] arrayOfByte = null;
    int i = 0;
    int m = zza.zzaj(paramParcel);
    Bundle localBundle = null;
    PendingIntent localPendingIntent = null;
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
        j = zza.zzg(paramParcel, n);
        break;
      case 1000: 
        k = zza.zzg(paramParcel, n);
        break;
      case 2: 
        localPendingIntent = (PendingIntent)zza.zza(paramParcel, n, PendingIntent.CREATOR);
        break;
      case 3: 
        i = zza.zzg(paramParcel, n);
        break;
      case 4: 
        localBundle = zza.zzq(paramParcel, n);
        break;
      case 5: 
        arrayOfByte = zza.zzr(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != m) {
      throw new zza.zza("Overread allowed size end=" + m, paramParcel);
    }
    return new ProxyResponse(k, j, localPendingIntent, i, localBundle, arrayOfByte);
  }
  
  public ProxyResponse[] zzaC(int paramInt)
  {
    return new ProxyResponse[paramInt];
  }
}
