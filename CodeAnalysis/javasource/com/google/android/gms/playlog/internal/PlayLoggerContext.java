package com.google.android.gms.playlog.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class PlayLoggerContext
  implements SafeParcelable
{
  public static final zze CREATOR = new zze();
  public final String packageName;
  public final int versionCode;
  public final int zzaKR;
  public final int zzaKS;
  public final String zzaKT;
  public final String zzaKU;
  public final boolean zzaKV;
  public final String zzaKW;
  public final boolean zzaKX;
  public final int zzaKY;
  
  public PlayLoggerContext(int paramInt1, String paramString1, int paramInt2, int paramInt3, String paramString2, String paramString3, boolean paramBoolean1, String paramString4, boolean paramBoolean2, int paramInt4)
  {
    versionCode = paramInt1;
    packageName = paramString1;
    zzaKR = paramInt2;
    zzaKS = paramInt3;
    zzaKT = paramString2;
    zzaKU = paramString3;
    zzaKV = paramBoolean1;
    zzaKW = paramString4;
    zzaKX = paramBoolean2;
    zzaKY = paramInt4;
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
      if (!(paramObject instanceof PlayLoggerContext)) {
        break;
      }
      paramObject = (PlayLoggerContext)paramObject;
    } while ((versionCode == versionCode) && (packageName.equals(packageName)) && (zzaKR == zzaKR) && (zzaKS == zzaKS) && (zzw.equal(zzaKW, zzaKW)) && (zzw.equal(zzaKT, zzaKT)) && (zzw.equal(zzaKU, zzaKU)) && (zzaKV == zzaKV) && (zzaKX == zzaKX) && (zzaKY == zzaKY));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { Integer.valueOf(versionCode), packageName, Integer.valueOf(zzaKR), Integer.valueOf(zzaKS), zzaKW, zzaKT, zzaKU, Boolean.valueOf(zzaKV), Boolean.valueOf(zzaKX), Integer.valueOf(zzaKY) });
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("PlayLoggerContext[");
    localStringBuilder.append("versionCode=").append(versionCode).append(',');
    localStringBuilder.append("package=").append(packageName).append(',');
    localStringBuilder.append("packageVersionCode=").append(zzaKR).append(',');
    localStringBuilder.append("logSource=").append(zzaKS).append(',');
    localStringBuilder.append("logSourceName=").append(zzaKW).append(',');
    localStringBuilder.append("uploadAccount=").append(zzaKT).append(',');
    localStringBuilder.append("loggingId=").append(zzaKU).append(',');
    localStringBuilder.append("logAndroidId=").append(zzaKV).append(',');
    localStringBuilder.append("isAnonymous=").append(zzaKX).append(',');
    localStringBuilder.append("qosTier=").append(zzaKY);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
}
