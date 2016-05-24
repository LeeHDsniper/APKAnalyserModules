package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzl
  implements Parcelable.Creator<LargeParcelTeleporter>
{
  public zzl() {}
  
  static void zza(LargeParcelTeleporter paramLargeParcelTeleporter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersionCode);
    zzb.zza(paramParcel, 2, zzEo, paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public LargeParcelTeleporter[] zzF(int paramInt)
  {
    return new LargeParcelTeleporter[paramInt];
  }
  
  public LargeParcelTeleporter zzm(Parcel paramParcel)
  {
    int j = zza.zzaj(paramParcel);
    int i = 0;
    ParcelFileDescriptor localParcelFileDescriptor = null;
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
        localParcelFileDescriptor = (ParcelFileDescriptor)zza.zza(paramParcel, k, ParcelFileDescriptor.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new LargeParcelTeleporter(i, localParcelFileDescriptor);
  }
}
