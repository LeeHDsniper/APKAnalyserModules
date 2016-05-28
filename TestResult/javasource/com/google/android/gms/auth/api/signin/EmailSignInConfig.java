package com.google.android.gms.auth.api.signin;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Patterns;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailSignInConfig
  implements SafeParcelable
{
  public static final Parcelable.Creator<EmailSignInConfig> CREATOR = new zza();
  final int versionCode;
  private final Uri zzRO;
  private String zzRP;
  private Uri zzRQ;
  
  EmailSignInConfig(int paramInt, Uri paramUri1, String paramString, Uri paramUri2)
  {
    zzx.zzb(paramUri1, "Server widget url cannot be null in order to use email/password sign in.");
    zzx.zzh(paramUri1.toString(), "Server widget url cannot be null in order to use email/password sign in.");
    zzx.zzb(Patterns.WEB_URL.matcher(paramUri1.toString()).matches(), "Invalid server widget url");
    versionCode = paramInt;
    zzRO = paramUri1;
    zzRP = paramString;
    zzRQ = paramUri2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
  
  public Uri zzlA()
  {
    return zzRO;
  }
  
  public Uri zzlB()
  {
    return zzRQ;
  }
  
  public String zzlC()
  {
    return zzRP;
  }
}
