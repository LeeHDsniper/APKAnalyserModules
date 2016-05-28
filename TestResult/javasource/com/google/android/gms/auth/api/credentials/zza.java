package com.google.android.gms.auth.api.credentials;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zza
  implements Parcelable.Creator<Credential>
{
  public zza() {}
  
  static void zza(Credential paramCredential, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1001, paramCredential.zzlr(), false);
    zzb.zza(paramParcel, 1, paramCredential.getId(), false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zza(paramParcel, 2, paramCredential.getName(), false);
    zzb.zza(paramParcel, 3, paramCredential.getProfilePictureUri(), paramInt, false);
    zzb.zza(paramParcel, 1002, paramCredential.zzls(), false);
    zzb.zzc(paramParcel, 4, paramCredential.zzlt(), false);
    zzb.zza(paramParcel, 5, paramCredential.getPassword(), false);
    zzb.zza(paramParcel, 6, paramCredential.getAccountType(), false);
    zzb.zza(paramParcel, 7, paramCredential.getGeneratedPassword(), false);
    zzb.zza(paramParcel, 8, paramCredential.zzlu(), false);
    zzb.zzH(paramParcel, i);
  }
  
  public Credential zzD(Parcel paramParcel)
  {
    String str1 = null;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    int i = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    ArrayList localArrayList = null;
    Uri localUri = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
    String str8 = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(k))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1001: 
        str8 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 1: 
        str6 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 1000: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2: 
        str5 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 3: 
        localUri = (Uri)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, Uri.CREATOR);
        break;
      case 1002: 
        str7 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 4: 
        localArrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k, IdToken.CREATOR);
        break;
      case 5: 
        str4 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 6: 
        str3 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 7: 
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 8: 
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new Credential(i, str8, str7, str6, str5, localUri, localArrayList, str4, str3, str2, str1);
  }
  
  public Credential[] zzat(int paramInt)
  {
    return new Credential[paramInt];
  }
}
