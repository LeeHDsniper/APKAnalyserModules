package com.google.android.gms.ads.internal.purchase;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<GInAppPurchaseManagerInfoParcel>
{
  public zza() {}
  
  static void zza(GInAppPurchaseManagerInfoParcel paramGInAppPurchaseManagerInfoParcel, Parcel paramParcel, int paramInt)
  {
    paramInt = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 3, paramGInAppPurchaseManagerInfoParcel.zzfd(), false);
    zzb.zza(paramParcel, 4, paramGInAppPurchaseManagerInfoParcel.zzfe(), false);
    zzb.zza(paramParcel, 5, paramGInAppPurchaseManagerInfoParcel.zzff(), false);
    zzb.zza(paramParcel, 6, paramGInAppPurchaseManagerInfoParcel.zzfc(), false);
    zzb.zzH(paramParcel, paramInt);
  }
  
  public GInAppPurchaseManagerInfoParcel zzi(Parcel paramParcel)
  {
    IBinder localIBinder1 = null;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    int i = 0;
    IBinder localIBinder2 = null;
    IBinder localIBinder3 = null;
    IBinder localIBinder4 = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(k))
      {
      case 2: 
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1: 
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 3: 
        localIBinder4 = com.google.android.gms.common.internal.safeparcel.zza.zzp(paramParcel, k);
        break;
      case 4: 
        localIBinder3 = com.google.android.gms.common.internal.safeparcel.zza.zzp(paramParcel, k);
        break;
      case 5: 
        localIBinder2 = com.google.android.gms.common.internal.safeparcel.zza.zzp(paramParcel, k);
        break;
      case 6: 
        localIBinder1 = com.google.android.gms.common.internal.safeparcel.zza.zzp(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new GInAppPurchaseManagerInfoParcel(i, localIBinder4, localIBinder3, localIBinder2, localIBinder1);
  }
  
  public GInAppPurchaseManagerInfoParcel[] zzx(int paramInt)
  {
    return new GInAppPurchaseManagerInfoParcel[paramInt];
  }
}
