package com.google.android.gms.common.stats;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<ConnectionEvent>
{
  public zza() {}
  
  static void zza(ConnectionEvent paramConnectionEvent, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersionCode);
    zzb.zza(paramParcel, 2, paramConnectionEvent.getTimeMillis());
    zzb.zza(paramParcel, 4, paramConnectionEvent.zzpv(), false);
    zzb.zza(paramParcel, 5, paramConnectionEvent.zzpw(), false);
    zzb.zza(paramParcel, 6, paramConnectionEvent.zzpx(), false);
    zzb.zza(paramParcel, 7, paramConnectionEvent.zzpy(), false);
    zzb.zza(paramParcel, 8, paramConnectionEvent.zzpz(), false);
    zzb.zza(paramParcel, 10, paramConnectionEvent.zzpC());
    zzb.zza(paramParcel, 11, paramConnectionEvent.zzpB());
    zzb.zzc(paramParcel, 12, paramConnectionEvent.getEventType());
    zzb.zza(paramParcel, 13, paramConnectionEvent.zzpA(), false);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public ConnectionEvent zzau(Parcel paramParcel)
  {
    int k = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    int j = 0;
    long l3 = 0L;
    int i = 0;
    String str6 = null;
    String str5 = null;
    String str4 = null;
    String str3 = null;
    String str2 = null;
    String str1 = null;
    long l2 = 0L;
    long l1 = 0L;
    while (paramParcel.dataPosition() < k)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(m))
      {
      case 3: 
      case 9: 
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1: 
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2: 
        l3 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, m);
        break;
      case 4: 
        str6 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 5: 
        str5 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 6: 
        str4 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 7: 
        str3 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 8: 
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 10: 
        l2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, m);
        break;
      case 11: 
        l1 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, m);
        break;
      case 12: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 13: 
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new ConnectionEvent(j, l3, i, str6, str5, str4, str3, str2, str1, l2, l1);
  }
  
  public ConnectionEvent[] zzbT(int paramInt)
  {
    return new ConnectionEvent[paramInt];
  }
}
