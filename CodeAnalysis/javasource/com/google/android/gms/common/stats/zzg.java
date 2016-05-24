package com.google.android.gms.common.stats;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzg
  implements Parcelable.Creator<WakeLockEvent>
{
  public zzg() {}
  
  static void zza(WakeLockEvent paramWakeLockEvent, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersionCode);
    zzb.zza(paramParcel, 2, paramWakeLockEvent.getTimeMillis());
    zzb.zza(paramParcel, 4, paramWakeLockEvent.zzpE(), false);
    zzb.zzc(paramParcel, 5, paramWakeLockEvent.zzpG());
    zzb.zzb(paramParcel, 6, paramWakeLockEvent.zzpH(), false);
    zzb.zza(paramParcel, 8, paramWakeLockEvent.zzpC());
    zzb.zza(paramParcel, 10, paramWakeLockEvent.zzpF(), false);
    zzb.zzc(paramParcel, 11, paramWakeLockEvent.getEventType());
    zzb.zza(paramParcel, 12, paramWakeLockEvent.zzpA(), false);
    zzb.zza(paramParcel, 13, paramWakeLockEvent.zzpJ(), false);
    zzb.zzc(paramParcel, 14, paramWakeLockEvent.zzpI());
    zzb.zza(paramParcel, 15, paramWakeLockEvent.zzpK());
    zzb.zzH(paramParcel, paramInt);
  }
  
  public WakeLockEvent zzav(Parcel paramParcel)
  {
    int n = zza.zzaj(paramParcel);
    int m = 0;
    long l2 = 0L;
    int k = 0;
    String str4 = null;
    int j = 0;
    ArrayList localArrayList = null;
    String str3 = null;
    long l1 = 0L;
    int i = 0;
    String str2 = null;
    String str1 = null;
    float f = 0.0F;
    while (paramParcel.dataPosition() < n)
    {
      int i1 = zza.zzai(paramParcel);
      switch (zza.zzbH(i1))
      {
      case 3: 
      case 7: 
      case 9: 
      default: 
        zza.zzb(paramParcel, i1);
        break;
      case 1: 
        m = zza.zzg(paramParcel, i1);
        break;
      case 2: 
        l2 = zza.zzi(paramParcel, i1);
        break;
      case 4: 
        str4 = zza.zzo(paramParcel, i1);
        break;
      case 5: 
        j = zza.zzg(paramParcel, i1);
        break;
      case 6: 
        localArrayList = zza.zzC(paramParcel, i1);
        break;
      case 8: 
        l1 = zza.zzi(paramParcel, i1);
        break;
      case 10: 
        str2 = zza.zzo(paramParcel, i1);
        break;
      case 11: 
        k = zza.zzg(paramParcel, i1);
        break;
      case 12: 
        str3 = zza.zzo(paramParcel, i1);
        break;
      case 13: 
        str1 = zza.zzo(paramParcel, i1);
        break;
      case 14: 
        i = zza.zzg(paramParcel, i1);
        break;
      case 15: 
        f = zza.zzl(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != n) {
      throw new zza.zza("Overread allowed size end=" + n, paramParcel);
    }
    return new WakeLockEvent(m, l2, k, str4, j, localArrayList, str3, l1, i, str2, str1, f);
  }
  
  public WakeLockEvent[] zzbU(int paramInt)
  {
    return new WakeLockEvent[paramInt];
  }
}
