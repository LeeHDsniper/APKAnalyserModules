package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzz
  implements Parcelable.Creator<ResolveAccountResponse>
{
  public zzz() {}
  
  static void zza(ResolveAccountResponse paramResolveAccountResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, mVersionCode);
    zzb.zza(paramParcel, 2, zzacC, false);
    zzb.zza(paramParcel, 3, paramResolveAccountResponse.zzoP(), paramInt, false);
    zzb.zza(paramParcel, 4, paramResolveAccountResponse.zzoQ());
    zzb.zza(paramParcel, 5, paramResolveAccountResponse.zzoR());
    zzb.zzH(paramParcel, i);
  }
  
  public ResolveAccountResponse zzag(Parcel paramParcel)
  {
    ConnectionResult localConnectionResult = null;
    boolean bool1 = false;
    int j = zza.zzaj(paramParcel);
    boolean bool2 = false;
    IBinder localIBinder = null;
    int i = 0;
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
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 3: 
        localConnectionResult = (ConnectionResult)zza.zza(paramParcel, k, ConnectionResult.CREATOR);
        break;
      case 4: 
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 5: 
        bool1 = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new ResolveAccountResponse(i, localIBinder, localConnectionResult, bool2, bool1);
  }
  
  public ResolveAccountResponse[] zzbF(int paramInt)
  {
    return new ResolveAccountResponse[paramInt];
  }
}
