package com.google.android.gms.auth.api.signin.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.auth.api.signin.EmailSignInConfig;
import com.google.android.gms.auth.api.signin.FacebookSignInConfig;
import com.google.android.gms.auth.api.signin.GoogleSignInConfig;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class SignInConfiguration
  implements SafeParcelable
{
  public static final Parcelable.Creator<SignInConfiguration> CREATOR = new zze();
  final int versionCode;
  private final String zzRT;
  private String zzRU;
  private EmailSignInConfig zzRV;
  private GoogleSignInConfig zzRW;
  private FacebookSignInConfig zzRX;
  private String zzRY;
  
  SignInConfiguration(int paramInt, String paramString1, String paramString2, EmailSignInConfig paramEmailSignInConfig, GoogleSignInConfig paramGoogleSignInConfig, FacebookSignInConfig paramFacebookSignInConfig, String paramString3)
  {
    versionCode = paramInt;
    zzRT = zzx.zzcs(paramString1);
    zzRU = paramString2;
    zzRV = paramEmailSignInConfig;
    zzRW = paramGoogleSignInConfig;
    zzRX = paramFacebookSignInConfig;
    zzRY = paramString3;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
  
  public String zzlF()
  {
    return zzRT;
  }
  
  public String zzlG()
  {
    return zzRU;
  }
  
  public EmailSignInConfig zzlH()
  {
    return zzRV;
  }
  
  public GoogleSignInConfig zzlI()
  {
    return zzRW;
  }
  
  public FacebookSignInConfig zzlJ()
  {
    return zzRX;
  }
  
  public String zzlK()
  {
    return zzRY;
  }
}
