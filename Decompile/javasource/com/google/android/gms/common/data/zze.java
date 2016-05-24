package com.google.android.gms.common.data;

import android.database.CursorWindow;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<DataHolder>
{
  public zze() {}
  
  static void zza(DataHolder paramDataHolder, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, paramDataHolder.zznU(), false);
    zzb.zzc(paramParcel, 1000, paramDataHolder.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataHolder.zznV(), paramInt, false);
    zzb.zzc(paramParcel, 3, paramDataHolder.getStatusCode());
    zzb.zza(paramParcel, 4, paramDataHolder.zznP(), false);
    zzb.zzH(paramParcel, i);
  }
  
  public DataHolder zzaa(Parcel paramParcel)
  {
    int i = 0;
    Bundle localBundle = null;
    int k = zza.zzaj(paramParcel);
    CursorWindow[] arrayOfCursorWindow = null;
    String[] arrayOfString = null;
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
        arrayOfString = zza.zzA(paramParcel, m);
        break;
      case 1000: 
        j = zza.zzg(paramParcel, m);
        break;
      case 2: 
        arrayOfCursorWindow = (CursorWindow[])zza.zzb(paramParcel, m, CursorWindow.CREATOR);
        break;
      case 3: 
        i = zza.zzg(paramParcel, m);
        break;
      case 4: 
        localBundle = zza.zzq(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    paramParcel = new DataHolder(j, arrayOfString, arrayOfCursorWindow, i, localBundle);
    paramParcel.zznT();
    return paramParcel;
  }
  
  public DataHolder[] zzbq(int paramInt)
  {
    return new DataHolder[paramInt];
  }
}
