package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzd
  implements Parcelable.Creator<DocumentSection>
{
  public zzd() {}
  
  static void zza(DocumentSection paramDocumentSection, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, zzPe, false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 3, zzPf, paramInt, false);
    zzb.zzc(paramParcel, 4, zzPg);
    zzb.zza(paramParcel, 5, zzPh, false);
    zzb.zzH(paramParcel, i);
  }
  
  public DocumentSection[] zzaf(int paramInt)
  {
    return new DocumentSection[paramInt];
  }
  
  public DocumentSection zzu(Parcel paramParcel)
  {
    byte[] arrayOfByte = null;
    int k = zza.zzaj(paramParcel);
    int j = 0;
    int i = -1;
    RegisterSectionInfo localRegisterSectionInfo = null;
    String str = null;
    while (paramParcel.dataPosition() < k)
    {
      int m = zza.zzai(paramParcel);
      switch (zza.zzbH(m))
      {
      default: 
        zza.zzb(paramParcel, m);
        break;
      case 1: 
        str = zza.zzo(paramParcel, m);
        break;
      case 1000: 
        j = zza.zzg(paramParcel, m);
        break;
      case 3: 
        localRegisterSectionInfo = (RegisterSectionInfo)zza.zza(paramParcel, m, RegisterSectionInfo.CREATOR);
        break;
      case 4: 
        i = zza.zzg(paramParcel, m);
        break;
      case 5: 
        arrayOfByte = zza.zzr(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new DocumentSection(j, str, localRegisterSectionInfo, i, arrayOfByte);
  }
}
