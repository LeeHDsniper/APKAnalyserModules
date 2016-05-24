package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zze
  implements Parcelable.Creator<PasswordSpecification>
{
  public zze() {}
  
  static void zza(PasswordSpecification paramPasswordSpecification, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zza(paramParcel, 1, zzRq, false);
    zzb.zzc(paramParcel, 1000, mVersionCode);
    zzb.zzb(paramParcel, 2, zzRr, false);
    zzb.zza(paramParcel, 3, zzRs, false);
    zzb.zzc(paramParcel, 4, zzRt);
    zzb.zzc(paramParcel, 5, zzRu);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public PasswordSpecification zzH(Parcel paramParcel)
  {
    ArrayList localArrayList1 = null;
    int i = 0;
    int m = zza.zzaj(paramParcel);
    int j = 0;
    ArrayList localArrayList2 = null;
    String str = null;
    int k = 0;
    while (paramParcel.dataPosition() < m)
    {
      int n = zza.zzai(paramParcel);
      switch (zza.zzbH(n))
      {
      default: 
        zza.zzb(paramParcel, n);
        break;
      case 1: 
        str = zza.zzo(paramParcel, n);
        break;
      case 1000: 
        k = zza.zzg(paramParcel, n);
        break;
      case 2: 
        localArrayList2 = zza.zzC(paramParcel, n);
        break;
      case 3: 
        localArrayList1 = zza.zzB(paramParcel, n);
        break;
      case 4: 
        j = zza.zzg(paramParcel, n);
        break;
      case 5: 
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != m) {
      throw new zza.zza("Overread allowed size end=" + m, paramParcel);
    }
    return new PasswordSpecification(k, str, localArrayList2, localArrayList1, j, i);
  }
  
  public PasswordSpecification[] zzax(int paramInt)
  {
    return new PasswordSpecification[paramInt];
  }
}
