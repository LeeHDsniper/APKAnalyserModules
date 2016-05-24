package com.google.android.gms.playlog.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<LogEvent>
{
  public zzc() {}
  
  static void zza(LogEvent paramLogEvent, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, zzaKG);
    zzb.zza(paramParcel, 3, tag, false);
    zzb.zza(paramParcel, 4, zzaKI, false);
    zzb.zza(paramParcel, 5, zzaKJ, false);
    zzb.zza(paramParcel, 6, zzaKH);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public LogEvent zzfP(Parcel paramParcel)
  {
    long l1 = 0L;
    Bundle localBundle = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    byte[] arrayOfByte = null;
    String str = null;
    long l2 = 0L;
    while (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
        break;
      case 1: 
        i = zza.zzg(paramParcel, k);
        break;
      case 2: 
        l2 = zza.zzi(paramParcel, k);
        break;
      case 3: 
        str = zza.zzo(paramParcel, k);
        break;
      case 4: 
        arrayOfByte = zza.zzr(paramParcel, k);
        break;
      case 5: 
        localBundle = zza.zzq(paramParcel, k);
        break;
      case 6: 
        l1 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new LogEvent(i, l2, l1, str, arrayOfByte, localBundle);
  }
  
  public LogEvent[] zziD(int paramInt)
  {
    return new LogEvent[paramInt];
  }
}
