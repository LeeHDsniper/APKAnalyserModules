package com.google.android.gms.auth.api.credentials;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import java.util.Collections;
import java.util.List;

public class Credential
  implements SafeParcelable
{
  public static final Parcelable.Creator<Credential> CREATOR = new zza();
  private final String mName;
  final int mVersionCode;
  private final String zzRa;
  private final String zzRb;
  private final Uri zzRc;
  private final List<IdToken> zzRd;
  private final String zzRe;
  private final String zzRf;
  private final String zzRg;
  private final String zzRh;
  private final String zzwj;
  
  Credential(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, Uri paramUri, List<IdToken> paramList, String paramString5, String paramString6, String paramString7, String paramString8)
  {
    mVersionCode = paramInt;
    zzRa = paramString1;
    zzRb = paramString2;
    zzwj = ((String)zzx.zzv(paramString3));
    mName = paramString4;
    zzRc = paramUri;
    if (paramList == null) {}
    for (paramString1 = Collections.emptyList();; paramString1 = Collections.unmodifiableList(paramList))
    {
      zzRd = paramString1;
      zzRe = paramString5;
      zzRf = paramString6;
      zzRg = paramString7;
      zzRh = paramString8;
      return;
    }
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof Credential)) {
        return false;
      }
      paramObject = (Credential)paramObject;
    } while ((TextUtils.equals(zzwj, zzwj)) && (TextUtils.equals(mName, mName)) && (zzw.equal(zzRc, zzRc)) && (TextUtils.equals(zzRe, zzRe)) && (TextUtils.equals(zzRf, zzRf)) && (TextUtils.equals(zzRg, zzRg)));
    return false;
  }
  
  public String getAccountType()
  {
    return zzRf;
  }
  
  public String getGeneratedPassword()
  {
    return zzRg;
  }
  
  public String getId()
  {
    return zzwj;
  }
  
  public String getName()
  {
    return mName;
  }
  
  public String getPassword()
  {
    return zzRe;
  }
  
  public Uri getProfilePictureUri()
  {
    return zzRc;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { zzwj, mName, zzRc, zzRe, zzRf, zzRg });
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
  
  public String zzlr()
  {
    return zzRa;
  }
  
  public String zzls()
  {
    return zzRb;
  }
  
  public List<IdToken> zzlt()
  {
    return zzRd;
  }
  
  public String zzlu()
  {
    return zzRh;
  }
}
