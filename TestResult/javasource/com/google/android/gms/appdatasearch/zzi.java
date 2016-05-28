package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<RegisterSectionInfo>
{
  public zzi() {}
  
  static void zza(RegisterSectionInfo paramRegisterSectionInfo, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, name, false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 2, zzPA, false);
    zzb.zza(paramParcel, 3, zzPB);
    zzb.zzc(paramParcel, 4, weight);
    zzb.zza(paramParcel, 5, zzPC);
    zzb.zza(paramParcel, 6, zzPD, false);
    zzb.zza(paramParcel, 7, zzPE, paramInt, false);
    zzb.zza(paramParcel, 8, zzPF, false);
    zzb.zza(paramParcel, 11, zzPG, false);
    zzb.zzH(paramParcel, i);
  }
  
  public RegisterSectionInfo[] zzal(int paramInt)
  {
    return new RegisterSectionInfo[paramInt];
  }
  
  public RegisterSectionInfo zzy(Parcel paramParcel)
  {
    boolean bool1 = false;
    String str1 = null;
    int k = zza.zzaj(paramParcel);
    int i = 1;
    int[] arrayOfInt = null;
    Feature[] arrayOfFeature = null;
    String str2 = null;
    boolean bool2 = false;
    String str3 = null;
    String str4 = null;
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
        str4 = zza.zzo(paramParcel, m);
        break;
      case 1000: 
        j = zza.zzg(paramParcel, m);
        break;
      case 2: 
        str3 = zza.zzo(paramParcel, m);
        break;
      case 3: 
        bool2 = zza.zzc(paramParcel, m);
        break;
      case 4: 
        i = zza.zzg(paramParcel, m);
        break;
      case 5: 
        bool1 = zza.zzc(paramParcel, m);
        break;
      case 6: 
        str2 = zza.zzo(paramParcel, m);
        break;
      case 7: 
        arrayOfFeature = (Feature[])zza.zzb(paramParcel, m, Feature.CREATOR);
        break;
      case 8: 
        arrayOfInt = zza.zzu(paramParcel, m);
        break;
      case 11: 
        str1 = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != k) {
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    }
    return new RegisterSectionInfo(j, str4, str3, bool2, i, bool1, str2, arrayOfFeature, arrayOfInt, str1);
  }
}
