package com.google.android.gms.signin;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class GoogleSignInAccount
  implements SafeParcelable
{
  public static final Parcelable.Creator<GoogleSignInAccount> CREATOR = new zza();
  final int versionCode;
  private String zzRn;
  private String zzaNX;
  private Uri zzaNY;
  private String zzahh;
  private String zzwj;
  
  GoogleSignInAccount(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, Uri paramUri)
  {
    versionCode = paramInt;
    zzwj = zzx.zzcs(paramString1);
    zzRn = paramString2;
    zzaNX = paramString3;
    zzahh = paramString4;
    zzaNY = paramUri;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getDisplayName()
  {
    return zzahh;
  }
  
  public String getEmail()
  {
    return zzaNX;
  }
  
  public String getId()
  {
    return zzwj;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
  
  public String zzlv()
  {
    return zzRn;
  }
  
  public Uri zzzm()
  {
    return zzaNY;
  }
}
