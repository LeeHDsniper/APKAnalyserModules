package com.google.android.gms.ads.internal.overlay;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class AdLauncherIntentInfoParcel
  implements SafeParcelable
{
  public static final zzb CREATOR = new zzb();
  public final String intentAction;
  public final String mimeType;
  public final String packageName;
  public final String url;
  public final int versionCode;
  public final String zzAa;
  public final String zzzY;
  public final String zzzZ;
  
  public AdLauncherIntentInfoParcel(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    versionCode = paramInt;
    intentAction = paramString1;
    url = paramString2;
    mimeType = paramString3;
    packageName = paramString4;
    zzzY = paramString5;
    zzzZ = paramString6;
    zzAa = paramString7;
  }
  
  public AdLauncherIntentInfoParcel(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    this(1, paramString1, paramString2, paramString3, paramString4, paramString5, paramString6, paramString7);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}
