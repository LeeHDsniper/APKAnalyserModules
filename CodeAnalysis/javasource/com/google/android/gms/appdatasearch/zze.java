package com.google.android.gms.appdatasearch;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<Feature>
{
  public zze() {}
  
  static void zza(Feature paramFeature, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, id);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 2, zzPi, false);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public Feature[] zzag(int paramInt)
  {
    return new Feature[paramInt];
  }
  
  public Feature zzv(Parcel paramParcel)
  {
    int j = 0;
    int k = zza.zzaj(paramParcel);
    Bundle localBundle = null;
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
        j = zza.zzg(paramParcel, m);
        break;
      case 1000: 
        i = zza.zzg(paramParcel, m);
        break;
      case 2: 
        localBundle = zza.zzq(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new Feature(i, j, localBundle);
  }
}
