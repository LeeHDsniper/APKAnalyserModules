package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<CredentialRequest>
{
  public zzc() {}
  
  static void zza(CredentialRequest paramCredentialRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, paramCredentialRequest.getSupportsPasswordLogin());
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 2, paramCredentialRequest.getAccountTypes(), false);
    zzb.zza(paramParcel, 3, paramCredentialRequest.getCredentialPickerConfig(), paramInt, false);
    zzb.zza(paramParcel, 4, paramCredentialRequest.getCredentialHintPickerConfig(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public CredentialRequest zzF(Parcel paramParcel)
  {
    boolean bool = false;
    CredentialPickerConfig localCredentialPickerConfig1 = null;
    int j = zza.zzaj(paramParcel);
    CredentialPickerConfig localCredentialPickerConfig2 = null;
    String[] arrayOfString = null;
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
        bool = zza.zzc(paramParcel, k);
        break;
      case 1000: 
        i = zza.zzg(paramParcel, k);
        break;
      case 2: 
        arrayOfString = zza.zzA(paramParcel, k);
        break;
      case 3: 
        localCredentialPickerConfig2 = (CredentialPickerConfig)zza.zza(paramParcel, k, CredentialPickerConfig.CREATOR);
        break;
      case 4: 
        localCredentialPickerConfig1 = (CredentialPickerConfig)zza.zza(paramParcel, k, CredentialPickerConfig.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new CredentialRequest(i, bool, arrayOfString, localCredentialPickerConfig2, localCredentialPickerConfig1);
  }
  
  public CredentialRequest[] zzav(int paramInt)
  {
    return new CredentialRequest[paramInt];
  }
}
