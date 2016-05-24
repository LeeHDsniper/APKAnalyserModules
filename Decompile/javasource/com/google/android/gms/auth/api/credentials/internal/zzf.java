package com.google.android.gms.auth.api.credentials.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.auth.api.credentials.Credential;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzf
  implements Parcelable.Creator<DeleteRequest>
{
  public zzf() {}
  
  static void zza(DeleteRequest paramDeleteRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, paramDeleteRequest.getCredential(), paramInt, false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zzH(paramParcel, i);
  }
  
  public DeleteRequest zzI(Parcel paramParcel)
  {
    int j = zza.zzaj(paramParcel);
    int i = 0;
    Credential localCredential = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
        break;
      case 1: 
        localCredential = (Credential)zza.zza(paramParcel, k, Credential.CREATOR);
        break;
      case 1000: 
        i = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new DeleteRequest(i, localCredential);
  }
  
  public DeleteRequest[] zzay(int paramInt)
  {
    return new DeleteRequest[paramInt];
  }
}
