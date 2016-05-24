package com.google.android.gms.playlog.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<PlayLoggerContext>
{
  public zze() {}
  
  static void zza(PlayLoggerContext paramPlayLoggerContext, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, packageName, false);
    zzb.zzc(paramParcel, 3, zzaKR);
    zzb.zzc(paramParcel, 4, zzaKS);
    zzb.zza(paramParcel, 5, zzaKT, false);
    zzb.zza(paramParcel, 6, zzaKU, false);
    zzb.zza(paramParcel, 7, zzaKV);
    zzb.zza(paramParcel, 8, zzaKW, false);
    zzb.zza(paramParcel, 9, zzaKX);
    zzb.zzc(paramParcel, 10, zzaKY);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public PlayLoggerContext zzfQ(Parcel paramParcel)
  {
    String str1 = null;
    int i = 0;
    int n = zza.zzaj(paramParcel);
    boolean bool2 = true;
    boolean bool1 = false;
    String str2 = null;
    String str3 = null;
    int j = 0;
    int k = 0;
    String str4 = null;
    int m = 0;
    while (paramParcel.dataPosition() < n)
    {
      int i1 = zza.zzai(paramParcel);
      switch (zza.zzbH(i1))
      {
      default: 
        zza.zzb(paramParcel, i1);
        break;
      case 1: 
        m = zza.zzg(paramParcel, i1);
        break;
      case 2: 
        str4 = zza.zzo(paramParcel, i1);
        break;
      case 3: 
        k = zza.zzg(paramParcel, i1);
        break;
      case 4: 
        j = zza.zzg(paramParcel, i1);
        break;
      case 5: 
        str3 = zza.zzo(paramParcel, i1);
        break;
      case 6: 
        str2 = zza.zzo(paramParcel, i1);
        break;
      case 7: 
        bool2 = zza.zzc(paramParcel, i1);
        break;
      case 8: 
        str1 = zza.zzo(paramParcel, i1);
        break;
      case 9: 
        bool1 = zza.zzc(paramParcel, i1);
        break;
      case 10: 
        i = zza.zzg(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != n) {
      throw new zza.zza("Overread allowed size end=" + n, paramParcel);
    }
    return new PlayLoggerContext(m, str4, k, j, str3, str2, bool2, str1, bool1, i);
  }
  
  public PlayLoggerContext[] zziE(int paramInt)
  {
    return new PlayLoggerContext[paramInt];
  }
}
