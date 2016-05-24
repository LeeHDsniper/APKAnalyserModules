package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<CredentialPickerConfig>
{
  public zzb() {}
  
  static void zza(CredentialPickerConfig paramCredentialPickerConfig, Parcel paramParcel, int paramInt)
  {
    paramInt = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 1, paramCredentialPickerConfig.shouldShowAddAccountButton());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1000, mVersionCode);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramCredentialPickerConfig.shouldShowCancelButton());
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, paramInt);
  }
  
  public CredentialPickerConfig zzE(Parcel paramParcel)
  {
    boolean bool2 = false;
    int j = zza.zzaj(paramParcel);
    boolean bool1 = false;
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
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 1000: 
        i = zza.zzg(paramParcel, k);
        break;
      case 2: 
        bool2 = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new CredentialPickerConfig(i, bool1, bool2);
  }
  
  public CredentialPickerConfig[] zzau(int paramInt)
  {
    return new CredentialPickerConfig[paramInt];
  }
}
