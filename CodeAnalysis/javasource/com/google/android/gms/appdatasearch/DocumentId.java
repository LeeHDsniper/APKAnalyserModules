package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class DocumentId
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  final int mVersionCode;
  final String zzOZ;
  final String zzPa;
  final String zzPb;
  
  DocumentId(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    mVersionCode = paramInt;
    zzOZ = paramString1;
    zzPa = paramString2;
    zzPb = paramString3;
  }
  
  public int describeContents()
  {
    zzc localZzc = CREATOR;
    return 0;
  }
  
  public String toString()
  {
    return String.format("DocumentId[packageName=%s, corpusName=%s, uri=%s]", new Object[] { zzOZ, zzPa, zzPb });
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc localZzc = CREATOR;
    zzc.zza(this, paramParcel, paramInt);
  }
}
