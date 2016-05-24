package com.google.android.gms.common.images;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<WebImage>
{
  public zzb() {}
  
  static void zza(WebImage paramWebImage, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramWebImage.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramWebImage.getUrl(), paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 3, paramWebImage.getWidth());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 4, paramWebImage.getHeight());
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }
  
  public WebImage zzab(Parcel paramParcel)
  {
    int i = 0;
    int m = zza.zzaj(paramParcel);
    Uri localUri = null;
    int j = 0;
    int k = 0;
    if (paramParcel.dataPosition() < m)
    {
      int n = zza.zzai(paramParcel);
      switch (zza.zzbH(n))
      {
      default: 
        zza.zzb(paramParcel, n);
      }
      for (;;)
      {
        break;
        k = zza.zzg(paramParcel, n);
        continue;
        localUri = (Uri)zza.zza(paramParcel, n, Uri.CREATOR);
        continue;
        j = zza.zzg(paramParcel, n);
        continue;
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != m) {
      throw new zza.zza("Overread allowed size end=" + m, paramParcel);
    }
    return new WebImage(k, localUri, j, i);
  }
  
  public WebImage[] zzbu(int paramInt)
  {
    return new WebImage[paramInt];
  }
}
