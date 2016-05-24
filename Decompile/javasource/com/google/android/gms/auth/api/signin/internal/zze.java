package com.google.android.gms.auth.api.signin.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.auth.api.signin.EmailSignInConfig;
import com.google.android.gms.auth.api.signin.FacebookSignInConfig;
import com.google.android.gms.auth.api.signin.GoogleSignInConfig;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<SignInConfiguration>
{
  public zze() {}
  
  static void zza(SignInConfiguration paramSignInConfiguration, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzak(paramParcel);
    zzb.zzc(paramParcel, 1, versionCode);
    zzb.zza(paramParcel, 2, paramSignInConfiguration.zzlF(), false);
    zzb.zza(paramParcel, 3, paramSignInConfiguration.zzlG(), false);
    zzb.zza(paramParcel, 4, paramSignInConfiguration.zzlH(), paramInt, false);
    zzb.zza(paramParcel, 5, paramSignInConfiguration.zzlI(), paramInt, false);
    zzb.zza(paramParcel, 6, paramSignInConfiguration.zzlJ(), paramInt, false);
    zzb.zza(paramParcel, 7, paramSignInConfiguration.zzlK(), false);
    zzb.zzH(paramParcel, i);
  }
  
  public SignInConfiguration zzQ(Parcel paramParcel)
  {
    String str1 = null;
    int j = zza.zzaj(paramParcel);
    int i = 0;
    FacebookSignInConfig localFacebookSignInConfig = null;
    GoogleSignInConfig localGoogleSignInConfig = null;
    EmailSignInConfig localEmailSignInConfig = null;
    String str2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      switch (zza.zzbH(k))
      {
      default: 
        zza.zzb(paramParcel, k);
        break;
      case 1: 
        i = zza.zzg(paramParcel, k);
        break;
      case 2: 
        str3 = zza.zzo(paramParcel, k);
        break;
      case 3: 
        str2 = zza.zzo(paramParcel, k);
        break;
      case 4: 
        localEmailSignInConfig = (EmailSignInConfig)zza.zza(paramParcel, k, EmailSignInConfig.CREATOR);
        break;
      case 5: 
        localGoogleSignInConfig = (GoogleSignInConfig)zza.zza(paramParcel, k, GoogleSignInConfig.CREATOR);
        break;
      case 6: 
        localFacebookSignInConfig = (FacebookSignInConfig)zza.zza(paramParcel, k, FacebookSignInConfig.CREATOR);
        break;
      case 7: 
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    return new SignInConfiguration(i, str3, str2, localEmailSignInConfig, localGoogleSignInConfig, localFacebookSignInConfig, str1);
  }
  
  public SignInConfiguration[] zzaG(int paramInt)
  {
    return new SignInConfiguration[paramInt];
  }
}
