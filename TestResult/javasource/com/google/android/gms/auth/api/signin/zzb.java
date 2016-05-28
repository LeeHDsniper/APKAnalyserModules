package com.google.android.gms.auth.api.signin;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import java.util.ArrayList;

public class zzb
  implements Parcelable.Creator<FacebookSignInConfig>
{
  public zzb() {}
  
  static void zza(FacebookSignInConfig paramFacebookSignInConfig, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzak(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, versionCode);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramFacebookSignInConfig.zzlD(), paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzb(paramParcel, 3, paramFacebookSignInConfig.zzlE(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }
  
  public FacebookSignInConfig zzO(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    Intent localIntent = null;
    if (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
      }
      for (;;)
      {
        break;
        i = zza.zzg(paramParcel, k);
        continue;
        localIntent = (Intent)zza.zza(paramParcel, k, Intent.CREATOR);
        continue;
        localArrayList = zza.zzC(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new FacebookSignInConfig(i, localIntent, localArrayList);
  }
  
  public FacebookSignInConfig[] zzaE(int paramInt)
  {
    return new FacebookSignInConfig[paramInt];
  }
}
