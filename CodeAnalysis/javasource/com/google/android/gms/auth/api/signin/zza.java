package com.google.android.gms.auth.api.signin;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<EmailSignInConfig>
{
  public zza() {}
  
  static void zza(EmailSignInConfig paramEmailSignInConfig, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, paramEmailSignInConfig.zzlA(), paramInt, false);
    zzb.zza(paramParcel, 3, paramEmailSignInConfig.zzlC(), false);
    zzb.zza(paramParcel, 4, paramEmailSignInConfig.zzlB(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }
  
  public EmailSignInConfig zzN(Parcel paramParcel)
  {
    Uri localUri = null;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzaj(paramParcel);
    int i = 0;
    Object localObject2 = null;
    Object localObject1 = null;
    if (paramParcel.dataPosition() < j)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzai(paramParcel);
      Object localObject3;
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzbH(k))
      {
      default: 
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        localObject3 = localObject2;
        localObject2 = localObject1;
        localObject1 = localObject3;
      }
      for (;;)
      {
        localObject3 = localObject2;
        localObject2 = localObject1;
        localObject1 = localObject3;
        break;
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        localObject3 = localObject1;
        localObject1 = localObject2;
        localObject2 = localObject3;
        continue;
        localObject3 = (Uri)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, Uri.CREATOR);
        localObject1 = localObject2;
        localObject2 = localObject3;
        continue;
        localObject3 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        localObject2 = localObject1;
        localObject1 = localObject3;
        continue;
        localUri = (Uri)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, Uri.CREATOR);
        localObject3 = localObject1;
        localObject1 = localObject2;
        localObject2 = localObject3;
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new EmailSignInConfig(i, localObject1, localObject2, localUri);
  }
  
  public EmailSignInConfig[] zzaD(int paramInt)
  {
    return new EmailSignInConfig[paramInt];
  }
}
